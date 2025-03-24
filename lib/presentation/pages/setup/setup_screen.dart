import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/presentation/pages/setup/bloc/setup_bloc.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class SetupScreen extends StatelessWidget {
  SetupScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();

  _onUpdate(BuildContext context) {
    final name = _nameController.text;
    final budget = _budgetController.text;

    if (name.isEmpty || budget.isEmpty) {
      AppToast.error(context, 'Vui lòng nhập đủ thông tin');
      return;
    }

    if (double.tryParse(budget) == null) {
      AppToast.error(context, 'Ngân sách phải là số');
      return;
    }

    BlocProvider.of<SetupBloc>(context)
        .add(SetupEvent.setup(name, double.tryParse(budget)!));
  }

  @override
  Widget build(BuildContext context) {
    // Dark theme colors
    final backgroundColor = Colors.grey.shade900;
    final cardColor = Colors.grey.shade800;
    final primaryColor = Theme.of(context).primaryColor;
    final textColor = Colors.white;
    final subtitleColor = Colors.grey.shade400;

    return BlocConsumer<SetupBloc, SetupState>(
      listener: (context, state) {
        state.maybeMap(
          success: (value) {
            AppToast.success(context, 'Thiết lập thành công');
          },
          error: (value) {
            AppToast.error(context, value.message);
          },
          orElse: () {});
      },
      builder: (context, state) {
        return LoadingScaffold(
          isLoading: state.maybeMap(
            loading: (value) => true,
            orElse: () => false),
          child: Scaffold(
            backgroundColor: backgroundColor,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.padding * 1.5,
                  vertical: AppDimens.padding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(flex: 1),
                    // Simple heading without gradient
                    Text(
                      'Chào mừng',
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: textColor,
                      ),
                    ),
                    Text(
                      'Thiết lập thông tin cá nhân',
                      style: context.textTheme.titleMedium?.copyWith(
                        color: subtitleColor,
                      ),
                    ),
                    const Spacer(flex: 2),
                    // Name input field with dark theme styling
                    TextField(
                      controller: _nameController,
                      style: TextStyle(color: textColor),
                      decoration: InputDecoration(
                        labelText: 'Tên của bạn',
                        labelStyle: TextStyle(color: subtitleColor),
                      ),
                    ),
                    AppDimens.spaceMedium,
                    // Budget input field with dark theme styling
                    TextField(
                      controller: _budgetController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: textColor),
                      decoration: InputDecoration(
                        labelText: 'Ngân sách hiện tại',
                        labelStyle: TextStyle(color: subtitleColor),
                        suffixText: 'VND',
                        suffixStyle: TextStyle(color: subtitleColor),
                      ),
                    ),
                    const Spacer(flex: 3),
                    // Button with solid color (no gradient)
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.3),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _onUpdate(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          'Tiếp tục',
                          style: context.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
