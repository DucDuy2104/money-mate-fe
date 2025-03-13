import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

class ExpensePieChart extends StatelessWidget {
  final Map<String, double> data;

  const ExpensePieChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2E), // Dark background
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
              color: Color(0xFFC9C9D5), // Light gray text
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
                    sections: _generatePieSections(),
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0, // Remove space between sections
                    centerSpaceRadius: 50,
                    startDegreeOffset: 270, // Start from top
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
          _buildEnhancedLegend(),
        ],
      ),
    );
  }

  List<PieChartSectionData> _generatePieSections() {
    // Modern gradient colors
    final List<Color> colors = [
      const Color(0xFF6258E8), // Purple
      const Color(0xFFFF6B8B), // Pink
      const Color(0xFF5FBCFF), // Blue
      const Color(0xFF38CFBB), // Teal
      const Color(0xFFFFB86C), // Orange
      const Color(0xFFCB8EF9), // Lavender
    ];

    return data.entries.map((entry) {
      final index = data.keys.toList().indexOf(entry.key);
      final percentage = (entry.value / data.values.reduce((a, b) => a + b) * 100);
      
      return PieChartSectionData(
        color: colors[index % colors.length],
        value: entry.value,
        title: '', // Remove title from sections
        radius: 100, // Fixed radius for all sections
        titleStyle: const TextStyle(
          fontSize: 0,
          fontWeight: FontWeight.bold,
          color: Colors.transparent,
        ),
      );
    }).toList();
  }

  Widget _buildEnhancedLegend() {
    // Modern gradient colors
    final List<Color> colors = [
      const Color(0xFF6258E8), // Purple
      const Color(0xFFFF6B8B), // Pink
      const Color(0xFF5FBCFF), // Blue
      const Color(0xFF38CFBB), // Teal
      const Color(0xFFFFB86C), // Orange
      const Color(0xFFCB8EF9), // Lavender
    ];

    // Calculate percentages for better display
    final Map<String, double> percentages = {};
    final double total = data.values.reduce((a, b) => a + b);
    data.forEach((key, value) {
      percentages[key] = (value / total) * 100;
    });

    // Sort by value descending for better visual hierarchy
    final List<MapEntry<String, double>> sortedEntries = percentages.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

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