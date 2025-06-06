import 'package:flutter/material.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/category_type.dart';
import 'package:money_mate/shared/enums/message_type.dart';

class SwitchCategoryItem extends StatelessWidget {
  final Category category;
  final MessageType type;
  final Function()? onTap;

  const SwitchCategoryItem({
    super.key,
    required this.category,
    required this.type,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color typeColor = category.type == CategoriesType.income
        ? AppColors.upColor
        : AppColors.downColor;
    final s = S.of(context);

    final String typeText =
        category.type == CategoriesType.income ? s.income : s.expense;

    final width = MediaQuery.of(context).size.width * 0.8;

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingMd, vertical: AppDimens.paddingMd),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: category.color.withAlpha((0.2 * 255).toInt()),
                child: Icon(
                  category.icon,
                  color: category.color,
                ),
              ),
              AppDimens.spaceMd,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: context.textTheme.titleMedium
                          ?.copyWith(color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      typeText,
                      style: context.textTheme.bodySmall
                          ?.copyWith(color: typeColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: type == MessageType.add
                    ? Colors.green.withOpacity(0.2)
                    : Colors.red.withOpacity(0.2),
                child: Icon(
                  type == MessageType.add ? Icons.check : Icons.close,
                  color: type == MessageType.add ? Colors.green : Colors.red,
                  size: AppDimens.iconSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
