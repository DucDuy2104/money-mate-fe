import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.login,
    routes: appRoutes,
  );
}
