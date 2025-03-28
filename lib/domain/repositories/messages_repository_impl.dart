import 'package:dartz/dartz.dart';
import 'package:money_mate/data/data_sources/remote/messages_remote_data_source.dart';
import 'package:money_mate/data/models/message_model.dart';
import 'package:money_mate/data/repositories/messages_repository.dart';
import 'package:money_mate/domain/entities/message.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

class MessagesRepositoryImpl extends MessagesRepository {
  final MessagesRemoteDataSource _messagesRemoteDataSource;
  MessagesRepositoryImpl(this._messagesRemoteDataSource);
  @override
  ResultFuture<List<Message>> getMessages(String conversationId) async {
    final result =
        await this._messagesRemoteDataSource.getMessages(conversationId);
    return result.fold(
        (failure) => Left(failure),
        (messageModels) =>
            Right(messageModels.map((m) => m.toEntity()).toList()));
  }
}
