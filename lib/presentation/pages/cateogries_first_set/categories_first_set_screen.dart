import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_mate/shared/constants/constants.dart';

class ExpenseCategory {
  final int id;
  final String name;
  final IconData icon;
  final Color color;
  double? limit;

  ExpenseCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.limit,
  });
}

class CategoriesFirstSetScreen extends StatefulWidget {
  const CategoriesFirstSetScreen({super.key});

  @override
  State<CategoriesFirstSetScreen> createState() => _CategoriesFirstSetScreenState();
}

class _CategoriesFirstSetScreenState extends State<CategoriesFirstSetScreen> with SingleTickerProviderStateMixin {
  final List<ExpenseCategory> _systemCategories = [
    ExpenseCategory(id: 1, name: "Thực phẩm", icon: Icons.fastfood, color: Colors.orange),
    ExpenseCategory(id: 2, name: "Đi lại", icon: Icons.directions_car, color: Colors.blue),
    ExpenseCategory(id: 3, name: "Mua sắm", icon: Icons.shopping_bag, color: Colors.pink),
    ExpenseCategory(id: 4, name: "Hóa đơn", icon: Icons.receipt, color: Colors.red),
    ExpenseCategory(id: 5, name: "Giải trí", icon: Icons.movie, color: Colors.purple),
    ExpenseCategory(id: 6, name: "Giáo dục", icon: Icons.school, color: Colors.brown),
    ExpenseCategory(id: 7, name: "Y tế", icon: Icons.medical_services, color: Colors.green),
    ExpenseCategory(id: 8, name: "Làm đẹp", icon: Icons.face, color: Colors.amber),
    ExpenseCategory(id: 9, name: "Thể thao", icon: Icons.sports_soccer, color: Colors.cyan),
    ExpenseCategory(id: 10, name: "Công nghệ", icon: Icons.computer, color: Colors.grey),
    ExpenseCategory(id: 11, name: "Quà tặng", icon: Icons.card_giftcard, color: Colors.deepPurple),
    ExpenseCategory(id: 12, name: "Nhà cửa", icon: Icons.home, color: Colors.indigo),
    ExpenseCategory(id: 13, name: "Thú cưng", icon: Icons.pets, color: Colors.brown),
    ExpenseCategory(id: 14, name: "Bảo hiểm", icon: Icons.health_and_safety, color: Colors.teal),
    ExpenseCategory(id: 15, name: "Đầu tư", icon: Icons.attach_money, color: Colors.green),
    ExpenseCategory(id: 16, name: "Thuế", icon: Icons.account_balance, color: Colors.blueGrey),
    ExpenseCategory(id: 17, name: "Cà phê", icon: Icons.coffee, color: Colors.brown),
    ExpenseCategory(id: 18, name: "Ăn ngoài", icon: Icons.restaurant, color: Colors.orange),
    ExpenseCategory(id: 19, name: "Trang phục", icon: Icons.checkroom, color: Colors.deepOrange),
    ExpenseCategory(id: 20, name: "Sách báo", icon: Icons.book, color: Colors.lightBlue),
  ];

