import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/core/service/socket/socket_service.dart';
import 'package:money_mate/data/models/message_model.dart';
import 'package:money_mate/data/repositories/conversation_repository.dart';
import 'package:money_mate/data/repositories/messages_repository.dart';
import 'package:money_mate/domain/entities/conversation.dart';
import 'package:money_mate/domain/entities/message.dart';
import 'package:money_mate/shared/enums/socket_enum.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ConversationRepository _conversationRepository =
      getIt<ConversationRepository>();
  final MessagesRepository _messagesRepository = getIt<MessagesRepository>();
  final SocketService _socketService = getIt<SocketService>();
  ChatBloc() : super(const ChatState.initial()) {
    on<_GetChatData>(_onGetChatData);
    on<_Connect>(_onConnect);
    on<_Disconnect>(_onDisconnect);
    on<_UpdateMessages>(_onUpdateMessages);
  }

  Future<void> _onGetChatData(
      _GetChatData event, Emitter<ChatState> emit) async {
    emit(const ChatState.loading());
    await Future.delayed(const Duration(seconds: 2));

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
          (messages) => emit(ChatState.loaded(
              ChatLoadedData(messages: messages, conversation: conversation))),
        );
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(ChatState.error(e.toString()));
      }
    }
  }

// Add new Message
  void _onUpdateMessages(_UpdateMessages event, Emitter<ChatState> emit) {
    state.maybeMap(
      loaded: (data) {
        emit(ChatState.loaded(data.chatData
            .copyWith(messages: [...data.chatData.messages, event.message])));
      },
      orElse: () {},
    );
  }

  // Join conversation
  void _joinConversation(String conversationId) {
    _socketService.emit(SocketEnum.joinRoom.name, {"room": conversationId});
  }

  // Leave conversation
  void leaveConversation(String conversationId) {
    _socketService.emit(SocketEnum.leaveRoom.name, {"room": conversationId});
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

  void _onDisconnect(_Disconnect event, Emitter<ChatState> emit) {
    _socketService.disconnect();
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
