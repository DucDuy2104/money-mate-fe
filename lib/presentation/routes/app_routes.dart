import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/category/category_screen.dart';
import 'package:money_mate/presentation/pages/chat/chat_screen.dart';
import 'package:money_mate/presentation/pages/login/login_screen.dart';
import 'package:money_mate/presentation/pages/home/home_screen.dart';
import 'package:money_mate/presentation/pages/notifications/notifications_screen.dart';
import 'package:money_mate/presentation/pages/profile/profile_screen.dart';
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
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: RouteNames.settings,
    name: RouteNames.settingsName,
    builder: (context, state) => const SettingsScreen(),
  ),
  GoRoute(
      path: RouteNames.chat,
      name: RouteNames.chatName,
      builder: (context, state) => ChatScreen()),
  GoRoute(
      path: RouteNames.category,
      name: RouteNames.categoryName,
      builder: (context, state) => const CategoryScreen()),
  GoRoute(
      path: RouteNames.profile,
      name: RouteNames.profileName,
      builder: (context, state) => const ProfileScreen()),
  GoRoute(
      path: RouteNames.notifications,
      name: RouteNames.notificationsName,
      builder: (context, state) => const NotificationsScreen()),
];
