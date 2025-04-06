part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  const factory ChatEvent.getChatData() = _GetChatData;
  const factory ChatEvent.connect() = _Connect;
  const factory ChatEvent.updateMessages(Message message) = _UpdateMessages;
  const factory ChatEvent.leaveRoom() = _LeaveRoom;
  const factory ChatEvent.cancelTransaction(Message message, BuildContext context, VoidCallback onSuccess) = _CancelTransaction;
  const factory ChatEvent.enableTransaction(Message message, BuildContext context, VoidCallback onSuccess) = _EnableTransaction;
  const factory ChatEvent.setMessageLoading(String id, bool isLoading) = _SetMessageLoading;
  const factory ChatEvent.setMessageCancel(String id) = _SetMessageCancel;
  const factory ChatEvent.setMessageEnable(String id) = _SetMessageEnable;
  const factory ChatEvent.updateBot(BuildContext context, Bot bot) = _UpdateBot;
}