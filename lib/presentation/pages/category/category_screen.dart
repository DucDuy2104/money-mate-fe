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
  double? limit; // Thêm hạn mức chi tiêu

  ExpenseCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.limit,
  });
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
  List<int> _selectedCategoryIds = [];

  @override
  void initState() {
    super.initState();
    // Giả lập danh mục của người dùng đã chọn với hạn mức
    _selectedCategoryIds = [1, 2, 5]; // Thực phẩm, Đi lại, Giải trí
    
    // Thiết lập hạn mức cho các danh mục đã chọn
    _systemCategories[0].limit = 2000000; // Thực phẩm
    _systemCategories[1].limit = 1500000; // Đi lại
    _systemCategories[4].limit = 1000000; // Giải trí
  }

  Future<void> _showRemoveCategoryDialog(ExpenseCategory category) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: Text('Bỏ chọn danh mục', style: TextStyle(color: Colors.white)),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Bạn có chắc muốn bỏ chọn ',
                    style: TextStyle(color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(
                        text: category.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: category.color,
                        ),
                      ),
                      TextSpan(text: ' khỏi danh sách của bạn?'),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Hạn mức: ${category.limit?.toStringAsFixed(0) ?? 0} đồng',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Hủy', style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Bỏ chọn', style: TextStyle(color: Colors.red)),
              onPressed: () {
                setState(() {
                  _selectedCategoryIds.remove(category.id);
                  category.limit = null;
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Đã bỏ chọn "${category.name}" khỏi danh mục của bạn'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAddCategoryDialog(ExpenseCategory category) async {
    final TextEditingController _limitController = TextEditingController();
    
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey.shade900,
          title: Text('Thêm danh mục', style: TextStyle(color: Colors.white)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: category.color.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        category.icon,
                        color: category.color,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _limitController,
                  keyboardType: TextInputType.number,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    labelText: 'Hạn mức chi tiêu (đồng)',
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: category.color),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Ví dụ: 1000000',
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    suffixText: 'đồng',
                    suffixStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Hủy', style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Thêm', style: TextStyle(color: category.color)),
              onPressed: () {
                double? limit;
                if (_limitController.text.isNotEmpty) {
                  limit = double.tryParse(_limitController.text);
                }

                if (_selectedCategoryIds.length < 10) {
                  setState(() {
                    _selectedCategoryIds.add(category.id);
                    category.limit = limit;
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Đã thêm "${category.name}" vào danh mục của bạn'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                } else {
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Bạn chỉ có thể chọn tối đa 10 danh mục'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _handleCategoryTap(ExpenseCategory category) {
    if (_selectedCategoryIds.contains(category.id)) {
      _showRemoveCategoryDialog(category);
    } else {
      if (_selectedCategoryIds.length < 10) {
        _showAddCategoryDialog(category);
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
      ),
      drawer: const AppDrawer(currentRoute: RouteNames.category),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Icon(Icons.info_outline, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Danh mục đã chọn (${_selectedCategoryIds.length}/10). Nhấn vào danh mục để thêm hoặc bỏ chọn.',
                    style: TextStyle(color: Colors.grey[500]),
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
                childAspectRatio: 0.85, // Điều chỉnh tỷ lệ để hiển thị thêm hạn mức
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: _systemCategories.length,
              itemBuilder: (context, index) {
                final category = _systemCategories[index];
                final bool isSelected = _selectedCategoryIds.contains(category.id);
                return _buildCategoryCard(
                  category,
                  isSelected: isSelected,
                  onTap: () => _handleCategoryTap(category),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    ExpenseCategory category, {
    required VoidCallback onTap,
    required bool isSelected,
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (isSelected && category.limit != null) ...[
              const SizedBox(height: 4),
              Text(
                '${category.limit!.toStringAsFixed(0)} đ',
                style: TextStyle(
                  fontSize: 12,
                  color: category.color,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}