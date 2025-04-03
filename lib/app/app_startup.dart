import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_mate/presentation/pages/category/bloc/categories_bloc.dart';
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/routes/bloc/routes_bloc.dart';

class AppStartupWidget extends StatelessWidget {
  const AppStartupWidget({super.key, required this.onLoaded});

  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                RoutesBloc()..add(const RoutesEvent.startUp())),
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => ProfileBloc()),
        BlocProvider(create: (context) => CategoriesBloc()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) {
          return BlocBuilder<RoutesBloc, RoutesState>(
            builder: (BuildContext context, RoutesState state) {
              return state.maybeMap(
                  initial: (state) => onLoaded(context),
                  auth: (state) => onLoaded(context),
                  startedUp: (state) => onLoaded(context),
                  orElse: () => AppStartupErrorWidget(
                      message: 'Có lỗi xảy ra',
                      onRetry: () {
                        BlocProvider.of<RoutesBloc>(context)
                            .add(const RoutesEvent.startUp());
                      }));
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
