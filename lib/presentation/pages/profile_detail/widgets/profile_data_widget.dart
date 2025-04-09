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
    final colors = AppColors.colorsData(context);
    return LoadingScaffold(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thông tin hồ sơ'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: AppDimens.paddingMd,
                  right: AppDimens.paddingMd,
                  top: AppDimens.paddingMd,
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
                        radius: 50,
                        backgroundColor: const Color(0xFF66B2FF),
                        child: CircleAvatar(
                          radius: 48,
                          backgroundImage: NetworkImage(
                            user.avatarUrl ?? AppConstants.tempImage,
                          ),
                        ),
                      ),
                    ),
                    AppDimens.spaceMd,
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
                        AppDimens.spaceMd,
                        GestureDetector(
                          onTap: () =>
                              showNameUpdateDialog(context, user.name!),
                          child: Container(
                            padding: const EdgeInsets.all(AppDimens.paddingXs),
                            decoration: BoxDecoration(
                              color: colors.seccondColor,
                              borderRadius:
                                  BorderRadius.circular(AppDimens.radiusSm / 2),
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
                    AppDimens.spaceSm,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.email_outlined,
                          size: AppDimens.iconSizeSmall,
                          color: Color(0xFF66B2FF),
                        ),
                        AppDimens.spaceSm,
                        Text(
                          user.email,
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: colors.subTextColor,
                          ),
                        ),
                      ],
                    ),
                    if (user.phoneNumber != null)
                      Padding(
                        padding:
                            const EdgeInsets.only(top: AppDimens.paddingXs),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.phone_outlined,
                              size: AppDimens.iconSizeSmall,
                              color: Color(0xFF66B2FF),
                            ),
                            AppDimens.spaceSm,
                            Text(
                              user.phoneNumber!,
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppDimens.paddingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppDimens.spaceSm,
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
  final colors = AppColors.colorsData(context);
  return Container(
    margin: EdgeInsets.only(bottom: isLast ? 0 : AppDimens.paddingSm),
    decoration: BoxDecoration(
      color: colors.seccondColor,
      borderRadius: BorderRadius.circular(AppDimens.radiusMd),
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
          horizontal: AppDimens.paddingMd, vertical: AppDimens.paddingSm),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimens.paddingSm),
            decoration: BoxDecoration(
              color: colors.thirdColor,
              borderRadius: BorderRadius.circular(AppDimens.radiusSm),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF66B2FF),
              size: AppDimens.iconSize,
            ),
          ),
          AppDimens.spaceMd,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: colors.subTextColor,
                  ),
                ),
                AppDimens.spaceXs,
                Text(
                  value,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight:
                        highlightValue ? FontWeight.bold : FontWeight.normal,
                    color: valueColor ??
                        (highlightValue
                            ? const Color(0xFF66B2FF)
                            : null),
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
