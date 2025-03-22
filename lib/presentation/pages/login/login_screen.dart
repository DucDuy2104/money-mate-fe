import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/google_button.dart';
import 'package:money_mate/shared/constants/app_assets.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: InputDecoration(
                labelText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            AppDimens.spaceLarge,
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
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
                  context.goNamed(RouteNames.homeName);
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
    );
  }
}
