import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'localization.freezed.dart';

@freezed
class Localization with _$Localization {
  const factory Localization({required String name, required Locale locale}) =
      _Localization;
}
