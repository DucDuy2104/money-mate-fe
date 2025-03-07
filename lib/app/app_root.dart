import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:money_mate/presentation/routes/go_router.dart';
import 'package:money_mate/shared/constants/constants.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      theme: AppThemeData.lightTheme(context),
      darkTheme: AppThemeData.darkTheme(context),
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router, // App router
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'),
      ],
      locale: const Locale('vi', 'VN'),
    );
  }
}
