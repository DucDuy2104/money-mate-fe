import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/login/bloc/login_bloc.dart';
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

  void _onLogin(BuildContext context) {
    try {
      final email = _emailController.text;
      final password = _passwordController.text;
      if (email.isEmpty || password.isEmpty) {
        AppToast.error(context, 'Vui lòng nhập đủ thông tin');
        return;
      }

      BlocProvider.of<LoginBloc>(context)
          .add(LoginEvent.login(email, password));
    } catch (e) {
      AppToast.error(context, 'Đã có lỗi xảy ra');
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        state.maybeMap(
            success: (value) {
              final user = value.data.user;
              if (user.isActive) {
                context.goNamed(RouteNames.homeName);
              } else {
                context.goNamed(RouteNames.otpVerificationName, extra: user);
              }
            },
            error: (value) {
              AppToast.error(context, value.errorMessage);
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
              padding: const EdgeInsets.all(AppDimens.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.storySetBack,
                      width: 200, height: 200, fit: BoxFit.contain),
                  AppDimens.spaceLarge,
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  AppDimens.spaceLarge,
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  AppDimens.space,
                  Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            // Navigate to Forgot Password screen
                          },
                          child: Text(
                            'Quên mật khẩu?',
                            style: context.textTheme.bodyMedium
                                ?.copyWith(color: AppColors.primaryColor),
                          ))),
                  AppDimens.space,
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        //TODO: Handle login
                        _onLogin(context);
                      },
                      child: Text(
                        'Đăng nhập',
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  AppDimens.space,
                  GoogleSignInButton(content: 'Đăng nhập với Google'),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Bạn chưa có tài khoản?"),
                      AppDimens.spaceSmall,
                      GestureDetector(
                        onTap: () {
                          // TODO: Navigate to Register screen
                          context.goNamed(RouteNames.registerName);
                        },
                        child: Text('Đăng ký ngay',
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
