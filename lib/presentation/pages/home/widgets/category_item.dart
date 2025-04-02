import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/category.dart';
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
    String limitMessage = category.type == CategoriesType.expense
        ? 'Gần hết hạn mức'
        : 'Chưa đạt mục tiêu';

    List<Color> gradientColors = category.isSelected
        ? [
            const Color(0xFF2D2D3A),
            const Color(0xFF1E1E2A),
          ]
        : [
            const Color(0xFF1E1E2A),
            const Color(0xFF2D2D3A),
          ];

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 300,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: gradientColors,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
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
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Icon(
                          category.icon,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  category.name,
                                  style: TextStyle(
                                    color: category.isSelected
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.6),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                if (isNearLimit && category.isSelected)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: (category.type ==
                                                  CategoriesType.expense
                                              ? Colors.red
                                              : Colors.amber)
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      limitMessage,
                                      style: TextStyle(
                                        color: category.type ==
                                                CategoriesType.expense
                                            ? Colors.red[300]
                                            : Colors.amber[300],
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${(percent).toInt()}%',
                                  style: TextStyle(
                                    color: category.isSelected
                                        ? progressColor
                                        : progressColor.withOpacity(0.6),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${formatMoney(category.currentBudget)} / ${formatMoney(category.budget)}',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(
                                        category.isSelected ? 0.7 : 0.5),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
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
          // Thêm dấu hiệu disable (chỉ hiện khi !isSelected)
          if (!category.isSelected)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Color(0xFF1E1E2A),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.block,
                    color: Colors.grey,
                    size: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
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
      height: 12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.08),
      ),
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                width: constraints.maxWidth * progress,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                      blurRadius: 5,
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
            height: 5,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth * progress,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
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
