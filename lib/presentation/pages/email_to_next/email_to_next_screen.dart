import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/email_to_next/bloc/email_next_bloc.dart';
import 'package:money_mate/presentation/pages/opt_verify/otp_verify_screen.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/components/app_toast.dart';

class EmailToNextScreen extends StatefulWidget {
  const EmailToNextScreen({super.key});

  @override
  State<EmailToNextScreen> createState() => _EmailToNextScreenState();
}

class _EmailToNextScreenState extends State<EmailToNextScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String email = _emailController.text.trim();

    if (email.isEmpty) {
      _showError('Vui lòng nhập email');
      return;
    }
    BlocProvider.of<EmailNextBloc>(context).add(EmailNextEvent.next(email));
  }

  void _showError(String message) {
    AppToast.error(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EmailNextBloc, EmailNextState>(
      listener: (BuildContext context, EmailNextState state) {
        state.maybeMap(
            error: (data) {
              AppToast.error(context, data.error);
            },
            success: (data) {
              context.goNamed(RouteNames.otpVerificationName,
                  extra: data.user,
                  pathParameters: {'type': OtpTypes.resetPass.name});
            },
            orElse: () {});
      },
      builder: (context, state) {
        return LoadingScaffold(
          isLoading:
              state.maybeMap(loading: (data) => false, orElse: () => false),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Quên mật khẩu'),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimens.paddingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppDimens.spaceMd,
                  Text(
                    'Đặt lại mật khẩu',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  AppDimens.spaceSm,
                  const Text(
                    'Vui lòng nhập email đã đăng ký để tiếp tục.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  AppDimens.spaceLg,
                  TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  AppDimens.spaceLg,
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'TIẾP TỤC',
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  AppDimens.spaceMd,
                  Center(
                    child: TextButton(
                      onPressed: () => context.goNamed(RouteNames.loginName),
                      child: const Text(
                        'Quay lại đăng nhập',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
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
