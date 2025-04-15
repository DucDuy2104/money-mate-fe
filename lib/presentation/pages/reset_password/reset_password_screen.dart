import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/presentation/pages/reset_password/bloc/reset_pass_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
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

    if (newPass.length < 6) {
      _showError(S.of(context).passwordLengthLessThanRegulation);
      return;
    }

    if (confirm != newPass) {
      _showError(S.of(context).passwordNotMatch);
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
    final colors = AppColors.colorsData(context);
    final s = S.of(context);
    return BlocConsumer<ResetPassBloc, ResetPassState>(
      listener: (context, state) {
        state.maybeMap(
            error: (data) {
              AppToast.error(context, data.error);
            },
            success: (data) {
              AppToast.success(context, s.resetPasswordSuccess);
              context.goNamed(RouteNames.loginName);
            },
            orElse: () {});
      },
      builder: (context, state) {
        return LoadingScaffold(
          isLoading:
              state.maybeMap(loading: (data) => true, orElse: () => false),
          child: Scaffold(
            appBar: AppBar(
              title: Text(s.resetPassword),
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
                    s.resetPassword,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  AppDimens.spaceSm,
                  Text(
                    s.resetPasswordPlease,
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: colors.subTextColor),
                  ),
                  AppDimens.spaceLg,
                  TextField(
                    controller: _newPasswordController,
                    obscureText: _obscureNewPassword,
                    decoration: InputDecoration(
                      labelText: s.password,
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
                      labelText: s.confirmPassword,
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
                        s.resetPassword,
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
