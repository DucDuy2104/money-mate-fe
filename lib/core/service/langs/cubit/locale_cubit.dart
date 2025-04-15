import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/core/service/langs/localization_service.dart';

part 'locale_state.dart';
part 'locale_cubit.freezed.dart';

class LocaleCubit extends Cubit<LocaleState> {
  late final LocalizationService _localizationService;
  LocaleCubit() : super(const LocaleState.initial());

  void loadLocale() {
    _localizationService = getIt<LocalizationService>();
    final locale = _localizationService.getCurrentLocale();
    emit(LocaleState.loaded(locale));
  }

  Future<void> changeLocale(Locale locale) async {
    await _localizationService.setLocale(locale);
  }
}
