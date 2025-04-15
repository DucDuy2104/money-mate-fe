import 'package:flutter/material.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/category_type.dart';

class CategoryDialogs {
  static Future<void> showUpdateCategoryDialog(
    BuildContext context,
    Category category,
    Function(double) onUpdate,
    VoidCallback onDeselect,
  ) async {
    final colors = AppColors.colorsData(context);
    final TextEditingController budgetController = TextEditingController(
      text: category.budget > 0
          ? (category.budget % 1 == 0
              ? category.budget.toInt().toString()
              : category.budget.toString())
          : '',
    );
    final s = S.of(context);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: colors.dialogColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          ),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: AppDimens.paddingMd),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.paddingMd),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppDimens.paddingSm),
                        decoration: BoxDecoration(
                          color: category.color.withOpacity(0.2),
                          borderRadius:
                              BorderRadius.circular(AppDimens.radiusSm),
                        ),
                        child: Icon(
                          category.icon,
                          color: category.color,
                          size: AppDimens.iconSize,
                        ),
                      ),
                      AppDimens.spaceMd,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category.name,
                              style: context.textTheme.titleLarge,
                            ),
                            AppDimens.divider,
                            Text(
                              category.type == CategoriesType.expense
                                  ? s.income
                                  : s.expense
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppDimens.spaceMd,
                  Text(s.budget, style: context.textTheme.bodyMedium),
                  AppDimens.spaceSm,
                  TextField(
                    controller: budgetController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      prefixIcon: const Icon(
                        Icons.attach_money,
                        size: AppDimens.iconSize,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                        borderSide: BorderSide(
                          color: category.color,
                          width: 1.5,
                        ),
                      ),
                      hintText: s.enterBudget,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: AppDimens.paddingMd,
                        horizontal: AppDimens.paddingMd,
                      ),
                    ),
                  ),
                  AppDimens.spaceMd,
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.withOpacity(0.3),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: AppDimens.paddingMd),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radiusMd),
                            ),
                          ),
                          child:
                              Text(s.cancel, style: context.textTheme.bodyMedium),
                        ),
                      ),
                      AppDimens.spaceMd,
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            onDeselect();
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: AppDimens.paddingMd),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radiusMd),
                            ),
                          ),
                          child: Text(s.delete,
                              style: context.textTheme.bodyMedium),
                        ),
                      ),
                      AppDimens.spaceMd,
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final budget =
                                double.tryParse(budgetController.text);
                            if (budget != null) {
                              onUpdate(budget);
                              Navigator.of(context).pop();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: category.color,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: AppDimens.paddingMd),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radiusMd),
                            ),
                            elevation: 0,
                          ),
                          child: Text(s.update,
                              style: context.textTheme.bodyMedium),
                        ),
                      ),
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

  static Future<void> showAddCategoryDialog(
    BuildContext context,
    Category category,
    Function(double) onAdd,
    VoidCallback onCancel,
  ) async {
    final colors = AppColors.colorsData(context);
    final TextEditingController budgetController = TextEditingController(
      text: category.budget > 0
          ? (category.budget % 1 == 0
              ? category.budget.toInt().toString()
              : category.budget.toString())
          : '',
    );
    final s = S.of(context);

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: colors.dialogColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          ),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: AppDimens.paddingMd),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.paddingMd),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppDimens.paddingMd),
                        decoration: BoxDecoration(
                          color: category.color.withOpacity(0.2),
                          borderRadius:
                              BorderRadius.circular(AppDimens.radiusMd),
                        ),
                        child: Icon(
                          category.icon,
                          color: category.color,
                          size: AppDimens.iconSize,
                        ),
                      ),
                      AppDimens.spaceMd,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(s.addName(category.name),
                                style: context.textTheme.titleLarge),
                            AppDimens.divider,
                            Text(
                                category.type == CategoriesType.expense
                                    ? s.expense
                                    : s.income,
                                style: context.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppDimens.spaceMd,
                  Text(s.setBudget, style: context.textTheme.bodyMedium),
                  AppDimens.spaceSm,
                  TextField(
                    controller: budgetController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      prefixIcon: const Icon(
                        Icons.attach_money,
                        size: AppDimens.iconSize,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                        borderSide: BorderSide(
                          color: category.color,
                          width: 1.5,
                        ),
                      ),
                      hintText: s.enterBudget,
                      contentPadding: const EdgeInsets.all(AppDimens.paddingMd),
                    ),
                  ),
                  AppDimens.spaceMd,
                  Container(
                    padding: const EdgeInsets.all(AppDimens.paddingMd),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.info_outline,
                          size: AppDimens.iconSize,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                              s.addCategoryConfirm,
                              style: context.textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  ),
                  AppDimens.spaceMd,
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            onCancel();
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.1),
                            padding: const EdgeInsets.symmetric(
                                vertical: AppDimens.paddingMd),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radiusMd),
                            ),
                          ),
                          child:
                              Text(s.cancel, style: context.textTheme.bodyMedium),
                        ),
                      ),
                      AppDimens.spaceMd,
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final nganSach =
                                double.tryParse(budgetController.text);
                            if (nganSach != null) {
                              onAdd(nganSach);
                              Navigator.of(context).pop();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: category.color,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: AppDimens.paddingMd),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radiusMd),
                            ),
                            elevation: 0,
                          ),
                          child:
                              Text(s.add, style: context.textTheme.bodyMedium),
                        ),
                      ),
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
