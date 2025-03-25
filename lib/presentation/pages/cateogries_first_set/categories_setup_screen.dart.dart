import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/bloc/categories_bloc.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/funcs/add_category_dialog.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/funcs/limit_dialog.dart';
import 'package:money_mate/presentation/pages/cateogries_first_set/widgets/categories_grid.dart';
import 'package:money_mate/shared/components/app_tab.dart';
import 'package:money_mate/shared/components/app_toast.dart';

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
      getCategories(context);
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
    BlocProvider.of<CategoriesBloc>(context)
        .add(CategoriesEvent.toggleCategory(category.id));
    updateLimit(category, null);
  }

  void addCategory(Category category, double? budget) {
    if (category.isSelected) return;
    BlocProvider.of<CategoriesBloc>(context)
        .add(CategoriesEvent.toggleCategory(category.id));
    updateLimit(category, budget);
  }

  void updateLimit(Category category, double? budget) {
    BlocProvider.of<CategoriesBloc>(context)
        .add(CategoriesEvent.updateCategoryBudget(category.id, budget));
  }

  void toggleCategory(Category category) {
    if (category.isSelected) {
      showLimitDialog(context, category, removeCategory, updateLimit);
    } else {
      final selectedCategories =
          BlocProvider.of<CategoriesBloc>(context).getSelectedCategories();
      if (selectedCategories.length < 10) {
        showAddCategoryDialog(context, category, addCategory);
      } else {
        AppToast.error(context, 'Không thể chọn quá 10 danh mục');
        HapticFeedback.heavyImpact();
      }
    }
  }

  void getCategories(BuildContext context) {
    try {
      BlocProvider.of<CategoriesBloc>(context)
          .add(CategoriesEvent.getCategories());
    } catch (e) {
      AppToast.error(context, 'Lỗi khi tải danh mục, vui lòng thử lại');
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final List<Category> systemExpenseCategories = state.maybeMap(
            success: (state) => BlocProvider.of<CategoriesBloc>(context)
                .getExpensesCategories(),
            orElse: () => []);

        final List<Category> systemIncomeCategories = state.maybeMap(
            success: (state) =>
                BlocProvider.of<CategoriesBloc>(context).getIncomeCategories(),
            orElse: () => []);
        return Scaffold(
          backgroundColor: const Color(0xFF121212),
          body: SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Text(
                      'Chọn danh mục',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Chọn các danh mục phù hợp với thu chi của bạn (tối đa 10 danh mục mỗi loại)',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppTab(tab1Name: 'Chi tiêu', tab2Name: 'Thu nhập', controller: _tabController),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Builder(
                      builder: (context) {
                        bool isExpenseTab = _tabController.index == 0;
                        int selectedCount =
                            BlocProvider.of<CategoriesBloc>(context)
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
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CategoriesGrid(
                            categories: systemExpenseCategories,
                            onCategorySelected: toggleCategory,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CategoriesGrid(
                            categories: systemIncomeCategories,
                            onCategorySelected: toggleCategory,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6200EE),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Bắt đầu sử dụng',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
