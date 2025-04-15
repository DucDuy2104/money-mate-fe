import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/presentation/pages/update_pass/bloc/password_bloc.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class UpdatePassScreen extends StatefulWidget {
  const UpdatePassScreen({super.key});

  @override
  State<UpdatePassScreen> createState() => _UpdatePassScreenState();
}

class _UpdatePassScreenState extends State<UpdatePassScreen> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    String current = _currentPasswordController.text.trim();
    String newPass = _newPasswordController.text.trim();
    String confirm = _confirmPasswordController.text.trim();

    if (current.isEmpty || newPass.isEmpty || confirm.isEmpty) {
      _showError(S.of(context).emptyFieldError);
      return;
    }

    if (newPass.length < 8) {
      _showError(S.of(context).passwordLengthLessThanRegulation);
      return;
    }

    if (confirm != newPass) {
      _showError(S.of(context).passwordNotMatch);
      return;
    }

    _updatePass(current, newPass);
  }

  void _updatePass(String oldPass, String password) {
    BlocProvider.of<PasswordBloc>(context)
        .add(PasswordEvent.updatePass(oldPass, password));
  }

  void _showError(String message) {
    AppToast.error(context, message);
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.colorsData(context);
    final s = S.of(context);
    return BlocConsumer<PasswordBloc, PasswordState>(
      listener: (context, state) {
        state.maybeMap(
            error: (data) {
              AppToast.error(context, data.err);
            },
            success: (data) {
              AppToast.success(context, s.updatePassSuccess);
              if (context.canPop()) {
                context.pop();
              }
            },
            orElse: () {});
      },
      builder: (context, state) {
        return LoadingScaffold(
          isLoading:
              state.maybeMap(loading: (data) => true, orElse: () => false),
          child: Scaffold(
            appBar: AppBar(
              title: Text(s.changePassword),
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
                    s.changePassword,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  AppDimens.spaceSm,
                  Text(
                    s.changePasswordDescription,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: colors.subTextColor),
                  ),
                  AppDimens.spaceLg,
                  TextField(
                    controller: _currentPasswordController,
                    obscureText: _obscureCurrentPassword,
                    decoration: InputDecoration(
                      labelText: s.currentPassword,
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureCurrentPassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureCurrentPassword = !_obscureCurrentPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  AppDimens.spaceLg,
                  TextField(
                    controller: _newPasswordController,
                    obscureText: _obscureNewPassword,
                    decoration: InputDecoration(
                      labelText: s.newPassword,
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
                      labelText: s.confirmNewPassword,
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
                        s.changePassword,
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
