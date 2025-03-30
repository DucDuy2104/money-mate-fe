import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/presentation/pages/profile_detail/funcs/show_update_name_dialog.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/app_constants.dart';

class ProfileDataWidget extends StatelessWidget {
  final bool isLoading;
  final User user;
  const ProfileDataWidget(this.user, this.isLoading, {super.key});

  @override
  Widget build(BuildContext context) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    String formattedBudget = currencyFormatter.format(user.budget);
    return LoadingScaffold(
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          title: const Text(
            'Thông tin hồ sơ',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: const Color(0xFF1E1E1E),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF1E1E1E), Color(0xFF121212)],
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 40,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF66B2FF).withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 55,
                        backgroundColor: const Color(0xFF66B2FF),
                        child: CircleAvatar(
                          radius: 52,
                          backgroundImage: NetworkImage(
                            user.avatarUrl ?? AppConstants.tempImage,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.name!,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () =>
                              showNameUpdateDialog(context, user.name!),
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 16,
                              color: Color(0xFF66B2FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Email với biểu tượng
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: 16,
                          color: Color(0xFF66B2FF),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          user.email,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    if (user.phoneNumber != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.phone_outlined,
                              size: 16,
                              color: Color(0xFF66B2FF),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              user.phoneNumber!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0, bottom: 12.0),
                      child: Text(
                        'Thông tin Tài khoản',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                    _buildInfoCard(
                      icon: Icons.badge_outlined,
                      title: 'Vai trò',
                      value: user.role,
                    ),
                    _buildInfoCard(
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Ngân sách',
                      value: formattedBudget,
                      highlightValue: true,
                    ),
                    _buildInfoCard(
                      icon: Icons.check_circle_outline,
                      title: 'Trạng thái tài khoản',
                      value:
                          user.isActive ? 'Đang hoạt động' : 'Không hoạt động',
                      valueColor: user.isActive
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFFFF5252),
                    ),
                    _buildInfoCard(
                      icon: Icons.calendar_today_outlined,
                      title: 'Ngày tạo',
                      value: DateFormat.yMMMd().format(user.createdAt),
                    ),
                    _buildInfoCard(
                      icon: Icons.update_outlined,
                      title: 'Ngày cập nhật',
                      value: DateFormat.yMMMd().format(user.updatedAt),
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInfoCard({
  required IconData icon,
  required String title,
  required String value,
  bool highlightValue = false,
  Color? valueColor,
  bool isLast = false,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: isLast ? 0 : 12),
    decoration: BoxDecoration(
      color: const Color(0xFF1E1E1E),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF66B2FF),
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        highlightValue ? FontWeight.bold : FontWeight.normal,
                    color: valueColor ??
                        (highlightValue
                            ? const Color(0xFF66B2FF)
                            : Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
