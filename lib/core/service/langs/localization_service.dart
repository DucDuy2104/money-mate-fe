import 'dart:ui';

import 'package:money_mate/data/data_sources/local/local_data_source.dart';
import 'package:money_mate/domain/entities/localization.dart';

class LocalizationService {
  final OnboardLocalDataSource _localDataSource;

  LocalizationService(this._localDataSource);

  static final List<Localization> supportedLocales = [
    const Localization(name: 'Tiếng Việt', locale: Locale('vi', '')),
    const Localization(name: 'English', locale: Locale('en', '')),
  ];

  Locale getCurrentLocale() {
    final String? languageCode = _localDataSource.getLocalization();

    if (languageCode != null) {
      return Locale(languageCode, '');
    }

    final systemLocale = PlatformDispatcher.instance.locale;
    final matched = supportedLocales.firstWhere(
      (localization) => localization.locale.languageCode == systemLocale.languageCode,
      orElse: () => const Localization(name: 'Tiếng Việt', locale: Locale('vi', '')),
    );

    return matched.locale;
  }

  Future<void> setLocale(Locale locale) async {
    await _localDataSource.setLocalization(locale.languageCode);
  }
}
