import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/register/bloc/register_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/google_button.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _onRegister(BuildContext context) {
    final email = _emailController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      AppToast.warning(context, 'Vui lòng điền đầy đủ thông tin');
      return;
    }

    if (password != confirmPassword) {
      AppToast.warning(context, 'Mật khẩu xác nhận không trùng khớp');
      return;
    }

    BlocProvider.of<RegisterBloc>(context)
        .add(RegisterEvent.register(email, password));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (BuildContext context, RegisterState state) {
        state.maybeMap(
            success: (data) =>
                {AppToast.success(context, 'Đăng ký thành công')},
            failure: (failure) => {AppToast.error(context, failure.error)},
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
              padding: const EdgeInsets.all(AppDimens.padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/story_set_wellcome.png',
                      width: 200, height: 200, fit: BoxFit.contain),
                  AppDimens.spaceLarge,
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              AppDimens.borderRadiusSmall)),
                    ),
                  ),
                  AppDimens.spaceLarge,
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              AppDimens.borderRadiusSmall)),
                    ),
                  ),
                  AppDimens.spaceLarge,
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Nhập lại mật khẩu',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              AppDimens.borderRadiusSmall)),
                    ),
                  ),
                  AppDimens.space,
                  Container(
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
                  GoogleSignInButton(content: 'Đăng ký với Google'),
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
