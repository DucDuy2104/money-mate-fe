import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_mate/core/service/langs/cubit/locale_cubit.dart';
import 'package:money_mate/presentation/pages/category/bloc/categories_bloc.dart';
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/routes/bloc/routes_bloc.dart';

class AppStartupWidget extends StatelessWidget {
  const AppStartupWidget({super.key, required this.onLoaded});

  final WidgetBuilder onLoaded;

  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(create: (context) => ProfileBloc()),
          BlocProvider(create: (context) => CategoriesBloc()),
          BlocProvider(create: (context) => LocaleCubit()),
          BlocProvider(
              create: (context) =>
                  RoutesBloc()..add(RoutesEvent.startUp(context))),
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
                    error: (data) {
                      log(data.message);
                      return AppStartupErrorWidget(
                          message: 'Có lỗi xảy ra',
                          onRetry: () {
                            BlocProvider.of<RoutesBloc>(context)
                                .add(RoutesEvent.startUp(context));
                          });
                    },
                    orElse: () {
                      return AppStartupErrorWidget(
                          message: 'Có lỗi xảy ra',
                          onRetry: () {
                            BlocProvider.of<RoutesBloc>(context)
                                .add(RoutesEvent.startUp(context));
                          });
                    });
              },
            );
          },
        ),
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
