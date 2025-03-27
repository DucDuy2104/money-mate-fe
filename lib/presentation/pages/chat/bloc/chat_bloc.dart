import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/conversation_repository.dart';
import 'package:money_mate/domain/entities/conversation.dart';

part 'chat_event.dart';
part 'chat_state.dart';
part 'chat_bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ConversationRepository _conversationRepository =
      getIt<ConversationRepository>();
  ChatBloc() : super(const ChatState.initial()) {
    on<_GetConversation>(_onGetConversation);
  }

  void _onGetConversation(
      _GetConversation event, Emitter<ChatState> emit) async {
    try {
      emit(const ChatState.loading());
      await Future.delayed(const Duration(seconds: 2));
      final result = await _conversationRepository.getBotConversation();
      result.fold((failure) {
        emit(ChatState.error(failure.message));
        return;
      }, (conversation) {
        emit(ChatState.loaded(conversation));
        return;
      });
    } catch (e) {
      emit(ChatState.error(e.toString()));
      return;
    }
  }
}
