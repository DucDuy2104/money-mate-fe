import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/core/service/socket/socket_service.dart';
import 'package:money_mate/data/models/message_model.dart';
import 'package:money_mate/data/repositories/conversation_repository.dart';
import 'package:money_mate/data/repositories/messages_repository.dart';
import 'package:money_mate/data/repositories/transactions_repository.dart';
import 'package:money_mate/domain/entities/conversation.dart';
import 'package:money_mate/domain/entities/message.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/enums/socket_enum.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ConversationRepository _conversationRepository =
      getIt<ConversationRepository>();
  final MessagesRepository _messagesRepository = getIt<MessagesRepository>();
  final TransactionsRepository _transactionsRepository =
      getIt<TransactionsRepository>();
  final SocketService _socketService = getIt<SocketService>();
  ChatBloc() : super(const ChatState.initial()) {
    on<_GetChatData>(_onGetChatData);
    on<_Connect>(_onConnect);
    on<_UpdateMessages>(_onUpdateMessages);
    on<_LeaveRoom>(_leaveConversation);
    on<_CancelTransaction>(_onCancelTransaction);
    on<_EnableTransaction>(_onEnableTransaction);
    on<_SetMessageLoading>(_onSetMessageLoading);
    on<_SetMessageCancel>(_onSetMessageCancel);
    on<_SetMessageEnable>(_onSetMessageEnable);
  }

  Future<void> _onGetChatData(
      _GetChatData event, Emitter<ChatState> emit) async {
    emit(const ChatState.loading());
    try {
      final conversationResult =
          await _conversationRepository.getBotConversation();

      if (conversationResult.isLeft()) {
        final failure = conversationResult.fold((l) => l, (_) => null);
        if (failure != null && !emit.isDone) {
          emit(ChatState.error(failure.message));
        }
        return;
      }

      final conversation = conversationResult.fold((_) => null, (r) => r);
      if (conversation == null) return;
      _joinConversation(conversation.id);
      final messagesResult =
          await _messagesRepository.getMessages(conversation.id);

      if (!emit.isDone) {
        messagesResult.fold(
          (failure) => emit(ChatState.error(failure.message)),
          (messages) => emit(ChatState.loaded(ChatLoadedData(
              messages: messages.reversed.toList(),
              conversation: conversation))),
        );
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(ChatState.error(e.toString()));
      }
    }
  }

  // Call Api to cancel transaction
  void _onCancelTransaction(
      _CancelTransaction event, Emitter<ChatState> emit) async {
    add(_SetMessageLoading(event.message.id, true));
    try {
      final transactionResult = await _transactionsRepository
          .cancelTransaction(event.message.transaction!.id);
      transactionResult.fold((failure) {
        AppToast.error(event.context, 'Không thể huỷ giao dịch');
      }, (transaction) {
        add(_SetMessageCancel(event.message.id));
        event.onSuccess();
      });
    } catch (e) {
      debugPrint('Bug: ${e.toString()}');
    }
  }

  // Call Api to enable transaction
  void _onEnableTransaction(
      _EnableTransaction event, Emitter<ChatState> emit) async {
    add(_SetMessageLoading(event.message.id, true));
    try {
      final transactionResult = await _transactionsRepository
          .enableTransaction(event.message.transaction!.id);
      transactionResult.fold((failure) {
        AppToast.error(event.context, 'Không thể kích hoạt giao dịch');
      }, (transaction) {
        add(_SetMessageEnable(event.message.id));
        event.onSuccess();
      });
    } catch (e) {
      debugPrint('Bug: ${e.toString()}');
    }
  }

  // Set transaction state to canceled
  void _onSetMessageCancel(
      _SetMessageCancel event, Emitter<ChatState> emit) async {
    state.maybeMap(
      loaded: (data) => emit(
        ChatState.loaded(data.chatData.copyWith(
            messages: _updateTransactionInMessageList(
                data.chatData.messages,
                event.id,
                (transaction) =>
                    transaction.copyWith(isCancel: true, isLoading: false)))),
      ),
      orElse: () {},
    );
  }

  // Set transaction state to enabled
  void _onSetMessageEnable(
      _SetMessageEnable event, Emitter<ChatState> emit) async {
    state.maybeMap(
      loaded: (data) => emit(
        ChatState.loaded(data.chatData.copyWith(
            messages: _updateTransactionInMessageList(
                data.chatData.messages,
                event.id,
                (transaction) =>
                    transaction.copyWith(isCancel: false, isLoading: false)))),
      ),
      orElse: () {},
    );
  }

  // Set transaction state to loading
  void _onSetMessageLoading(
      _SetMessageLoading event, Emitter<ChatState> emit) async {
    state.maybeMap(
      loaded: (data) => emit(
        ChatState.loaded(data.chatData.copyWith(
            messages: _updateTransactionInMessageList(
                data.chatData.messages,
                event.id,
                (transaction) => transaction.copyWith(isLoading: true)))),
      ),
      orElse: () {},
    );
  }

  // Helper function to update a transaction inside a message in the list
  List<Message> _updateTransactionInMessageList(
    List<Message> messages,
    String messageId,
    Transaction Function(Transaction) updateFunction,
  ) {
    return messages.map((message) {
      if (message.id == messageId && message.transaction != null) {
        return message.copyWith(
          transaction: updateFunction(message.transaction!),
        );
      }
      return message;
    }).toList();
  }

// Add new Message
  void _onUpdateMessages(_UpdateMessages event, Emitter<ChatState> emit) {
    state.maybeMap(
      loaded: (data) {
        emit(ChatState.loaded(data.chatData
            .copyWith(messages: [event.message, ...data.chatData.messages])));
      },
      orElse: () {},
    );
  }

  // Join conversation
  void _joinConversation(String conversationId) {
    _socketService.emit(SocketEnum.joinRoom.name, {"room": conversationId});
  }

  // Leave conversation
  void _leaveConversation(_LeaveRoom event, Emitter<ChatState> emit) {
    state.maybeMap(
        loaded: (data) => _socketService.emit(
            SocketEnum.leaveRoom.name, {"room": data.chatData.conversation.id}),
        orElse: () {});
  }

  // Send message
  void sendMessage(String content) {
    state.maybeMap(
        loaded: (data) {
          _socketService.emit(SocketEnum.sendMessage.name, {
            "conversation": data.chatData.conversation.id,
            "content": content,
            "type": "text"
          });
        },
        orElse: () {});
  }

  void _onConnect(_Connect event, Emitter<ChatState> emit) {
    _socketService.initSocket();

    // Recieve new message
    _socketService.listen(SocketEnum.newMessage.name, (data) {
      final message = MessageModel.fromJson(data).toEntity();
      debugPrint('received message: ${message.toString()}');

      // Use add() method to emit a new event instead of trying to use the emit object directly
      state.maybeMap(
        loaded: (data) {
          // Create and add a new event to handle the message update
          add(_UpdateMessages(message));
        },
        orElse: () {},
      );
    });
  }
}
