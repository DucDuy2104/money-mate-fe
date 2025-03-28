part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState.initial() = _Initial;
  const factory ChatState.loading() = _Loading;
  const factory ChatState.loaded(ChatLoadedData chatData) = _Loaded;
  const factory ChatState.error(String error) = _Error;
}

@freezed
class ChatLoadedData with _$ChatLoadedData {
  const factory ChatLoadedData({
    required List<Message> messages,
    required Conversation conversation
  }) = _ChatLoadedData;
}