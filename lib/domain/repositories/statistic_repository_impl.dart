import 'package:dartz/dartz.dart';
import 'package:money_mate/data/data_sources/remote/statistic_remote_data_source.dart';
import 'package:money_mate/data/models/statistic_model.dart';
import 'package:money_mate/data/repositories/statistic_repository.dart';
import 'package:money_mate/domain/entities/statistic.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

class StatisticRepositoryImpl extends StatisticRepository {
  final StatisticRemoteDataSource _remoteDataSource;
  StatisticRepositoryImpl(this._remoteDataSource);
  @override
  ResultFuture<FourMonthsStatistic> getFourMonthsStatistic() async {
    final result = await _remoteDataSource.getFourMonthsStatistic();
    return result.fold(
        (failure) => Left(failure),
        (fourMonthsStatisticModel) =>
            Right(fourMonthsStatisticModel.toEntity()));
  }
}
