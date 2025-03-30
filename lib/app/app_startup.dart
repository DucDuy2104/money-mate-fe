import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_mate/core/service/getit/locator.dart' as ls;
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/pages/splash/splash_screen.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class AppStartupCubit extends Cubit<AppStartupState> {
  AppStartupCubit() : super(AppStartupLoading());

  Future<void> initializeApp() async {
    try {
      // Initialize app box
      // await AppStorageService.init();
      // Add any other initialization tasks here
      await ls.setupLocator();
      await Future.delayed(const Duration(seconds: 2));
      emit(AppStartupLoaded());
    } catch (e) {
      emit(AppStartupError(e.toString()));
    }
  }
}

abstract class AppStartupState {}

class AppStartupLoading extends AppStartupState {}

class AppStartupLoaded extends AppStartupState {}

class AppStartupError extends AppStartupState {
  final String message;
  AppStartupError(this.message);
}

class AppStartupWidget extends StatelessWidget {
  const AppStartupWidget({super.key, required this.onLoaded});

  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppStartupCubit()..initializeApp()),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ProfileBloc())
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) {
          return BlocBuilder<AppStartupCubit, AppStartupState>(
            builder: (context, state) {
              if (state is AppStartupLoaded) {
                return onLoaded(context);
              } else if (state is AppStartupError) {
                return AppStartupErrorWidget(
                  message: state.message,
                  onRetry: () =>
                      context.read<AppStartupCubit>().initializeApp(),
                );
              }
              return MaterialApp(
                  theme: AppThemeData.lightTheme(context),
                  darkTheme: AppThemeData.darkTheme(context),
                  themeMode: ThemeMode.system,
                  debugShowCheckedModeBanner: false,
                  home: const SplashScreen());
            },
          );
        },
      ),
    );
  }
}

class AppStartupErrorWidget extends StatelessWidget {
  const AppStartupErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
