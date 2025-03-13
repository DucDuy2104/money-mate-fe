import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/presentation/drawer_navigation/app_drawer.dart';
import 'package:money_mate/presentation/pages/profile/widgets/expense_pie_chart.dart';
import 'package:money_mate/presentation/pages/profile/widgets/profile_card.dart';
import 'package:money_mate/presentation/pages/profile/widgets/profile_tab.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

final Map<String, double> sampleExpenseData = {
  "Ăn uống": 1500000,
  "Giải trí": 800000,
  "Di chuyển": 600000,
  "Mua sắm": 1200000,
  "Hóa đơn": 900000,
  "Khác": 500000,
};

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2, // 2 tabs: Ngày - Tháng
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tài khoản'),
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(EvaIcons.menu2Outline),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
        ),
        drawer: const AppDrawer(currentRoute: RouteNames.profile),
        body: Column(
          children: [
            const ProfileCard(),
            AppDimens.spaceSmall,

            // TabBar với thiết kế hiện đại
            const ProfileTab(),

            // TabBarView hiển thị nội dung theo từng tab
            Expanded(
              child: TabBarView(
                children: [
                  ExpensePieChart(data: sampleExpenseData), // Theo Ngày
                  ExpensePieChart(data: sampleExpenseData), // Theo Tháng
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
