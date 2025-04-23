import 'package:money_mate/domain/entities/message.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class MessagesRepository {
  ResultFuture<List<Message>> getMessages(String conversationId, {String? lastMessageId});
}