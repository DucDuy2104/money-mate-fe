import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/google_button.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimens.borderRadiusSmall)),
              ),
            ),
            AppDimens.spaceLarge,
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimens.borderRadiusSmall)),
              ),
            ),
            AppDimens.spaceLarge,
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Nhập lại mật khẩu',
                border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(AppDimens.borderRadiusSmall)),
              ),
            ),
            AppDimens.space,
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //TODO: handle register
                  context.goNamed(RouteNames.categoryRegisterName);
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
    );
  }
}
