import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/presentation/drawer_navigation/app_drawer.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/constants/constants.dart';

// Lớp đại diện cho một danh mục chi tiêu
class ExpenseCategory {
  final int id;
  final String name;
  final IconData icon;
  final Color color;

  ExpenseCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  // Danh sách các danh mục có sẵn trong hệ thống
  final List<ExpenseCategory> _systemCategories = [
    ExpenseCategory(
        id: 1, name: "Thực phẩm", icon: Icons.fastfood, color: Colors.orange),
    ExpenseCategory(
        id: 2, name: "Đi lại", icon: Icons.directions_car, color: Colors.blue),
    ExpenseCategory(
        id: 3, name: "Mua sắm", icon: Icons.shopping_bag, color: Colors.pink),
    ExpenseCategory(
        id: 4, name: "Hóa đơn", icon: Icons.receipt, color: Colors.red),
    ExpenseCategory(
        id: 5, name: "Giải trí", icon: Icons.movie, color: Colors.purple),
    ExpenseCategory(
        id: 6, name: "Giáo dục", icon: Icons.school, color: Colors.brown),
    ExpenseCategory(
        id: 7, name: "Y tế", icon: Icons.medical_services, color: Colors.green),
    ExpenseCategory(
        id: 8, name: "Làm đẹp", icon: Icons.face, color: Colors.amber),
    ExpenseCategory(
        id: 9, name: "Thể thao", icon: Icons.sports_soccer, color: Colors.cyan),
    ExpenseCategory(
        id: 10, name: "Công nghệ", icon: Icons.computer, color: Colors.grey),
    ExpenseCategory(
        id: 11,
        name: "Quà tặng",
        icon: Icons.card_giftcard,
        color: Colors.deepPurple),
    ExpenseCategory(
        id: 12, name: "Nhà cửa", icon: Icons.home, color: Colors.indigo),
    ExpenseCategory(
        id: 13, name: "Thú cưng", icon: Icons.pets, color: Colors.brown),
    ExpenseCategory(
        id: 14,
        name: "Bảo hiểm",
        icon: Icons.health_and_safety,
        color: Colors.teal),
    ExpenseCategory(
        id: 15, name: "Đầu tư", icon: Icons.attach_money, color: Colors.green),
    ExpenseCategory(
        id: 16,
        name: "Thuế",
        icon: Icons.account_balance,
        color: Colors.blueGrey),
    ExpenseCategory(
        id: 17, name: "Cà phê", icon: Icons.coffee, color: Colors.brown),
    ExpenseCategory(
        id: 18, name: "Ăn ngoài", icon: Icons.restaurant, color: Colors.orange),
    ExpenseCategory(
        id: 19,
        name: "Trang phục",
        icon: Icons.checkroom,
        color: Colors.deepOrange),
    ExpenseCategory(
        id: 20, name: "Sách báo", icon: Icons.book, color: Colors.lightBlue),
    ExpenseCategory(
        id: 21, name: "Du lịch", icon: Icons.flight, color: Colors.lightGreen),
    ExpenseCategory(
        id: 22,
        name: "Tập gym",
        icon: Icons.fitness_center,
        color: Colors.deepPurple),
    ExpenseCategory(
        id: 23,
        name: "Điện thoại",
        icon: Icons.phone_android,
        color: Colors.black),
    ExpenseCategory(
        id: 24, name: "Internet", icon: Icons.wifi, color: Colors.blue),
    ExpenseCategory(
        id: 25,
        name: "Xăng dầu",
        icon: Icons.local_gas_station,
        color: Colors.red),
    ExpenseCategory(
        id: 26,
        name: "Bảo dưỡng xe",
        icon: Icons.car_repair,
        color: Colors.grey),
    ExpenseCategory(
        id: 27,
        name: "Tiền vay",
        icon: Icons.money_off,
        color: Colors.deepOrange),
    ExpenseCategory(
        id: 28, name: "Tiền lương", icon: Icons.paid, color: Colors.green),
    ExpenseCategory(
        id: 29, name: "Khác", icon: Icons.more_horiz, color: Colors.grey),
    ExpenseCategory(
        id: 30, name: "Tiền mặt", icon: Icons.wallet, color: Colors.amber),
  ];

  // Danh sách các danh mục của người dùng
  List<ExpenseCategory> _userCategories = [];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Giả lập danh mục của người dùng đã chọn
    _userCategories = [
      _systemCategories[0], // Thực phẩm
      _systemCategories[1], // Đi lại
      _systemCategories[4], // Giải trí
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addCategory(ExpenseCategory category) {
    if (_userCategories.length < 10) {
      if (!_userCategories.any((element) => element.id == category.id)) {
        setState(() {
          _userCategories.add(category);
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã thêm "${category.name}" vào danh mục của bạn'),
            duration: const Duration(seconds: 1),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Danh mục "${category.name}" đã tồn tại'),
            backgroundColor: Colors.orange,
            duration: const Duration(seconds: 1),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Bạn chỉ có thể chọn tối đa 10 danh mục'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _removeCategory(ExpenseCategory category) {
    setState(() {
      _userCategories.removeWhere((element) => element.id == category.id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Đã xóa "${category.name}" khỏi danh mục của bạn'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh mục chi tiêu'),
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
        bottom: TabBar(
          dividerHeight: 0,
          controller: _tabController,
          indicator: BoxDecoration(
            color: AppColors.darkCardColor, 
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: Colors.white,
          unselectedLabelColor:
              Colors.grey.shade500, 
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          tabs: const [
            Tab(text: 'Danh mục của tôi'),
            Tab(text: 'Tất cả danh mục'),
          ],
        ),
      ),
      drawer: const AppDrawer(currentRoute: RouteNames.category),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Danh mục của người dùng
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Danh mục của bạn (${_userCategories.length}/10). Nhấn vào danh mục để xóa.',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: _userCategories.isEmpty
                    ? const Center(
                        child: Text(
                          'Bạn chưa chọn danh mục nào.\nVui lòng chọn từ tab "Tất cả danh mục"',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.all(16),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.0,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: _userCategories.length,
                        itemBuilder: (context, index) {
                          final category = _userCategories[index];
                          return _buildCategoryCard(
                            category,
                            onTap: () => _removeCategory(category),
                            showDeleteIcon: true,
                          );
                        },
                      ),
              ),
            ],
          ),

          // Tab 2: Tất cả danh mục hệ thống
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.info_outline),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Nhấn vào danh mục để thêm vào danh sách của bạn.',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: _systemCategories.length,
                  itemBuilder: (context, index) {
                    final category = _systemCategories[index];
                    final bool isSelected = _userCategories
                        .any((element) => element.id == category.id);
                    return _buildCategoryCard(
                      category,
                      onTap: () => _addCategory(category),
                      isSelected: isSelected,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    ExpenseCategory category, {
    required VoidCallback onTap,
    bool isSelected = false,
    bool showDeleteIcon = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? category.color : Colors.transparent,
            width: isSelected ? 2 : 0,
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: category.color.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.icon,
                color: category.color,
                size: 28,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: Colors.white,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
