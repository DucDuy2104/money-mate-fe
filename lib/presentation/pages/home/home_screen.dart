import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/pages/home/models/category.dart';
import 'package:money_mate/presentation/drawer_navigation/app_drawer.dart';
import 'package:money_mate/presentation/pages/home/widgets/category_item.dart';
import 'package:money_mate/presentation/pages/home/widgets/expense_chart.dart';
import 'package:money_mate/presentation/pages/home/widgets/transaction_item.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/constants.dart';

final List<Category> sampleCategories = [
  const Category(
    id: "food",
    name: "Ăn uống",
    maxExpense: 5000000,
    currentExpense: 2500000,
  ),
  const Category(
    id: "transport",
    name: "Di chuyển",
    maxExpense: 2000000,
    currentExpense: 800000,
  ),
  const Category(
    id: "entertainment",
    name: "Giải trí",
    maxExpense: 3000000,
    currentExpense: 1200000,
  ),
  const Category(
    id: "shopping",
    name: "Mua sắm",
    maxExpense: 4000000,
    currentExpense: 3500000,
  ),
  const Category(
    id: "health",
    name: "Sức khỏe",
    maxExpense: 1500000,
    currentExpense: 500000,
  ),
  const Category(
    id: "education",
    name: "Giáo dục",
    maxExpense: 5000000,
    currentExpense: 2000000,
  ),
];

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

  void getData() {
    BlocProvider.of<HomeBloc>(context).add(const HomeEvent.getData());
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
                    title: Text('👋Hôm nay bạn thế nào?'),
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
                        horizontal: AppDimens.paddingSmall),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const IncomeExpenseChart(),
                        const SizedBox(height: 20),
                        const Text("Danh mục tiêu dùng",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 110,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: sampleCategories.length,
                            itemBuilder: (context, index) {
                              final category = sampleCategories[index];
                              return CategoryItem(category: category);
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    AppDimens.divider,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text("Chi tiêu gần đây",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
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
