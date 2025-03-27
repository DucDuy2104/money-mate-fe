import 'package:dartz/dartz.dart';
import 'package:money_mate/data/data_sources/remote/conversation_remote_data_source.dart';
import 'package:money_mate/data/models/conversation_model.dart';
import 'package:money_mate/data/repositories/conversation_repository.dart';
import 'package:money_mate/domain/entities/conversation.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

class ConversationRepositoryImpl extends ConversationRepository {
  final ConversationRemoteDataSource _conversationRemoteDataSource;
  ConversationRepositoryImpl(this._conversationRemoteDataSource);
  @override
  ResultFuture<Conversation> getBotConversation() async {
    final result = await _conversationRemoteDataSource.getBotConversation();
    return result.fold((failure) => Left(failure),
        (conversationModel) => Right(conversationModel.toEntity()));
  }
}
