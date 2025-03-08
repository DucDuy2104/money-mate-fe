import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IncomeExpenseChart extends StatelessWidget {
  const IncomeExpenseChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              leftTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 40),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    const months = [
                      'Jan',
                      'Feb',
                      'Mar',
                      'Apr',
                      'May',
                      'Jun',
                      'Jul',
                      'Aug',
                      'Sep',
                      'Oct',
                      'Nov',
                      'Dec'
                    ];
                    return Text(months[value.toInt()], style: const TextStyle(fontSize: 12));
                  },
                  reservedSize: 32,
                ),
              ),
            ),
            borderData: FlBorderData(show: true),
            gridData: FlGridData(show: true),
            lineBarsData: [
              // Line cho thu nhập
              LineChartBarData(
                spots: [
                  FlSpot(0, 400),
                  FlSpot(1, 600),
                  FlSpot(2, 500),
                  FlSpot(3, 700),
                  FlSpot(4, 650),
                  FlSpot(5, 800),
                  FlSpot(6, 750),
                  FlSpot(7, 900),
                  FlSpot(8, 850),
                  FlSpot(9, 1100),
                  FlSpot(10, 1050),
                  FlSpot(11, 1200),
                ],
                isCurved: true,
                color: Colors.green,
                barWidth: 4,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
              ),
              // Line cho chi tiêu
              LineChartBarData(
                spots: [
                  FlSpot(0, 300),
                  FlSpot(1, 500),
                  FlSpot(2, 450),
                  FlSpot(3, 600),
                  FlSpot(4, 580),
                  FlSpot(5, 720),
                  FlSpot(6, 700),
                  FlSpot(7, 850),
                  FlSpot(8, 800),
                  FlSpot(9, 950),
                  FlSpot(10, 900),
                  FlSpot(11, 1100),
                ],
                isCurved: true,
                color: Colors.red,
                barWidth: 4,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
