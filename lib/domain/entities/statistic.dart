import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistic.freezed.dart';

@freezed
class FourMonthsStatistic with _$FourMonthsStatistic {
  const factory FourMonthsStatistic({
    required List<double> incomes,
    required List<double> expenses,
  }) = _FourMonthsStatistic;
}
