import 'package:flutter/material.dart';
import 'package:money_mate/shared/constants/constants.dart';

class AppTab extends StatelessWidget {
  final String tab1Name;
  final String tab2Name;
  final TabController? controller;
  const AppTab(
      {super.key,
      required this.tab1Name,
      required this.tab2Name,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.colorsData(context);
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: colors.seccondColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: TabBar(
          controller: controller,
          labelColor: colors.contrastColor,
          unselectedLabelColor: Colors.grey[400],
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF6B55E0).withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          dividerColor: Colors.transparent,
          splashBorderRadius: BorderRadius.circular(30),
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          tabs: [
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_today, size: 16),
                  const SizedBox(width: 6),
                  Text(tab1Name),
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_month, size: 16),
                  const SizedBox(width: 6),
                  Text(tab2Name),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
