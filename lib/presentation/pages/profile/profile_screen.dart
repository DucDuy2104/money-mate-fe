import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/drawer_navigation/app_drawer.dart';
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/pages/profile/widgets/expense_chart_skeleton.dart';
import 'package:money_mate/presentation/pages/profile/widgets/expense_pie_chart.dart';
import 'package:money_mate/presentation/pages/profile/widgets/profile_card.dart';
import 'package:money_mate/shared/components/app_tab.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
            GestureDetector(
                onTap: () {
                  context.pushNamed(RouteNames.profileDetailsName);
                },
                child: const ProfileCard()),
            AppDimens.spaceSmall,
            const AppTab(
                tab1Name: 'Hôm nay', tab2Name: 'Tháng này', controller: null),
            Expanded(
              child: TabBarView(
                children: [
                  BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      return state.maybeMap(
                          loaded: (state) {
                            debugPrint("loaded: ${state.data.categories.length}");
                            return ExpensePieChart(
                                categories: state.data.categories);
                          },
                          updating: (state) {
                            return ExpensePieChart(
                                categories: state.data.categories);
                          },
                          orElse: () => const ExpensePieChartSkeleton());
                    },
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return state.maybeMap(
                          loaded: (state) {
                            return ExpensePieChart(
                                categories: state.data.categories);
                          },
                          orElse: () => const ExpensePieChartSkeleton());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
