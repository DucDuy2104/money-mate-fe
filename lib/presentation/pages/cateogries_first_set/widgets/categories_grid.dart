import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/widgets/categories_grid_skeleton.dart';
import 'package:money_mate/shared/constants/constants.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';

class CategoriesGrid extends StatelessWidget {
  final List<Category> categories;
  final Function(Category) onCategorySelected;

  const CategoriesGrid({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });
  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) return const CategoriesGridSkeleton();
    final colors = AppColors.colorsData(context);
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.85,
        crossAxisSpacing: AppDimens.paddingMd,
        mainAxisSpacing: AppDimens.paddingMd,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        final isSelected = category.isSelected;

        return AnimatedScale(
          scale: 1,
          duration: const Duration(milliseconds: 200),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.radiusMd),
              gradient: isSelected
                  ? LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        category.color.withOpacity(0.3),
                        category.color.withOpacity(0.1),
                      ],
                    )
                  : null,
              color: isSelected ? null : colors.seccondColor,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: category.color.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 1,
                      )
                    ]
                  : null,
              border: Border.all(
                color: isSelected ? category.color : Colors.transparent,
                width: 2,
              ),
            ),
            child: InkWell(
              onTap: () {
                onCategorySelected(category);
              },
              borderRadius: BorderRadius.circular(AppDimens.radiusMd),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: AppDimens.avatarSize,
                    height: AppDimens.avatarSize,
                    decoration: BoxDecoration(
                      color: category.color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      category.icon,
                      color: category.color,
                      size: AppDimens.iconSize + 2,
                    ),
                  ),
                  AppDimens.spaceSm,
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? category.color : null,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (isSelected) ...[
                    AppDimens.spaceSm,
                    Text(
                      CurrencyHelper.formatCurrency(category.budget),
                      style: context.textTheme.bodySmall?.copyWith(
                        color: category.color,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
