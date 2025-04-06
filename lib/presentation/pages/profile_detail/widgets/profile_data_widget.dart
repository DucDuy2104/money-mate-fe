import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/presentation/pages/profile_detail/funcs/show_update_name_dialog.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/constants.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';

class ProfileDataWidget extends StatelessWidget {
  final bool isLoading;
  final User user;
  const ProfileDataWidget(this.user, this.isLoading, {super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingScaffold(
      isLoading: isLoading,
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        appBar: AppBar(
          title: const Text('Thông tin hồ sơ'),
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
                  left: AppDimens.padding,
                  right: AppDimens.paddingMedium,
                  top: AppDimens.paddingMedium,
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
                    AppDimens.space,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.name!,
                          style: context.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AppDimens.spaceMedium,
                        GestureDetector(
                          onTap: () =>
                              showNameUpdateDialog(context, user.name!),
                          child: Container(
                            padding: const EdgeInsets.all(
                                AppDimens.paddingSmall / 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: AppDimens.iconSizeSmall,
                              color: Color(0xFF66B2FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: AppDimens.iconSizeSmall,
                          color: Color(0xFF66B2FF),
                        ),
                        AppDimens.spaceSmall,
                        Text(
                          user.email,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                    if (user.phoneNumber != null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.phone_outlined,
                            size: AppDimens.iconSizeSmall,
                            color: Color(0xFF66B2FF),
                          ),
                          AppDimens.spaceSmall,
                          Text(
                            user.phoneNumber!,
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[400],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppDimens.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppDimens.space,
                    _buildInfoCard(
                      context: context,
                      icon: Icons.badge_outlined,
                      title: 'Vai trò',
                      value: user.role,
                    ),
                    _buildInfoCard(
                      context: context,
                      icon: Icons.account_balance_wallet_outlined,
                      title: 'Ngân sách',
                      value: CurrencyHelper.formatCurrency(user.budget),
                      highlightValue: true,
                    ),
                    _buildInfoCard(
                      context: context,
                      icon: Icons.check_circle_outline,
                      title: 'Trạng thái tài khoản',
                      value:
                          user.isActive ? 'Đang hoạt động' : 'Không hoạt động',
                      valueColor: user.isActive
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFFFF5252),
                    ),
                    _buildInfoCard(
                      context: context,
                      icon: Icons.calendar_today_outlined,
                      title: 'Ngày tạo',
                      value: DateFormat.yMMMd().format(user.createdAt),
                    ),
                    _buildInfoCard(
                      context: context,
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
  required BuildContext context,
  required IconData icon,
  required String title,
  required String value,
  bool highlightValue = false,
  Color? valueColor,
  bool isLast = false,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: isLast ? 0 : AppDimens.paddingMedium),
    decoration: BoxDecoration(
      color: const Color(0xFF1E1E1E),
      borderRadius: BorderRadius.circular(AppDimens.borderRadius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.padding, vertical: AppDimens.paddingSmall),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.borderRadiusSmall),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(AppDimens.borderRadiusSmall),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF66B2FF),
              size: AppDimens.iconSize,
            ),
          ),
          AppDimens.space,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[400],
                  ),
                ),
                AppDimens.spaceSmall,
                Text(
                  value,
                  style: context.textTheme.bodyLarge?.copyWith(
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
