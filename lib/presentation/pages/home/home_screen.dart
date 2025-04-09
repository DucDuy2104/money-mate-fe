import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/category/bloc/categories_bloc.dart';
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/drawer_navigation/app_drawer.dart';
import 'package:money_mate/presentation/pages/home/widgets/category_item.dart';
import 'package:money_mate/presentation/pages/home/widgets/expense_chart.dart';
import 'package:money_mate/presentation/pages/home/widgets/transaction_item.dart';
import 'package:money_mate/presentation/pages/home/widgets/wallet_widget.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  void getCategories() {
    final userId = BlocProvider.of<ProfileBloc>(context).getProfile()?.id;
    if (userId == null) return;
    BlocProvider.of<CategoriesBloc>(context)
        .add(CategoriesEvent.getCategories(userId));
  }

  void getData() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.state.maybeMap(
        loaded: (state) {},
        orElse: () {
          homeBloc.add(HomeEvent.getData(() {
            BlocProvider.of<ProfileBloc>(context).add(ProfileEvent.getData(() {
              getCategories();
            }));
          }));
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.maybeMap(
            loaded: (state) {
              final transactions = state.data.transactions;
              final categories = state.data.categories;
              final statistic = state.data.statistic;
              return LoadingScaffold(
                isLoading: false,
                child: Scaffold(
                  appBar: AppBar(
                    leading: Builder(
                      builder: (context) {
                        return IconButton(
                          icon: const Icon(EvaIcons.menu2Outline),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                    title: const SimpleWalletWidget(),
                  ),
                  drawer: const AppDrawer(currentRoute: RouteNames.home),
                  floatingActionButton: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        // TODO: go to chat screen
                        context.pushNamed(RouteNames.chatName);
                      },
                      child: Image.asset('assets/images/otter.png',
                          width: 100, height: 100, fit: BoxFit.cover)),
                  body: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.paddingMd),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IncomeExpenseChart(statistic: statistic),
                        AppDimens.spaceSm,
                        Text("Danh mục tiêu dùng",
                            style: context.textTheme.titleLarge),
                        AppDimens.spaceSm,
                        SizedBox(
                          height: 85,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              final category = categories[index];
                              return CategoryItem(category: category);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    AppDimens.divider,
                          ),
                        ),
                        AppDimens.spaceMd,
                        Text("Chi tiêu gần đây",
                            style: context.textTheme.titleLarge),
                        AppDimens.spaceSm,
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                AppDimens.divider,
                            itemCount: transactions.length,
                            itemBuilder: (context, index) {
                              final transaction = transactions[index];
                              return TransactionItem(transaction: transaction);
                            },
                          ),
                        ),
                        AppDimens.spaceSm, // Add bottom spacing
                      ],
                    ),
                  ),
                ),
              );
            },
            orElse: () => LoadingScaffold(isLoading: true, child: Container()));
      },
    );
  }
}
