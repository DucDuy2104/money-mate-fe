import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/presentation/pages/category/bloc/categories_bloc.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/category_type.dart';

class SuggestCategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;
  final VoidCallback? onApprove;

  const SuggestCategoryItem({
    super.key,
    required this.category,
    this.onTap,
    this.onApprove,
  });

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isIncome = category.type == CategoriesType.income;
    final typeColor = isIncome ? AppColors.upColor : AppColors.downColor;
    final typeText = isIncome ? s.income : s.expense;

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.paddingMd, vertical: AppDimens.paddingMd),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: category.color.withOpacity(0.2),
                child: Icon(category.icon, color: category.color, size: AppDimens.iconSize),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      category.name,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      typeText,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: typeColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
                  final isSelected = BlocProvider.of<CategoriesBloc>(context)
                      .checkCategory(category.id);
                  return ElevatedButton(
                    onPressed: isSelected ? null : onApprove,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: category.color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingMd),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      s.add,
                      style: context.textTheme.bodyMedium,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}