import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:money_mate/presentation/pages/opt_verify/otp_verify_screen.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/google_button.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_assets.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  void _onRegister(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;
    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();
    _confirmPasswordFocusNode.unfocus();
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      AppToast.warning(context, S.of(context).emptyFieldError);
      return;
    }

    if (password.length < 6) {
      AppToast.error(context, S.of(context).passwordLengthLessThanRegulation);
      return;
    }

    if (password != confirmPassword) {
      AppToast.warning(context, S.of(context).passwordNotMatch);
      return;
    }

    BlocProvider.of<AuthBloc>(context).add(AuthEvent.register(email, password));
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
      listener: (BuildContext context, AuthState state) {
        state.maybeMap(
            success: (data) {
              if (data.user.isActive) {
                context.goNamed(RouteNames.setupName);
                return;
              }
              context.goNamed(RouteNames.otpVerificationName,
                  extra: data.user,
                  pathParameters: {'type': OtpTypes.register.name});
            },
            error: (failure) => {AppToast.error(context, failure.error)},
            orElse: () {});
      },
      builder: (context, state) {
        return LoadingScaffold(
          isLoading: state.maybeMap(
            loading: (_) => true,
            orElse: () => false,
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.paddingMd),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.storySetWellcome,
                      width: 200, height: 200, fit: BoxFit.contain),
                  AppDimens.spaceMd,
                  TextField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    decoration: InputDecoration(
                      labelText: s.email,
                    ),
                  ),
                  AppDimens.spaceMd,
                  TextField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    onSubmitted: (value) {
                      _confirmPasswordFocusNode.requestFocus();
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: s.password,
                    ),
                  ),
                  AppDimens.spaceMd,
                  TextField(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPasswordFocusNode,
                    onSubmitted: (value) {
                      _onRegister(context);
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: s.confirmPassword,
                    ),
                  ),
                  AppDimens.spaceMd,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        //TODO: handle register
                        _onRegister(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppDimens.paddingMd),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimens.radiusSm),
                        ),
                      ),
                      child: Text(
                        s.register,
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  AppDimens.spaceMd,
                  GoogleSignInButton(
                    content: s.registerWithGoogle,
                    onTap: () {
                      _onGoogleSignin(context);
                    },
                  ),
                  AppDimens.spaceMd,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(s.haveAnAccount),
                      AppDimens.spaceSm,
                      GestureDetector(
                        onTap: () {
                          // Navigate to Login screen
                          context.goNamed(RouteNames.loginName);
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
