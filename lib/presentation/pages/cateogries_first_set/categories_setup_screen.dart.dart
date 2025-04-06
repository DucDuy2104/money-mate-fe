import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/presentation/pages/category/widgets/category_dialogs.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/bloc/setup_categories_bloc.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/widgets/categories_grid.dart';
import 'package:money_mate/presentation/routes/bloc/routes_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/components/app_tab.dart';
import 'package:money_mate/shared/components/app_toast.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_dimens.dart';
import 'package:money_mate/shared/constants/app_theme.dart';
import 'package:money_mate/shared/utils/screen_utils.dart';

class CategoriesSetupScreen extends StatefulWidget {
  const CategoriesSetupScreen({super.key});

  @override
  State<CategoriesSetupScreen> createState() => _CategoriesSetupScreenState();
}

class _CategoriesSetupScreenState extends State<CategoriesSetupScreen>
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
      getCategories();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void removeCategory(Category category) {
    if (!category.isSelected) return;
    BlocProvider.of<SetupCategoriesBloc>(context)
        .add(SetupCategoriesEvent.toggleCategory(category.id));
    updateLimit(category, null);
  }

  void addCategory(Category category, double? budget) {
    if (category.isSelected) return;
    BlocProvider.of<SetupCategoriesBloc>(context)
        .add(SetupCategoriesEvent.toggleCategory(category.id));
    updateLimit(category, budget);
  }

  void updateLimit(Category category, double? budget) {
    BlocProvider.of<SetupCategoriesBloc>(context)
        .add(SetupCategoriesEvent.updateCategoryBudget(category.id, budget));
  }

  void toggleCategory(Category category) {
    if (category.isSelected) {
      CategoryDialogs.showUpdateCategoryDialog(context, category, (budget) {
        updateLimit(category, budget);
      }, () {
        removeCategory(category);
      });
    } else {
      CategoryDialogs.showAddCategoryDialog(context, category, (budget) {
        addCategory(category, budget);
      }, () {});
    }
  }

  void getCategories() {
    try {
      BlocProvider.of<SetupCategoriesBloc>(context)
          .add(SetupCategoriesEvent.getCategories());
    } catch (e) {
      AppToast.error(context, 'Lỗi khi tải danh mục, vui lòng thử lại');
      debugPrint(e.toString());
    }
  }

  void onSetupCategories() {
    try {
      final bloc = BlocProvider.of<SetupCategoriesBloc>(context);
      if (bloc.countSelectedExpenseCategories() < 3) {
        AppToast.error(context, 'Vui lòng chọn ít nhất 3 danh mục chi tiêu');
        return;
      }

      if (bloc.countSelectedIncomeCategories() == 0) {
        AppToast.error(context, 'Vui lòng chọn ít nhất 1 danh mục thu nhập');
        return;
      }

      final selectedCategories = bloc.getSelectedCategories();
      bloc.add(SetupCategoriesEvent.setupCategories(selectedCategories));
    } catch (e) {
      AppToast.error(context, 'Lỗi khi cài đặt danh mục, vui lòng thử lại');
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SetupCategoriesBloc, SetupCategoriesState>(
      listener: (context, state) {
        state.maybeMap(
          setupSuccess: (state) {
            BlocProvider.of<RoutesBloc>(context)
                .add(const RoutesEvent.setAuth());
            context.goNamed(RouteNames.homeName);
          },
          error: (state) {
            AppToast.error(context, state.message);
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        final bloc = BlocProvider.of<SetupCategoriesBloc>(context);
        final List<Category> systemExpenseCategories =
            bloc.getExpensesCategories();

        final List<Category> systemIncomeCategories =
            bloc.getIncomeCategories();
        return LoadingScaffold(
          isLoading: state.maybeMap(loading: (_) => true, orElse: () => false),
          child: Scaffold(
            backgroundColor: const Color(0xFF121212),
            body: Padding(
              padding: ScreenUtils.screenPaddingWithSafeArea(context),
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chọn danh mục',
                        style: context.textTheme.displaySmall),
                    AppDimens.spaceSmall,
                    const Text(
                      'Chọn các danh mục phù hợp với thu chi của bạn (tối thiểu 3 danh mục chi tiêu và 1 danh mục thu nhập)',
                    ),
                    AppDimens.spaceSmall,
                    AppTab(
                        tab1Name: 'Chi tiêu',
                        tab2Name: 'Thu nhập',
                        controller: _tabController),
                    AppDimens.spaceSmall,
                    Builder(
                      builder: (context) {
                        bool isExpenseTab = _tabController.index == 0;
                        int selectedCount =
                            BlocProvider.of<SetupCategoriesBloc>(context)
                                .getSelectedCategories()
                                .length;

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
                          padding:
                              const EdgeInsets.all(AppDimens.paddingMedium),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(
                                    AppDimens.paddingSmall),
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
                              AppDimens.spaceSmall,
                              Expanded(
                                child: Text(
                                  'Đã chọn $selectedCount danh mục. Nhấn vào danh mục để thêm hoặc cập nhật hạn mức.',
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    AppDimens.space,
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
                    AppDimens.space,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          onSetupCategories();
                        },
                        child: Text(
                          'Bắt đầu sử dụng',
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
