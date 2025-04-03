import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/routes/bloc/routes_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
      initialLocation: RouteNames.splash,
      routes: appRoutes,
      redirect: (context, state) {
        if (!(state.matchedLocation == RouteNames.splash ||
            state.matchedLocation == RouteNames.login)) {
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
              if (state.matchedLocation == RouteNames.splash ||
                  state.matchedLocation == RouteNames.login) {
                return RouteNames.home;
              }
              return null;
            },
            orElse: () => null);
      });
}
