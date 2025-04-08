import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/google_button.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_assets.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/utils/screen_utils.dart';

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
      AppToast.warning(context, 'Vui lòng điền đầy đủ thông tin');
      return;
    }

    if (password != confirmPassword) {
      AppToast.warning(context, 'Mật khẩu xác nhận không trùng khớp');
      return;
    }

    BlocProvider.of<AuthBloc>(context).add(AuthEvent.register(email, password));
  }

  void _onGoogleSignin(BuildContext context) {
    try {
      BlocProvider.of<AuthBloc>(context).add(const AuthEvent.googleSignin());
    } catch (e) {
      AppToast.error(context, 'Đã có lỗi xảy ra');
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (BuildContext context, AuthState state) {
        state.maybeMap(
            success: (data) {
              if (data.user.isActive) {
                context.goNamed(RouteNames.setupName);
                return;
              }
              context.goNamed(RouteNames.otpVerificationName, extra: data.user);
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
              padding: ScreenUtils.screenPaddingWithSafeArea(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.storySetWellcome,
                      width: 200, height: 200, fit: BoxFit.contain),
                  AppDimens.space,
                  TextField(
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  AppDimens.space,
                  TextField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    onSubmitted: (value) {
                      _confirmPasswordFocusNode.requestFocus();
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Mật khẩu',
                    ),
                  ),
                  AppDimens.space,
                  TextField(
                    controller: _confirmPasswordController,
                    focusNode: _confirmPasswordFocusNode,
                    onSubmitted: (value) {
                      _onRegister(context);
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Nhập lại mật khẩu',
                    ),
                  ),
                  AppDimens.space,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        //TODO: handle register
                        _onRegister(context);
                        // context.goNamed(RouteNames.categoryRegisterName);
                      },
                      child: Text(
                        'Đăng ký',
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  AppDimens.space,
                  GoogleSignInButton(
                    content: 'Đăng ký với Google',
                    onTap: () {
                      _onGoogleSignin(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Bạn đã có tài khoản?"),
                      AppDimens.spaceSmall,
                      GestureDetector(
                        onTap: () {
                          // Navigate to Login screen
                          context.goNamed(RouteNames.loginName);
                        },
                        child: Text('Đăng nhập ngay',
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
