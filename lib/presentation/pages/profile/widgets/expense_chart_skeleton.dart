import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

class ExpensePieChartSkeleton extends StatelessWidget {
  const ExpensePieChartSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[800]!,
            highlightColor: Colors.grey[600]!,
            child: Container(
              width: 180,
              height: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[800]!,
                  highlightColor: Colors.grey[600]!,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.grey[800]!,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        width: 80,
                        height: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[800]!,
                      highlightColor: Colors.grey[600]!,
                      child: Container(
                        width: 40,
                        height: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          AppDimens.spaceLg,
          _buildLegendSkeleton(),
        ],
      ),
    );
  }

  Widget _buildLegendSkeleton() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: List.generate(4, (index) => _buildLegendItemSkeleton()),
    );
  }

  Widget _buildLegendItemSkeleton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[800]!,
      highlightColor: Colors.grey[600]!,
      child: Container(
        width: 100,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}