  List<int> _selectedCategoryIds = [];
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
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

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleCategory(ExpenseCategory category) {
    if (_selectedCategoryIds.contains(category.id)) {
      _showLimitDialog(category);
    } else {
      if (_selectedCategoryIds.length < 10) {
        _showAddCategoryDialog(category);
      } else {
        // Hiển thị thông báo nếu đã chọn quá 10 danh mục
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Bạn chỉ có thể chọn tối đa 10 danh mục'),
            backgroundColor: Colors.redAccent.withOpacity(0.9),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            duration: const Duration(seconds: 2),
          ),
        );
        HapticFeedback.heavyImpact();
      }
    }
  }

  void _showAddCategoryDialog(ExpenseCategory category) {
    final TextEditingController _limitController = TextEditingController();
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                          const SizedBox(width: 12),
                          Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Thiết lập hạn mức chi tiêu hàng tháng',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Thiết lập hạn mức giúp bạn kiểm soát chi tiêu tốt hơn',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _limitController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],
                      hintText: 'Ví dụ: 1,000,000',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: category.color,
                      ),
                      suffixText: 'đồng',
                      suffixStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: category.color, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      // Có thể thêm logic định dạng số tiền ở đây nếu cần
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.grey[400],
                          ),
                          child: const Text('Hủy'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            double? limit;
                            if (_limitController.text.isNotEmpty) {
                              // Loại bỏ dấu phẩy nếu có
                              String cleanedValue = _limitController.text.replaceAll(',', '');
                              limit = double.tryParse(cleanedValue);
                            }
                            
                            setState(() {
                              _selectedCategoryIds.add(category.id);
                              category.limit = limit;
                            });
                            
                            Navigator.pop(context);
                            HapticFeedback.lightImpact();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: category.color,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Thêm danh mục',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
  
  void _showLimitDialog(ExpenseCategory category) {
    final TextEditingController _limitController = TextEditingController();
    if (category.limit != null) {
      _limitController.text = category.limit!.toStringAsFixed(0);
    }
    
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                top: 20,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                          const SizedBox(width: 12),
                          Text(
                            category.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Cập nhật hạn mức chi tiêu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Điều chỉnh hạn mức hoặc bỏ chọn danh mục này',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _limitController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    autofocus: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],
                      hintText: 'Ví dụ: 1,000,000',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: category.color,
                      ),
                      suffixText: 'đồng',
                      suffixStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: category.color, width: 2),
                      ),
                    ),
                    onChanged: (value) {
                      // Có thể thêm logic định dạng số tiền ở đây nếu cần
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _selectedCategoryIds.remove(category.id);
                            category.limit = null;
                          });
                          Navigator.pop(context);
                          HapticFeedback.mediumImpact();
                          
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Đã bỏ chọn ${category.name}'),
                              backgroundColor: Colors.grey[800],
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.redAccent,
                          side: const BorderSide(color: Colors.redAccent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Bỏ chọn',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          onPressed: () {
                            double? limit;
                            if (_limitController.text.isNotEmpty) {
                              // Loại bỏ dấu phẩy nếu có
                              String cleanedValue = _limitController.text.replaceAll(',', '');
                              limit = double.tryParse(cleanedValue);
                            }
                            
                            setState(() {
                              category.limit = limit;
                            });
                            
                            Navigator.pop(context);
                            HapticFeedback.lightImpact();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: category.color,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          child: const Text(
                            'Cập nhật',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Future<void> _finishSetup() async {
    if (_selectedCategoryIds.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Vui lòng chọn ít nhất 1 danh mục'),
          backgroundColor: Colors.redAccent.withOpacity(0.9),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Giả lập quá trình lưu dữ liệu
    await Future.delayed(const Duration(seconds: 1));

    // Chuyển sang màn hình chính
    // Navigator.of(context).pushReplacementNamed('/home');
    
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Chọn danh mục chi tiêu',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Chọn các danh mục phù hợp với chi tiêu hàng ngày của bạn (tối đa 10 danh mục)',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.2),
                        Colors.purple.withOpacity(0.2),
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
                        child: const Icon(
                          Icons.lightbulb_outline,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Đã chọn ${_selectedCategoryIds.length}/10 danh mục. Nhấn vào danh mục để thêm hoặc cập nhật hạn mức.',
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: _systemCategories.length,
                    itemBuilder: (context, index) {
                      final category = _systemCategories[index];
                      final isSelected = _selectedCategoryIds.contains(category.id);
                      
                      return AnimatedScale(

                        scale: 1,
                        duration: const Duration(milliseconds: 200),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: isSelected 
                                ? LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      category.color.withOpacity(0.3),
                                      category.color.withOpacity(0.1),
                                    ],
                                  )
                                : null,
                            color: isSelected ? null : const Color(0xFF1E1E1E),
                            boxShadow: isSelected 
                                ? [
                                    BoxShadow(
                                      color: category.color.withOpacity(0.3),
                                      blurRadius: 8,
                                      spreadRadius: 1,
                                    )
                                  ] 
                                : null,
                            border: Border.all(
                              color: isSelected ? category.color : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: InkWell(
                            onTap: () => _toggleCategory(category),
                            borderRadius: BorderRadius.circular(16),
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
                                    size: 26,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  category.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    color: isSelected ? category.color : Colors.white,
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
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _finishSetup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6200EE),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              color: Colors.white,
                            ),
                          )
                        : const Text(
                            'Bắt đầu sử dụng',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}