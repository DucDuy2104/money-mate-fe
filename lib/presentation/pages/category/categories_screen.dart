import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/presentation/drawer_navigation/app_drawer.dart';
import 'package:money_mate/presentation/pages/category/bloc/categories_bloc.dart';
import 'package:money_mate/presentation/pages/category/widgets/category_dialogs.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/widgets/categories_grid.dart';
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_tab.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/enums/category_type.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  void disableCategories(Category category) {
    final categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    final user = BlocProvider.of<ProfileBloc>(context).getProfile();
    categoriesBloc.add(CategoriesEvent.disableCategory(category.id, () {
      categoriesBloc.add(CategoriesEvent.reload(user!.id));
    }));
  }

  void enableCategories(Category category, double budget) {
    final categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    final user = BlocProvider.of<ProfileBloc>(context).getProfile();
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    BlocProvider.of<CategoriesBloc>(context)
        .add(CategoriesEvent.enableCategory(category.id, budget, () {
      categoriesBloc.add(CategoriesEvent.reload(user!.id));
      homeBloc.add(const HomeEvent.reloadData());
    }));
  }

  void toggleCategory(Category category) {
    final categoriesBloc = BlocProvider.of<CategoriesBloc>(context);
    if (category.isSelected) {
      CategoryDialogs.showUpdateCategoryDialog(context, category, (budget) {
        enableCategories(category, budget);
      }, () {
        final countSelectedExpenseCategories = categoriesBloc
            .countSelectedCategoriesByType(CategoriesType.expense);
        if (category.type == CategoriesType.expense &&
            countSelectedExpenseCategories <= 3) {
          AppToast.warning(
              context, "Bạn phải chọn ít nhất 3 danh mục chi tiêu");
          return;
        }
        final countSelectedIncomeCategories =
            categoriesBloc.countSelectedCategoriesByType(CategoriesType.income);
        if (category.type == CategoriesType.income &&
            countSelectedIncomeCategories <= 1) {
          AppToast.warning(
              context, "Bạn phải chọn ít nhất 1 danh mục thu nhập");
          return;
        }
        disableCategories(category);
      });
      return;
    }
    final countSelectedCategories =
        BlocProvider.of<CategoriesBloc>(context).countSelectedCategories();
    if (countSelectedCategories == 10) {
      AppToast.warning(context, "Bạn đã chọn quá 10 danh mục");
    } else {
      CategoryDialogs.showAddCategoryDialog(context, category, (budget) {
        enableCategories(category, budget);
      }, () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<CategoriesBloc>(context);
        final List<Category> systemExpenseCategories =
            bloc.getCategoriesByType(CategoriesType.expense);

        final List<Category> systemIncomeCategories =
            bloc.getCategoriesByType(CategoriesType.income);
        return LoadingScaffold(
          isLoading: state.maybeMap(
              loading: (state) => true,
              reloading: (state) => true,
              orElse: () => false),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Danh mục'),
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
            ),
            drawer: const AppDrawer(currentRoute: RouteNames.category),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.paddingMd),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTab(
                      tab1Name: 'Chi tiêu',
                      tab2Name: 'Thu nhập',
                      controller: _tabController),
                  AppDimens.spaceSm,
                  Expanded(
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Builder(
                            builder: (context) {
                              bool isExpenseTab = _tabController.index == 0;
                              int selectedCount =
                                  BlocProvider.of<CategoriesBloc>(context)
                                      .countSelectedCategories();

                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(AppDimens.radiusMd),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.green.withOpacity(0.2),
                                      Colors.teal.withOpacity(0.2)
                                    ],
                                  ),
                                ),
                                padding:
                                    const EdgeInsets.all(AppDimens.paddingMd),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(
                                          AppDimens.paddingSm),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.lightbulb_outline,
                                        size: AppDimens.iconSize,
                                        color: Colors.lightGreen,
                                      ),
                                    ),
                                    AppDimens.spaceSm,
                                    Expanded(
                                      child: Text(
                                        'Đã chọn $selectedCount danh mục. Nhấn vào danh mục để thêm hoặc cập nhật hạn mức.',
                                        style: context.textTheme.bodyMedium
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          AppDimens.spaceSm,
                          Expanded(
                            child: TabBarView(
                              controller: _tabController,
                              children: [
                                CategoriesGrid(
                                  categories: systemExpenseCategories,
                                  onCategorySelected: toggleCategory,
                                ),
                                CategoriesGrid(
                                  categories: systemIncomeCategories,
                                  onCategorySelected: toggleCategory,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
