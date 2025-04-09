import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/category_type.dart';

class ExpensePieChart extends StatelessWidget {
  final List<Category> categories;

  const ExpensePieChart({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    final data = getExpenseData(categories);
    if (data.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(AppDimens.paddingMd),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E2E),
          borderRadius: BorderRadius.circular(AppDimens.radiusMd),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: AppDimens.radiusMd,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/story_set_empty.png',
              height: 180,
              fit: BoxFit.contain,
            ),
            AppDimens.spaceMd,
            Text("Bạn chưa có dữ liệu chi tiêu",
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(AppDimens.paddingMd),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2E),
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: AppDimens.radiusMd,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text("Chi tiêu theo danh mục", style: context.textTheme.titleLarge),
          AppDimens.spaceMd,
          SizedBox(
            height: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    sections: _generatePieSections(data, categories),
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
                      _formatCurrency(data.values.reduce((a, b) => a + b)),
                      style: const TextStyle(
                        color: Color(0xFFE0E0E0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Tổng", style: context.textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
          ),
          AppDimens.spaceMd,
          _buildEnhancedLegend(context, data, categories),
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
      if (category.type == CategoriesType.expense && category.currentBudget > 0)
        category.name: category.currentBudget
  };
}

List<PieChartSectionData> _generatePieSections(
    Map<String, double> data, List<Category> categories) {
  return data.entries.map((entry) {
    // Find the corresponding category object to get its color
    final category = categories.firstWhere((cat) => cat.name == entry.key);

    return PieChartSectionData(
      color: category.color, // Use the category's color
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

Widget _buildEnhancedLegend(
    BuildContext context, Map<String, double> data, List<Category> categories) {
  final Map<String, double> percentages = {};
  final double total = data.values.reduce((a, b) => a + b);
  data.forEach((key, value) {
    percentages[key] = (value / total) * 100;
  });

  final List<MapEntry<String, double>> sortedEntries =
      percentages.entries.toList()..sort((a, b) => b.value.compareTo(a.value));

  return Wrap(
    spacing: AppDimens.paddingSm,
    runSpacing: AppDimens.paddingSm,
    alignment: WrapAlignment.center,
    children: sortedEntries.map((entry) {
      // Find the corresponding category object to get its color
      final category = categories.firstWhere((cat) => cat.name == entry.key);

      return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.paddingSm, vertical: AppDimens.paddingXs),
        decoration: BoxDecoration(
          color: const Color(0xFF242438),
          borderRadius: BorderRadius.circular(AppDimens.radiusSm),
          border: Border.all(
            color: category.color.withOpacity(0.5),
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
                color: category.color,
                shape: BoxShape.circle,
              ),
            ),
            AppDimens.spaceXs,
            Text(entry.key, style: context.textTheme.bodyMedium),
            AppDimens.spaceXs,
            Text("${entry.value.toStringAsFixed(1)}%",
                style: context.textTheme.bodyMedium),
          ],
        ),
      );
    }).toList(),
  );
}
