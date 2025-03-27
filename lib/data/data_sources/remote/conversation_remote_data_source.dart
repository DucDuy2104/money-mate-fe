import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/conversation_model.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class ConversationRemoteDataSource {
  ResultFuture<ConversationModel> getBotConversation();
}

class ConversationRemoteDataSourceImpl implements ConversationRemoteDataSource {
  final ApiClient _apiClient;
  ConversationRemoteDataSourceImpl(this._apiClient);

  @override
  ResultFuture<ConversationModel> getBotConversation() {
    final req = ApiRequest(
      url: '/conversations/bot',
    );

    return _apiClient.get(
        req: req, parser: (data) => ConversationModel.fromJson(data));
  }
}
