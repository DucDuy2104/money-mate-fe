import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/presentation/drawer_navigation/app_drawer.dart';
import 'package:money_mate/presentation/pages/category/bloc/categories_bloc.dart';
import 'package:money_mate/presentation/pages/category/widgets/category_dialogs.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/widgets/categories_grid.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_tab.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (BlocProvider.of<CategoriesBloc>(context).countSelectedCategories() ==
          0) {
        getCategories();
      }
    });
  }

  void getCategories() {
    final userId = BlocProvider.of<ProfileBloc>(context).getProfile()?.id;
    if (userId == null) return;
    BlocProvider.of<CategoriesBloc>(context)
        .add(CategoriesEvent.getCategories(userId));
  }

  void toggleCategory(Category category) {
    if (category.isSelected) {
      CategoryDialogs.showUpdateCategoryDialog(
          context, category, (budget) {}, () {});
      return;
    }
    final countSelectedCategories =
        BlocProvider.of<CategoriesBloc>(context).countSelectedCategories();
    if (countSelectedCategories == 10) {
      AppToast.warning(context, "Bạn đã chọn quá 10 danh mục");
    } else {
      CategoryDialogs.showAddCategoryDialog(
          context, category, (budget) {}, () {});
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
          isLoading: false,
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTab(
                    tab1Name: 'Chi tiêu',
                    tab2Name: 'Thu nhập',
                    controller: _tabController),
                AppDimens.spaceSmall,
                Expanded(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Builder(
                            builder: (context) {
                              bool isExpenseTab = _tabController.index == 0;
                              int selectedCount =
                                  BlocProvider.of<CategoriesBloc>(context)
                                      .countSelectedCategories();

                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    colors: isExpenseTab
                                        ? [
                                            Colors.blue.withOpacity(0.2),
                                            Colors.purple.withOpacity(0.2)
                                          ]
                                        : [
                                            Colors.green.withOpacity(0.2),
                                            Colors.teal.withOpacity(0.2)
                                          ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.2),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.lightbulb_outline,
                                        color: isExpenseTab
                                            ? Colors.amber
                                            : Colors.lightGreen,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        'Đã chọn $selectedCount/10 danh mục. Nhấn vào danh mục để thêm hoặc cập nhật hạn mức.',
                                        style: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: CategoriesGrid(
                                  categories: systemExpenseCategories,
                                  onCategorySelected: toggleCategory,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: CategoriesGrid(
                                  categories: systemIncomeCategories,
                                  onCategorySelected: toggleCategory,
                                ),
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
        );
      },
    );
  }
}
