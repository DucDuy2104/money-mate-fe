part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.getChatData() = _GetChatData;
  const factory ChatEvent.connect() = _Connect;
  const factory ChatEvent.updateMessages(Message message) = _UpdateMessages;
  const factory ChatEvent.leaveRoom() = _LeaveRoom;
}