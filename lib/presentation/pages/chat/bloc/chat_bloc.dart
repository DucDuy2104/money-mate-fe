import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/conversation_repository.dart';
import 'package:money_mate/data/repositories/messages_repository.dart';
import 'package:money_mate/domain/entities/conversation.dart';
import 'package:money_mate/domain/entities/message.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ConversationRepository _conversationRepository = getIt<ConversationRepository>();
  final MessagesRepository _messagesRepository = getIt<MessagesRepository>();
  
  ChatBloc() : super(const ChatState.initial()) {
    on<_GetChatData>(_onGetChatData);
  }

  Future<void> _onGetChatData(_GetChatData event, Emitter<ChatState> emit) async {
    emit(const ChatState.loading());
    await Future.delayed(const Duration(seconds: 2));
    
    try {
      final conversationResult = await _conversationRepository.getBotConversation();
      
      if (conversationResult.isLeft()) {
        final failure = conversationResult.fold((l) => l, (_) => null);
        if (failure != null && !emit.isDone) {
          emit(ChatState.error(failure.message));
        }
        return;
      }
      
      final conversation = conversationResult.fold((_) => null, (r) => r);
      if (conversation == null) return;
      
      final messagesResult = await _messagesRepository.getMessages(conversation.id);
      
      if (!emit.isDone) {
        messagesResult.fold(
          (failure) => emit(ChatState.error(failure.message)),
          (messages) => emit(ChatState.loaded(
            ChatLoadedData(messages: messages, conversation: conversation)
          )),
        );
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(ChatState.error(e.toString()));
      }
    }
  }
}