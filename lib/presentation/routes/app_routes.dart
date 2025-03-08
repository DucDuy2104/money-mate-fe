import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/login/login_screen.dart';
import 'package:money_mate/presentation/pages/home/home_screen.dart';
import 'package:money_mate/presentation/pages/register/register_screen.dart';
import 'package:money_mate/presentation/pages/setting/setting_screen.dart';
import 'package:money_mate/presentation/routes/route_name.dart';

final List<GoRoute> appRoutes = [
  GoRoute(
    path: RouteNames.login,
    name: RouteNames.loginName,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: RouteNames.register,
    name: RouteNames.registerName,
    builder: (context, state) => const RegisterScreen(),
  ),
  GoRoute(
    path: RouteNames.home,
    name: RouteNames.homeName,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: RouteNames.settings,
    name: RouteNames.settingsName,
    builder: (context, state) => const SettingScreen(),
  ),
];
