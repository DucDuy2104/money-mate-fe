// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FourMonthsStatisticModel _$FourMonthsStatisticModelFromJson(
    Map<String, dynamic> json) {
  return _FourMonthsStatisticModel.fromJson(json);
}

/// @nodoc
mixin _$FourMonthsStatisticModel {
  List<double> get incomes => throw _privateConstructorUsedError;
  List<double> get expenses => throw _privateConstructorUsedError;

  /// Serializes this FourMonthsStatisticModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FourMonthsStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FourMonthsStatisticModelCopyWith<FourMonthsStatisticModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FourMonthsStatisticModelCopyWith<$Res> {
  factory $FourMonthsStatisticModelCopyWith(FourMonthsStatisticModel value,
          $Res Function(FourMonthsStatisticModel) then) =
      _$FourMonthsStatisticModelCopyWithImpl<$Res, FourMonthsStatisticModel>;
  @useResult
  $Res call({List<double> incomes, List<double> expenses});
}

/// @nodoc
class _$FourMonthsStatisticModelCopyWithImpl<$Res,
        $Val extends FourMonthsStatisticModel>
    implements $FourMonthsStatisticModelCopyWith<$Res> {
  _$FourMonthsStatisticModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FourMonthsStatisticModel
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
abstract class _$$FourMonthsStatisticModelImplCopyWith<$Res>
    implements $FourMonthsStatisticModelCopyWith<$Res> {
  factory _$$FourMonthsStatisticModelImplCopyWith(
          _$FourMonthsStatisticModelImpl value,
          $Res Function(_$FourMonthsStatisticModelImpl) then) =
      __$$FourMonthsStatisticModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<double> incomes, List<double> expenses});
}

/// @nodoc
class __$$FourMonthsStatisticModelImplCopyWithImpl<$Res>
    extends _$FourMonthsStatisticModelCopyWithImpl<$Res,
        _$FourMonthsStatisticModelImpl>
    implements _$$FourMonthsStatisticModelImplCopyWith<$Res> {
  __$$FourMonthsStatisticModelImplCopyWithImpl(
      _$FourMonthsStatisticModelImpl _value,
      $Res Function(_$FourMonthsStatisticModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FourMonthsStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? incomes = null,
    Object? expenses = null,
  }) {
    return _then(_$FourMonthsStatisticModelImpl(
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
@JsonSerializable()
class _$FourMonthsStatisticModelImpl implements _FourMonthsStatisticModel {
  const _$FourMonthsStatisticModelImpl(
      {required final List<double> incomes,
      required final List<double> expenses})
      : _incomes = incomes,
        _expenses = expenses;

  factory _$FourMonthsStatisticModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FourMonthsStatisticModelImplFromJson(json);

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
    return 'FourMonthsStatisticModel(incomes: $incomes, expenses: $expenses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FourMonthsStatisticModelImpl &&
            const DeepCollectionEquality().equals(other._incomes, _incomes) &&
            const DeepCollectionEquality().equals(other._expenses, _expenses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_incomes),
      const DeepCollectionEquality().hash(_expenses));

  /// Create a copy of FourMonthsStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FourMonthsStatisticModelImplCopyWith<_$FourMonthsStatisticModelImpl>
      get copyWith => __$$FourMonthsStatisticModelImplCopyWithImpl<
          _$FourMonthsStatisticModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FourMonthsStatisticModelImplToJson(
      this,
    );
  }
}

abstract class _FourMonthsStatisticModel implements FourMonthsStatisticModel {
  const factory _FourMonthsStatisticModel(
      {required final List<double> incomes,
      required final List<double> expenses}) = _$FourMonthsStatisticModelImpl;

  factory _FourMonthsStatisticModel.fromJson(Map<String, dynamic> json) =
      _$FourMonthsStatisticModelImpl.fromJson;

  @override
  List<double> get incomes;
  @override
  List<double> get expenses;

  /// Create a copy of FourMonthsStatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FourMonthsStatisticModelImplCopyWith<_$FourMonthsStatisticModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
