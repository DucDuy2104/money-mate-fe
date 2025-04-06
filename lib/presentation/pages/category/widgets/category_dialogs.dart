import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/category.dart';
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
    final TextEditingController budgetController = TextEditingController(
      text: category.budget.toString(),
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF1E1E2E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
          ),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: AppDimens.padding),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppDimens.paddingSmall),
                        decoration: BoxDecoration(
                          color: category.color.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(
                              AppDimens.borderRadiusSmall),
                        ),
                        child: Icon(
                          category.icon,
                          color: category.color,
                          size: AppDimens.iconSize,
                        ),
                      ),
                      AppDimens.spaceMedium,
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
                                  ? "Chi tiêu"
                                  : "Thu nhập",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppDimens.space,
                  Text("Ngân sách", style: context.textTheme.bodyMedium),
                  AppDimens.spaceSmall,
                  TextField(
                    controller: budgetController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      prefixIcon: const Icon(
                        Icons.attach_money,
                        color: Colors.white70,
                        size: AppDimens.iconSize,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: category.color,
                          width: 1.5,
                        ),
                      ),
                      hintText: "Nhập ngân sách",
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: AppDimens.paddingMedium,
                        horizontal: AppDimens.paddingMedium,
                      ),
                    ),
                  ),
                  AppDimens.space,
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
                                vertical: AppDimens.paddingMedium),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.borderRadius),
                            ),
                          ),
                          child:
                              Text("Huỷ", style: context.textTheme.bodyMedium),
                        ),
                      ),
                      AppDimens.spaceMedium,
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
                                vertical: AppDimens.paddingMedium),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.borderRadius),
                            ),
                          ),
                          child: Text("Xoá bỏ",
                              style: context.textTheme.bodyMedium),
                        ),
                      ),
                      AppDimens.spaceMedium,
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
                                vertical: AppDimens.paddingSmall),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppDimens.borderRadius),
                            ),
                            elevation: 0,
                          ),
                          child: Text("Cập nhật",
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
    final TextEditingController budgetController = TextEditingController(
      text: category.budget.toString(),
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: const Color(0xFF1E1E2E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.borderRadius),
          ),
          insetPadding:
              const EdgeInsets.symmetric(horizontal: AppDimens.padding),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppDimens.paddingMedium),
                        decoration: BoxDecoration(
                          color: category.color.withOpacity(0.2),
                          borderRadius:
                              BorderRadius.circular(AppDimens.borderRadius),
                        ),
                        child: Icon(
                          category.icon,
                          color: category.color,
                          size: AppDimens.iconSize,
                        ),
                      ),
                      AppDimens.spaceMedium,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Thêm ${category.name}",
                                style: context.textTheme.titleLarge),
                            AppDimens.divider,
                            Text(
                                category.type == CategoriesType.expense
                                    ? "Danh mục chi tiêu"
                                    : "Danh mục thu nhập",
                                style: context.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                  AppDimens.space,
                  Text("Đặt ngân sách", style: context.textTheme.bodyMedium),
                  AppDimens.spaceSmall,
                  TextField(
                    controller: budgetController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                      prefixIcon: const Icon(
                        Icons.attach_money,
                        color: Colors.white70,
                        size: AppDimens.iconSize,
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimens.borderRadius),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimens.borderRadius),
                        borderSide: BorderSide(
                          color: category.color,
                          width: 1.5,
                        ),
                      ),
                      hintText: "Nhập số tiền ngân sách",
                      hintStyle: TextStyle(
                          color: const Color.fromARGB(255, 19, 16, 16)
                              .withOpacity(0.5)),
                      contentPadding:
                          const EdgeInsets.all(AppDimens.paddingMedium),
                    ),
                  ),
                  AppDimens.spaceMedium,
                  Container(
                    padding: const EdgeInsets.all(AppDimens.paddingMedium),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          size: AppDimens.iconSizeSmall,
                          color: Colors.white.withOpacity(0.7),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Thao tác này sẽ thêm danh mục vào kế hoạch ngân sách của bạn",
                            style: context.textTheme.bodyMedium
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppDimens.space,
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
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingMedium),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                            ),
                          ),
                          child: Text(
                            "Hủy",
                            style: context.textTheme.bodyMedium
                          ),
                        ),
                      ),
                      AppDimens.spaceMedium,
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
                            padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingMedium),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppDimens.borderRadius),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            "Thêm",
                            style: context.textTheme.bodyMedium
                          ),
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
