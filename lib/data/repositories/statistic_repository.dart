import 'package:money_mate/domain/entities/statistic.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class StatisticRepository {
  ResultFuture<FourMonthsStatistic> getFourMonthsStatistic();
}