import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/constants/app_colors.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/category_type.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;

  const CategoryItem({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double percent = category.budget == 0
        ? 100
        : (category.currentBudget / category.budget) * 100;
    double progress = category.budget == 0
        ? 1
        : (category.currentBudget / category.budget).clamp(0.0, 1.0);

    Color progressColor = _getProgressColor(progress, category.type);
    bool isNearLimit = category.type == CategoriesType.expense
        ? progress > 0.9
        : progress < 0.1;
    final colors = AppColors.colorsData(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          color: colors.seccondColor,
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.radiusMd),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          progressColor.withOpacity(0.7),
                          progressColor,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: progressColor.withOpacity(0.3),
                          blurRadius: 6,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Icon(
                      category.icon,
                      size: AppDimens.iconSize,
                    ),
                  ),
                  AppDimens.spaceSm,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                category.name,
                                style: context.textTheme.bodyLarge
                                    ?.copyWith(fontWeight: FontWeight.w600),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            _buildStatusIcon(category, isNearLimit),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${(percent).toInt()}%',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: category.isSelected
                                    ? progressColor
                                    : progressColor.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                                '${formatMoney(category.currentBudget)} / ${formatMoney(category.budget)}',
                                style: context.textTheme.bodySmall),
                          ],
                        ),
                        AppDimens.divider,
                        CustomProgressBar(
                          progress: progress,
                          progressColor: progressColor,
                          isSelected: category.isSelected,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIcon(Category category, bool isNearLimit) {
    // Priority 1: Always show block icon if category is not selected
    if (!category.isSelected) {
      return Container(
        width: 18,
        height: 18,
        margin: const EdgeInsets.only(left: 4),
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E2A),
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.block,
            color: Colors.grey,
            size: 12,
          ),
        ),
      );
    }

    // Priority 2: Show warning/goal icon if near limit and category is selected
    if (isNearLimit && category.isSelected) {
      return Container(
        width: 18,
        height: 18,
        margin: const EdgeInsets.only(left: 4),
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E2A),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            category.type == CategoriesType.expense
                ? Icons.warning_amber_rounded
                : Icons.flag_rounded,
            color: category.type == CategoriesType.expense
                ? Colors.red
                : Colors.amber,
            size: 12,
          ),
        ),
      );
    }

    // If no icon should be shown, return an empty SizedBox with fixed width
    // to maintain consistent spacing
    return const SizedBox(width: 18);
  }

  String formatMoney(double amount) {
    if (amount >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(amount % 1000000000 == 0 ? 0 : 1)}B';
    } else if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(amount % 1000000 == 0 ? 0 : 1)}M';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(amount % 1000 == 0 ? 0 : 1)}K';
    } else {
      return amount.toStringAsFixed(amount % 1 == 0 ? 0 : 1);
    }
  }

  Color _getProgressColor(double progress, CategoriesType type) {
    if (type == CategoriesType.income) {
      // For income, higher progress is better
      if (progress < 0.3) {
        return const Color(0xFFF44336); // Red - far from income goal
      } else if (progress < 0.7) {
        return const Color(0xFFFF9800); // Orange - approaching income goal
      } else {
        return const Color(0xFF4CAF79); // Green - reached/exceeded income goal
      }
    } else {
      // For expense, lower progress is better
      if (progress < 0.5) {
        return const Color(
            0xFF4CAF79); // Green - using little of expense budget
      } else if (progress < 0.8) {
        return const Color(
            0xFFFF9800); // Orange - getting close to budget limit
      } else {
        return const Color(0xFFF44336); // Red - close to or at budget limit
      }
    }
  }
}

class CustomProgressBar extends StatelessWidget {
  final double progress;
  final Color progressColor;
  final bool isSelected;

  const CustomProgressBar({
    super.key,
    required this.progress,
    required this.progressColor,
    this.isSelected = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.radiusSm),
        color: Colors.white.withOpacity(0.08),
      ),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth * progress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimens.radiusSm),
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      progressColor.withOpacity(isSelected ? 0.7 : 0.4),
                      progressColor.withOpacity(isSelected ? 1.0 : 0.6),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: progressColor.withOpacity(isSelected ? 0.3 : 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              );
            },
          ),
          // Gloss effect
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 3,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth * progress,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppDimens.radiusSm),
                      topRight: Radius.circular(AppDimens.radiusSm),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(isSelected ? 0.3 : 0.15),
                        Colors.white.withOpacity(0),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
