import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:money_mate/presentation/pages/opt_verify/otp_verify_screen.dart';
import 'package:money_mate/presentation/routes/bloc/routes_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/google_button.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_assets.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();

  void _onLogin(BuildContext context) {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;
      _emailFocusNode.unfocus();
      _passwordFocusNode.unfocus();
      if (email.isEmpty || password.isEmpty) {
        AppToast.error(context, S.of(context).emptyFieldError);
        return;
      }

      BlocProvider.of<AuthBloc>(context).add(AuthEvent.login(email, password));
    } catch (e) {
      AppToast.error(context, S.of(context).unknownError);
      debugPrint(e.toString());
    }
  }

  void _onGoogleSignin(BuildContext context) {
    try {
      BlocProvider.of<AuthBloc>(context).add(const AuthEvent.googleSignin());
    } catch (e) {
      AppToast.error(context, S.of(context).unknownError);
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        state.maybeMap(
            success: (state) {
              final user = state.user;
              if (!user.isActive) {
                context.goNamed(RouteNames.otpVerificationName,
                    extra: user,
                    pathParameters: {'type': OtpTypes.register.name});
                return;
              }
              if (!user.isSetup) {
                context.goNamed(RouteNames.setupName);
                return;
              }
              BlocProvider.of<RoutesBloc>(context)
                  .add(const RoutesEvent.setAuth());
              context.goNamed(RouteNames.homeName);
            },
            error: (state) {
              AppToast.error(context, state.error);
            },
            orElse: () {});
      },
      builder: (context, state) {
        return LoadingScaffold(
          isLoading:
              state.maybeMap(loading: (data) => true, orElse: () => false),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.paddingMd),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.storySetBack,
                      width: 200, height: 200, fit: BoxFit.contain),
                  AppDimens.spaceLg,
                  TextField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    decoration: InputDecoration(labelText: s.email),
                  ),
                  AppDimens.spaceMd,
                  TextField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    onSubmitted: (value) {
                      _onLogin(context);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: s.password,
                    ),
                  ),
                  AppDimens.spaceMd,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            context.goNamed(RouteNames.emailToNextName);
                          },
                          child: Text(
                            s.forgotPassword,
                            style: context.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.primaryColor),
                          ))),
                  AppDimens.spaceMd,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        //TODO: Handle login
                        _onLogin(context);
                      },
                      child: Text(
                        s.login,
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  AppDimens.spaceMd,
                  GoogleSignInButton(
                    content: s.loginWithGoogle,
                    onTap: () {
                      _onGoogleSignin(context);
                    },
                  ),
                  AppDimens.spaceMd,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(s.notHaveAnAccount),
                      AppDimens.spaceSm,
                      GestureDetector(
                        onTap: () {
                          // TODO: Navigate to Register screen
                          context.goNamed(RouteNames.registerName);
                        },
                        child: Text(s.registerNow,
                            style: context.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.primaryColor)),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
