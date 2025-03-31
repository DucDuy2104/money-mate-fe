import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/enums/category_type.dart';

final List<Color> colors = [
  const Color(0xFF6258E8), // Purple
  const Color(0xFFFF6B8B), // Pink
  const Color(0xFF5FBCFF), // Blue
  const Color(0xFF38CFBB), // Teal
  const Color(0xFFFFB86C), // Orange
  const Color(0xFFCB8EF9), // Lavender
  const Color(0xFFFF8C42), // Bright Orange
  const Color(0xFF2EC4B6), // Cyan
  const Color(0xFF5C6BC0), // Indigo
  const Color(0xFFFFC857), // Yellow
];

class ExpensePieChart extends StatelessWidget {
  final List<Category> categories;

  const ExpensePieChart({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final data = getExpenseData(categories);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2E),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            "Chi tiêu theo danh mục",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC9C9D5),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sections: _generatePieSections(data),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                    centerSpaceRadius: 50,
                    startDegreeOffset: 270,
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${_formatCurrency(data.values.reduce((a, b) => a + b))}",
                      style: const TextStyle(
                        color: Color(0xFFE0E0E0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Tổng",
                      style: TextStyle(
                        color: Color(0xFF8D8D9A),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppDimens.spaceLarge,
          _buildEnhancedLegend(data),
        ],
      ),
    );
  }

  String _formatCurrency(double amount) {
    if (amount >= 1000000) {
      return "${(amount / 1000000).toStringAsFixed(1)}M";
    } else if (amount >= 1000) {
      return "${(amount / 1000).toStringAsFixed(1)}K";
    } else {
      return amount.toStringAsFixed(0);
    }
  }
}

Map<String, double> getExpenseData(List<Category> categories) {
  return {
    for (var category in categories)
      if (category.type == CategoriesType.expense)
        category.name: category.currentBudget
  };
}

List<PieChartSectionData> _generatePieSections(Map<String, double> data) {
  return data.entries.map((entry) {
    final index = data.keys.toList().indexOf(entry.key);
    final percentage =
        (entry.value / data.values.reduce((a, b) => a + b) * 100);

    return PieChartSectionData(
      color: colors[index % colors.length],
      value: entry.value,
      title: '',
      radius: 100,
      titleStyle: const TextStyle(
        fontSize: 0,
        fontWeight: FontWeight.bold,
        color: Colors.transparent,
      ),
    );
  }).toList();
}

Widget _buildEnhancedLegend(Map<String, double> data) {
  final Map<String, double> percentages = {};
  final double total = data.values.reduce((a, b) => a + b);
  data.forEach((key, value) {
    percentages[key] = (value / total) * 100;
  });

  final List<MapEntry<String, double>> sortedEntries =
      percentages.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

  return Wrap(
    spacing: 12,
    runSpacing: 12,
    alignment: WrapAlignment.center,
    children: sortedEntries.map((entry) {
      final index = data.keys.toList().indexOf(entry.key);
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF242438),
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: colors[index % colors.length].withOpacity(0.5),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: colors[index % colors.length],
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              entry.key,
              style: const TextStyle(
                color: Color(0xFFD5D5E0),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 6),
            Text(
              "${entry.value.toStringAsFixed(1)}%",
              style: const TextStyle(
                color: Color(0xFF8D8D9A),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}
