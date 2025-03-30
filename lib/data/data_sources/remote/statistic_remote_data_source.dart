import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/statistic_model.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class StatisticRemoteDataSource {
  ResultFuture<FourMonthsStatisticModel> getFourMonthsStatistic();
}

class StatisticRemoteDataSourceImpl implements StatisticRemoteDataSource {
  final ApiClient _apiClient;
  StatisticRemoteDataSourceImpl(this._apiClient);
  @override
  ResultFuture<FourMonthsStatisticModel> getFourMonthsStatistic() {
    final req = ApiRequest(url: '/statistic/last-four-months');
    return _apiClient.get(
        req: req, parser: (data) => FourMonthsStatisticModel.fromJson(data));
  }
}
