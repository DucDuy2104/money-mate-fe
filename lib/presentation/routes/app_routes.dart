import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/login/login_screen.dart';
import 'package:money_mate/presentation/pages/home/home_screen.dart';
import 'package:money_mate/presentation/pages/setting/setting_screen.dart';
import 'package:money_mate/presentation/routes/route_name.dart';

final List<GoRoute> appRoutes = [
  GoRoute(
    path: RouteNames.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: RouteNames.home,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: RouteNames.settings,
    builder: (context, state) => const SettingScreen(),
  ),
];
