import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/bot_model.dart';
import 'package:money_mate/domain/entities/bot.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class BotsRemoteDataSource {
  ResultFuture<BotModel> updateBot(Bot bot);
}

class BotsRemoteDataSourceImpl extends BotsRemoteDataSource {
  final ApiClient _apiClient;
  BotsRemoteDataSourceImpl(this._apiClient);
  @override
  ResultFuture<BotModel> updateBot(Bot bot) {
    final req = ApiRequest(url: 'bots/${bot.id}', body: bot.toJson());
    return _apiClient.put(req: req, parser: (data) => BotModel.fromJson(data));
  }
}
