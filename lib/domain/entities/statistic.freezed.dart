// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FourMonthsStatistic {
  List<double> get incomes => throw _privateConstructorUsedError;
  List<double> get expenses => throw _privateConstructorUsedError;

  /// Create a copy of FourMonthsStatistic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FourMonthsStatisticCopyWith<FourMonthsStatistic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FourMonthsStatisticCopyWith<$Res> {
  factory $FourMonthsStatisticCopyWith(
          FourMonthsStatistic value, $Res Function(FourMonthsStatistic) then) =
      _$FourMonthsStatisticCopyWithImpl<$Res, FourMonthsStatistic>;
  @useResult
  $Res call({List<double> incomes, List<double> expenses});
}

/// @nodoc
class _$FourMonthsStatisticCopyWithImpl<$Res, $Val extends FourMonthsStatistic>
    implements $FourMonthsStatisticCopyWith<$Res> {
  _$FourMonthsStatisticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FourMonthsStatistic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomes = null,
    Object? expenses = null,
  }) {
    return _then(_value.copyWith(
      incomes: null == incomes
          ? _value.incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<double>,
      expenses: null == expenses
          ? _value.expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FourMonthsStatisticImplCopyWith<$Res>
    implements $FourMonthsStatisticCopyWith<$Res> {
  factory _$$FourMonthsStatisticImplCopyWith(_$FourMonthsStatisticImpl value,
          $Res Function(_$FourMonthsStatisticImpl) then) =
      __$$FourMonthsStatisticImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> incomes, List<double> expenses});
}

/// @nodoc
class __$$FourMonthsStatisticImplCopyWithImpl<$Res>
    extends _$FourMonthsStatisticCopyWithImpl<$Res, _$FourMonthsStatisticImpl>
    implements _$$FourMonthsStatisticImplCopyWith<$Res> {
  __$$FourMonthsStatisticImplCopyWithImpl(_$FourMonthsStatisticImpl _value,
      $Res Function(_$FourMonthsStatisticImpl) _then)
      : super(_value, _then);

  /// Create a copy of FourMonthsStatistic
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomes = null,
    Object? expenses = null,
  }) {
    return _then(_$FourMonthsStatisticImpl(
      incomes: null == incomes
          ? _value._incomes
          : incomes // ignore: cast_nullable_to_non_nullable
              as List<double>,
      expenses: null == expenses
          ? _value._expenses
          : expenses // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$FourMonthsStatisticImpl implements _FourMonthsStatistic {
  const _$FourMonthsStatisticImpl(
      {required final List<double> incomes,
      required final List<double> expenses})
      : _incomes = incomes,
        _expenses = expenses;

  final List<double> _incomes;
  @override
  List<double> get incomes {
    if (_incomes is EqualUnmodifiableListView) return _incomes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomes);
  }

  final List<double> _expenses;
  @override
  List<double> get expenses {
    if (_expenses is EqualUnmodifiableListView) return _expenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenses);
  }

  @override
  String toString() {
    return 'FourMonthsStatistic(incomes: $incomes, expenses: $expenses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FourMonthsStatisticImpl &&
            const DeepCollectionEquality().equals(other._incomes, _incomes) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_incomes),
      const DeepCollectionEquality().hash(_expenses));

  /// Create a copy of FourMonthsStatistic
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FourMonthsStatisticImplCopyWith<_$FourMonthsStatisticImpl> get copyWith =>
      __$$FourMonthsStatisticImplCopyWithImpl<_$FourMonthsStatisticImpl>(
          this, _$identity);
}

abstract class _FourMonthsStatistic implements FourMonthsStatistic {
  const factory _FourMonthsStatistic(
      {required final List<double> incomes,
      required final List<double> expenses}) = _$FourMonthsStatisticImpl;

  @override
  List<double> get incomes;
  @override
  List<double> get expenses;

  /// Create a copy of FourMonthsStatistic
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FourMonthsStatisticImplCopyWith<_$FourMonthsStatisticImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
