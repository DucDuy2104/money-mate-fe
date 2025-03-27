import 'package:money_mate/domain/entities/conversation.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class ConversationRepository {
  ResultFuture<Conversation> getBotConversation();
}