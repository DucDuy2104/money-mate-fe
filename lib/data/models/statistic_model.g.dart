// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FourMonthsStatisticModelImpl _$$FourMonthsStatisticModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FourMonthsStatisticModelImpl(
      incomes: (json['incomes'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      expenses: (json['expenses'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$FourMonthsStatisticModelImplToJson(
        _$FourMonthsStatisticModelImpl instance) =>
    <String, dynamic>{
      'incomes': instance.incomes,
      'expenses': instance.expenses,
    };
