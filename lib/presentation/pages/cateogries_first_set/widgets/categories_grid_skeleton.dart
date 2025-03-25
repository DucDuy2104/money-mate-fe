import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesGridSkeleton extends StatelessWidget {
  final int itemCount;

  const CategoriesGridSkeleton({
    Key? key, 
    this.itemCount = 9, // Default to match 3x3 grid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.85,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[800]!,
          highlightColor: Colors.grey[700]!,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xFF1E1E1E),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Skeleton for category icon
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white24,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Skeleton for category name
                Container(
                  width: 80,
                  height: 16,
                  color: Colors.white24,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}