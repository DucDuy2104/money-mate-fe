import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/domain/entities/statistic.dart';
import 'package:money_mate/shared/constants/constants.dart';
import 'package:money_mate/shared/utils/datetime_utils.dart';
import 'package:intl/intl.dart';

class IncomeExpenseChart extends StatelessWidget {
  final FourMonthsStatistic statistic;
  const IncomeExpenseChart({super.key, required this.statistic});

  String _formatNumber(double value) {
    final formatter = NumberFormat.compact();
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    final incomes = statistic.incomes;
    final expenses = statistic.expenses;
    final maxY = [...incomes, ...expenses].reduce((a, b) => a > b ? a : b) * 2;
    final colors = AppColors.colorsData(context);
    final s = S.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors.gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        reservedSize: 32,
                        getTitlesWidget: (value, meta) {
                          final style = context.textTheme.bodySmall;

                          final months = DatetimeUtils.getLastFourMonths();

                          if (value.toInt() >= 0 &&
                              value.toInt() < months.length) {
                            return Padding(
                              padding: const EdgeInsets.only(top: AppDimens.paddingSm),
                              child: Text(months[value.toInt()], style: style),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: 3,
                  minY: 0,
                  maxY: maxY,
                  gridData: const FlGridData(show: false),
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      tooltipPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                      getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                        return touchedBarSpots.map((barSpot) {
                          final value = barSpot.y;
                          final index = barSpot.barIndex;
                          final formattedValue = _formatNumber(value);

                          return LineTooltipItem(
                            formattedValue,
                            TextStyle(
                              color: index == 0
                                  ? Colors.pinkAccent
                                  : Colors.cyanAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                    handleBuiltInTouches: true,
                    getTouchedSpotIndicator:
                        (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((spotIndex) {
                        return TouchedSpotIndicatorData(
                          const FlLine(color: Colors.white, strokeWidth: 2),
                          FlDotData(
                            getDotPainter: (spot, percent, barData, index) {
                              return FlDotCirclePainter(
                                radius: 5,
                                color: barData.gradient?.colors.first ??
                                    Colors.white,
                                strokeWidth: 2,
                                strokeColor: Colors.white,
                              );
                            },
                          ),
                        );
                      }).toList();
                    },
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, expenses[0]),
                        FlSpot(1, expenses[1]),
                        FlSpot(2, expenses[2]),
                        FlSpot(3, expenses[3]),
                      ],
                      isCurved: true,
                      curveSmoothness: 0.1,
                      gradient: const LinearGradient(
                        colors: [Colors.redAccent, Colors.pinkAccent],
                      ),
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(0, incomes[0]),
                        FlSpot(1, incomes[1]),
                        FlSpot(2, incomes[2]),
                        FlSpot(3, incomes[3]),
                      ],
                      isCurved: true,
                      gradient: const LinearGradient(
                        colors: [Colors.blueAccent, Colors.cyanAccent],
                      ),
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLegendItem(
                  context,
                  const LinearGradient(
                    colors: [Colors.redAccent, Colors.pinkAccent],
                  ),
                  s.income,
                ),
                const SizedBox(width: 24),
                _buildLegendItem(
                  context,
                  const LinearGradient(
                    colors: [Colors.blueAccent, Colors.cyanAccent],
                  ),
                  s.expense,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context, Gradient gradient, String label) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 4,
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: context.textTheme.bodySmall
        ),
      ],
    );
  }
}
