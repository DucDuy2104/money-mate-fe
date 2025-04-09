import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/setup/bloc/setup_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_assets.dart';
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
          success: (_) => context.goNamed(RouteNames.categoryRegisterName),
          error: (value) => AppToast.error(context, value.message),
          orElse: () {},
        );
      },
      builder: (context, state) {
        return LoadingScaffold(
          isLoading: state.maybeMap(loading: (_) => true, orElse: () => false),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.paddingMd,
                    vertical: AppDimens.paddingLg,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          MediaQuery.of(context).padding.bottom -
                          AppDimens.paddingLg * 2,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppAssets.storySetSetup,
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.width * 0.4,
                            fit: BoxFit.contain,
                          ),
                          AppDimens.spaceMd,
                          Text(
                            'Thiết lập tài khoản',
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          AppDimens.spaceSm,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.paddingMd),
                            child: Text(
                              'Vui lòng nhập thêm thông tin (Tên và ngân sách hiện tại của bạn) để thiết lập tài khoản',
                              textAlign: TextAlign.center,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                          AppDimens.spaceLg,
                          TextField(
                            controller: _nameController,
                            focusNode: _nameFocusNode,
                            onSubmitted: (_) => _budgetFocusNode.requestFocus(),
                            decoration: InputDecoration(
                              labelText: 'Tên của bạn',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.radiusMd),
                              ),
                            ),
                          ),
                          AppDimens.spaceMd,
                          TextField(
                            controller: _budgetController,
                            focusNode: _budgetFocusNode,
                            onSubmitted: (_) => _onUpdate(context),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'Ngân sách hiện tại (VND)',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppDimens.radiusMd),
                              ),
                            ),
                          ),
                          AppDimens.spaceLg,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () => _onUpdate(context),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppDimens.radiusMd),
                                ),
                              ),
                              child: Text(
                                'Tiếp tục',
                                style: context.textTheme.bodyLarge?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
