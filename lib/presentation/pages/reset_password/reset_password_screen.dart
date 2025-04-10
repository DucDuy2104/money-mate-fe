import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/presentation/pages/reset_password/bloc/reset_pass_bloc.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class ResetPassScreen extends StatefulWidget {
  final User user;

  const ResetPassScreen({super.key, required this.user});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String newPass = _newPasswordController.text.trim();
    String confirm = _confirmPasswordController.text.trim();

    if (newPass.isEmpty) {
      _showError('Vui lòng nhập mật khẩu mới');
      return;
    }

    if (newPass.length < 6) {
      _showError('Mật khẩu phải có ít nhất 6 ký tự');
      return;
    }

    if (confirm != newPass) {
      _showError('Mật khẩu xác nhận không khớp');
      return;
    }

    _resetPassword(newPass);
  }

  void _resetPassword(String password) {
    BlocProvider.of<ResetPassBloc>(context)
        .add(ResetPassEvent.resetPassword(widget.user.id, password));
  }

  void _showError(String message) {
    AppToast.error(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPassBloc, ResetPassState>(
      listener: (context, state) {
        state.maybeMap(
            error: (data) {
              AppToast.error(context, data.error);
            },
            success: (data) {
              AppToast.success(context, 'Đặt lại mật khẩu thành công!');
              context.go('/login');
            },
            orElse: () {});
      },
      builder: (context, state) {
        return LoadingScaffold(
          isLoading:
              state.maybeMap(loading: (data) => true, orElse: () => false),
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
                    'Vui lòng tạo mật khẩu mới cho tài khoản của bạn.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  AppDimens.spaceLg,
                  TextField(
                    controller: _newPasswordController,
                    obscureText: _obscureNewPassword,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu mới',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureNewPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureNewPassword = !_obscureNewPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  AppDimens.spaceLg,
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    decoration: InputDecoration(
                      labelText: 'Xác nhận mật khẩu mới',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  AppDimens.spaceLg,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      child: Text(
                        'ĐẶT LẠI MẬT KHẨU',
                        style: context.textTheme.bodyMedium,
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
