import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/presentation/drawer_navigation/app_drawer.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/constants/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // App Settings
  bool _notificationsEnabled = true;
  bool _biometricAuthEnabled = true;
  String _currency = 'VND';
  String _language = 'Tiếng Việt';
  bool _darkMode = true;
  double _budgetWarningThreshold = 0.8; // 80% of budget

  // Currency options
  final List<String> _currencyOptions = ['VND', 'USD', 'EUR', 'JPY', 'GBP'];
  
  // Language options
  final List<String> _languageOptions = ['Tiếng Việt', 'English', '日本語', '한국어', '中文'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
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
      drawer: const AppDrawer(currentRoute: RouteNames.settings),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // General Settings
            _buildSectionHeader('Chung'),
            _buildSettingItem(
              icon: Icons.language,
              title: 'Ngôn ngữ',
              subtitle: _language,
              onTap: () => _showLanguageDialog(),
            ),
            _buildSettingItem(
              icon: Icons.currency_exchange,
              title: 'Đơn vị tiền tệ',
              subtitle: _currency,
              onTap: () => _showCurrencyDialog(),
            ),
            _buildSwitchItem(
              icon: Icons.dark_mode,
              title: 'Chế độ tối',
              value: _darkMode,
              onChanged: (value) {
                setState(() {
                  _darkMode = value;
                });
                // Triển khai thay đổi theme ở đây
              },
            ),
            const Divider(height: 1),
        
            // Notifications
            _buildSectionHeader('Thông báo'),
            _buildSwitchItem(
              icon: Icons.notifications,
              title: 'Bật thông báo',
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            _buildSettingItem(
              icon: Icons.warning_amber,
              title: 'Cảnh báo ngân sách',
              subtitle: 'Khi chi tiêu đạt ${(_budgetWarningThreshold * 100).toInt()}% ngân sách',
              onTap: () => _showBudgetWarningDialog(),
              enabled: _notificationsEnabled,
            ),
            const Divider(height: 1),
        
            // Security
            _buildSectionHeader('Bảo mật'),
            _buildSwitchItem(
              icon: Icons.fingerprint,
              title: 'Xác thực sinh trắc học',
              subtitle: 'Sử dụng vân tay hoặc Face ID để đăng nhập',
              value: _biometricAuthEnabled,
              onChanged: (value) {
                setState(() {
                  _biometricAuthEnabled = value;
                });
              },
            ),
            _buildSettingItem(
              icon: Icons.lock,
              title: 'Đổi mật khẩu',
              onTap: () {
                // Triển khai chức năng đổi mật khẩu ở đây
              },
            ),
            const Divider(height: 1),
        
            // Data Management
            _buildSectionHeader('Dữ liệu'),
            _buildSettingItem(
              icon: Icons.backup,
              title: 'Sao lưu dữ liệu',
              subtitle: 'Lưu dữ liệu của bạn lên đám mây',
              onTap: () {
                // Triển khai chức năng sao lưu dữ liệu ở đây
              },
            ),
            _buildSettingItem(
              icon: Icons.restore,
              title: 'Khôi phục dữ liệu',
              onTap: () {
                // Triển khai chức năng khôi phục dữ liệu ở đây
              },
            ),
            _buildSettingItem(
              icon: Icons.delete_forever,
              title: 'Xóa tất cả dữ liệu',
              subtitle: 'Xóa toàn bộ giao dịch và cài đặt',
              onTap: () => _showDeleteAllDataDialog(),
              danger: true,
            ),
            const Divider(height: 1),
        
            // About & Support
            _buildSectionHeader('Thông tin'),
            _buildSettingItem(
              icon: Icons.info,
              title: 'Về Money Mate',
              subtitle: 'Phiên bản 1.0.0',
              onTap: () {
                // Hiển thị thông tin về ứng dụng
              },
            ),
            _buildSettingItem(
              icon: Icons.help,
              title: 'Trợ giúp & Hỗ trợ',
              onTap: () {
                // Mở trang trợ giúp
              },
            ),
            _buildSettingItem(
              icon: Icons.rate_review,
              title: 'Đánh giá ứng dụng',
              onTap: () {
                // Mở trang đánh giá trên app store
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 24.0, bottom: 8.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    bool enabled = true,
    bool danger = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: danger ? Colors.red : (enabled ? Colors.grey[300] : Colors.grey[700]),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: danger ? Colors.red : (enabled ? Colors.white : Colors.grey[700]),
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: TextStyle(
                color: enabled ? Colors.grey[400] : Colors.grey[800],
                fontSize: 13,
              ),
            )
          : null,
      enabled: enabled,
      onTap: enabled ? onTap : null,
    );
  }

  Widget _buildSwitchItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[300]),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: subtitle != null
          ? Text(subtitle, style: TextStyle(color: Colors.grey[400], fontSize: 13))
          : null,
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: AppColors.primaryColor,
      ),
    );
  }

  // Dialog để chọn đơn vị tiền tệ
  void _showCurrencyDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Đơn vị tiền tệ', style: TextStyle(color: Colors.white)),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _currencyOptions.length,
            itemBuilder: (context, index) {
              final currency = _currencyOptions[index];
              return ListTile(
                title: Text(currency, style: const TextStyle(color: Colors.white)),
                trailing: _currency == currency
                    ? Icon(Icons.check, color: AppColors.primaryColor)
                    : null,
                onTap: () {
                  setState(() {
                    _currency = currency;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  // Dialog để chọn ngôn ngữ
  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Ngôn ngữ', style: TextStyle(color: Colors.white)),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _languageOptions.length,
            itemBuilder: (context, index) {
              final language = _languageOptions[index];
              return ListTile(
                title: Text(language, style: const TextStyle(color: Colors.white)),
                trailing: _language == language
                    ? Icon(Icons.check, color: AppColors.primaryColor)
                    : null,
                onTap: () {
                  setState(() {
                    _language = language;
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  // Dialog để cài đặt ngưỡng cảnh báo ngân sách
  void _showBudgetWarningDialog() {
    double tempThreshold = _budgetWarningThreshold;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Cảnh báo ngân sách', style: TextStyle(color: Colors.white)),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Cảnh báo khi chi tiêu đạt ${(tempThreshold * 100).toInt()}% ngân sách',
                  style: TextStyle(color: Colors.grey[300]),
                ),
                const SizedBox(height: 16),
                Slider(
                  value: tempThreshold,
                  min: 0.5,
                  max: 1.0,
                  divisions: 10,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: Colors.grey[700],
                  label: '${(tempThreshold * 100).toInt()}%',
                  onChanged: (value) {
                    setState(() {
                      tempThreshold = value;
                    });
                  },
                ),
              ],
            );
          },
        ),
        actions: [
          TextButton(
            child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: Text('Lưu', style: TextStyle(color: AppColors.primaryColor)),
            onPressed: () {
              setState(() {
                _budgetWarningThreshold = tempThreshold;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  // Dialog xác nhận xóa tất cả dữ liệu
  void _showDeleteAllDataDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey.shade900,
        title: const Text('Xóa tất cả dữ liệu?', style: TextStyle(color: Colors.white)),
        content: const Text(
          'Hành động này sẽ xóa vĩnh viễn tất cả dữ liệu và cài đặt của bạn. Bạn không thể hoàn tác hành động này.',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('Xóa tất cả', style: TextStyle(color: Colors.red)),
            onPressed: () {
              // Triển khai chức năng xóa tất cả dữ liệu ở đây
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Đã xóa tất cả dữ liệu'),
                  backgroundColor: Colors.red,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}