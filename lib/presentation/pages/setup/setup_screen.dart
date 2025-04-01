import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/setup/bloc/setup_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';

class SetupScreen extends StatelessWidget {
  SetupScreen({super.key});

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _budgetFocusNode = FocusNode();

  _onUpdate(BuildContext context) {
    try {
      final name = _nameController.text;
      final budget = _budgetController.text;

      _nameFocusNode.unfocus();
      _budgetFocusNode.unfocus();

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
    } catch (e) {
      AppToast.error(context, 'Đã có lỗi xảy ra');
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetupBloc, SetupState>(
      listener: (context, state) {
        state.maybeMap(
            success: (value) {
              context.goNamed(RouteNames.categoryRegisterName);
            },
            error: (value) {
              AppToast.error(context, value.message);
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
                  Text(
                    'Thiết lập tài khoản',
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  AppDimens.spaceLarge,
                  TextField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    onSubmitted: (value) {
                      _budgetFocusNode.requestFocus();
                    },
                    decoration: InputDecoration(
                      labelText: 'Tên của bạn',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  AppDimens.spaceLarge,
                  TextField(
                    controller: _budgetController,
                    focusNode: _budgetFocusNode,
                    onSubmitted: (value) {
                      _onUpdate(context);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Ngân sách hiện tại (VND)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  AppDimens.spaceLarge,
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        _onUpdate(context);
                      },
                      child: Text(
                        'Tiếp tục',
                        style: context.textTheme.bodyLarge
                            ?.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  AppDimens.spaceLarge,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Bạn đã có thông tin?"),
                      AppDimens.spaceSmall,
                      GestureDetector(
                        onTap: () {
                          context.goNamed(RouteNames.homeName);
                        },
                        child: Text('Bỏ qua',
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
