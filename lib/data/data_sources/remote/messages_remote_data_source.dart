import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/message_model.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class MessagesRemoteDataSource {
  ResultFuture<List<MessageModel>> getMessages(String conversationId);
}

class MessagesRemoteDataSourceImpl extends MessagesRemoteDataSource {
  final ApiClient _apiClient;
  MessagesRemoteDataSourceImpl(this._apiClient);
  @override
  ResultFuture<List<MessageModel>> getMessages(String conversationId) {
    final req = ApiRequest(url: '/messages/$conversationId');
    return _apiClient.get(
        req: req,
        parser: (data) =>
            (data as List).map((e) => MessageModel.fromJson(e)).toList());
  }
}
