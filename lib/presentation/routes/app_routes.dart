import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:money_mate/presentation/pages/category/categories_screen.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/bloc/setup_categories_bloc.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/categories_setup_screen.dart.dart';
import 'package:money_mate/presentation/pages/chat/bloc/chat_bloc.dart';
import 'package:money_mate/presentation/pages/chat/chat_screen.dart';
import 'package:money_mate/presentation/pages/auth/login/login_screen.dart';
import 'package:money_mate/presentation/pages/chat/cubit/enable_chat_cubit.dart';
import 'package:money_mate/presentation/pages/email_to_next/bloc/email_next_bloc.dart';
import 'package:money_mate/presentation/pages/email_to_next/email_to_next_screen.dart';
import 'package:money_mate/presentation/pages/home/home_screen.dart';
import 'package:money_mate/presentation/pages/notifications/notifications_screen.dart';
import 'package:money_mate/presentation/pages/opt_verify/bloc/verification_bloc.dart';
import 'package:money_mate/presentation/pages/opt_verify/otp_verify_screen.dart';
import 'package:money_mate/presentation/pages/profile/profile_screen.dart';
import 'package:money_mate/presentation/pages/profile_detail/profile_detail_screen.dart';
import 'package:money_mate/presentation/pages/auth/register/register_screen.dart';
import 'package:money_mate/presentation/pages/reset_password/bloc/reset_pass_bloc.dart';
import 'package:money_mate/presentation/pages/reset_password/reset_password_screen.dart';
import 'package:money_mate/presentation/pages/setting/setting_screen.dart';
import 'package:money_mate/presentation/pages/setup/bloc/setup_bloc.dart';
import 'package:money_mate/presentation/pages/setup/setup_screen.dart';
import 'package:money_mate/presentation/pages/splash/splash_screen.dart';
import 'package:money_mate/presentation/pages/transactions/transactions_screen.dart';
import 'package:money_mate/presentation/pages/update_pass/bloc/password_bloc.dart';
import 'package:money_mate/presentation/pages/update_pass/update_pass_screen.dart';
import 'package:money_mate/presentation/routes/route_name.dart';

final List<GoRoute> appRoutes = [
  GoRoute(
      path: RouteNames.splash,
      name: RouteNames.splashName,
      builder: (context, state) => const SplashScreen()),
  GoRoute(
    path: RouteNames.login,
    name: RouteNames.loginName,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthBloc(),
      child: LoginScreen(),
    ),
  ),
  GoRoute(
    path: RouteNames.register,
    name: RouteNames.registerName,
    builder: (context, state) => BlocProvider(
      create: (context) => AuthBloc(),
      child: RegisterScreen(),
    ),
  ),
  GoRoute(
    path: RouteNames.otpVerification,
    name: RouteNames.otpVerificationName,
    builder: (context, state) {
      final type = state.pathParameters['type'];
      final user = state.extra as User;
      return BlocProvider(
        create: (context) => VerificationBloc(),
        child: OtpVerificationScreen(type: type, user: user),
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
      builder: (context, state) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => ChatBloc(),
              ),
              BlocProvider(
                create: (context) => EnableChatCubit(),
              ),
            ],
            child: const ChatScreen(),
          )),
  GoRoute(
      path: RouteNames.category,
      name: RouteNames.categoryName,
      builder: (context, state) => const CategoriesScreen()),
  GoRoute(
      path: RouteNames.categoryRegister,
      name: RouteNames.categoryRegisterName,
      builder: (context, state) => BlocProvider(
            create: (context) => SetupCategoriesBloc(),
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
  GoRoute(
      path: RouteNames.profileDetails,
      name: RouteNames.profileDetailsName,
      builder: (context, state) => const ProfileDetailScreen()),
  GoRoute(
    path: RouteNames.updatePassword,
    name: RouteNames.updatePasswordName,
    builder: (context, state) => BlocProvider(
      create: (context) => PasswordBloc(),
      child: const UpdatePassScreen(),
    ),
  ),
  GoRoute(
      path: RouteNames.resetPassword,
      name: RouteNames.resetPasswordName,
      builder: (context, state) {
        final User user = state.extra as User;
        return BlocProvider(
          create: (context) => ResetPassBloc(),
          child: ResetPassScreen(user: user),
        );
      }),
  GoRoute(
      path: RouteNames.emailToNext,
      name: RouteNames.emailToNextName,
      builder: (context, state) => BlocProvider(
            create: (context) => EmailNextBloc(),
            child: const EmailToNextScreen(),
          )),
  GoRoute(
    path: RouteNames.transactions,
    name: RouteNames.transactionsName,
    builder: (context, state) => const TransactionsScreen(),
  )
];
