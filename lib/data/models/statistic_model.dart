import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/domain/entities/statistic.dart';

part 'statistic_model.freezed.dart';
part 'statistic_model.g.dart';

@freezed
class FourMonthsStatisticModel with _$FourMonthsStatisticModel {
  const factory FourMonthsStatisticModel({
    required List<double> incomes,
    required List<double> expenses,
  }) = _FourMonthsStatisticModel;

  factory FourMonthsStatisticModel.fromJson(Map<String, dynamic> json) =>
      _$FourMonthsStatisticModelFromJson(json);
}

extension FourMonthsStatisticX on FourMonthsStatisticModel {
  FourMonthsStatistic toEntity() {
    return FourMonthsStatistic(
      incomes: incomes,
      expenses: expenses,
    );
  }
}
