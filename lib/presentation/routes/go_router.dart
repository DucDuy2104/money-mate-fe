import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/routes/bloc/routes_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'app_routes.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: RouteNames.splash,
      routes: appRoutes,
      redirect: (context, state) {
        if (!(state.matchedLocation == RouteNames.splash)) {
          return null;
        }
        final routesBloc = context.watch<RoutesBloc>();

        return routesBloc.state.maybeMap(
            startedUp: (startState) {
              if (state.matchedLocation == RouteNames.splash) {
                return RouteNames.login;
              }
              return null;
            },
            auth: (authState) {
              if (state.matchedLocation == RouteNames.splash) {
                return RouteNames.home;
              }
              return null;
            },
            orElse: () => null);
      });
}
