import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/presentation/pages/category/category_screen.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/bloc/categories_bloc.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/categories_setup_screen.dart.dart';
import 'package:money_mate/presentation/pages/chat/chat_screen.dart';
import 'package:money_mate/presentation/pages/login/bloc/login_bloc.dart';
import 'package:money_mate/presentation/pages/login/login_screen.dart';
import 'package:money_mate/presentation/pages/home/home_screen.dart';
import 'package:money_mate/presentation/pages/notifications/notifications_screen.dart';
import 'package:money_mate/presentation/pages/opt_verify/bloc/verification_bloc.dart';
import 'package:money_mate/presentation/pages/opt_verify/otp_verify_screen.dart';
import 'package:money_mate/presentation/pages/profile/profile_screen.dart';
import 'package:money_mate/presentation/pages/register/bloc/register_bloc.dart';
import 'package:money_mate/presentation/pages/register/register_screen.dart';
import 'package:money_mate/presentation/pages/setting/setting_screen.dart';
import 'package:money_mate/presentation/pages/setup/bloc/setup_bloc.dart';
import 'package:money_mate/presentation/pages/setup/setup_screen.dart';
import 'package:money_mate/presentation/routes/route_name.dart';

final List<GoRoute> appRoutes = [
  GoRoute(
    path: RouteNames.login,
    name: RouteNames.loginName,
    builder: (context, state) => BlocProvider(
      create: (context) => LoginBloc(),
      child: LoginScreen(),
    ),
  ),
  GoRoute(
    path: RouteNames.register,
    name: RouteNames.registerName,
    builder: (context, state) => BlocProvider(
      create: (context) => RegisterBloc(),
      child: RegisterScreen(),
    ),
  ),
  GoRoute(
    path: RouteNames.otpVerification,
    name: RouteNames.otpVerificationName,
    builder: (context, state) {
      final user = state.extra as User;
      return BlocProvider(
        create: (context) => VerificationBloc(),
        child: OtpVerificationScreen(user: user),
      );
    },
  ),
  GoRoute(
      path: RouteNames.setup,
      name: RouteNames.setupName,
      builder: (context, state) => BlocProvider(
            create: (context) => SetupBloc(),
            child: SetupScreen(),
          )),
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
      path: RouteNames.categoryRegister,
      name: RouteNames.categoryRegisterName,
      builder: (context, state) => BlocProvider(
            create: (context) => CategoriesBloc(),
            child: const CategoriesSetupScreen(),
          )),
  GoRoute(
      path: RouteNames.profile,
      name: RouteNames.profileName,
      builder: (context, state) => const ProfileScreen()),
  GoRoute(
      path: RouteNames.notifications,
      name: RouteNames.notificationsName,
      builder: (context, state) => const NotificationsScreen()),
];
