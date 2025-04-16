import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/domain/entities/user.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/pages/profile_detail/funcs/show_update_name_dialog.dart';
import 'package:money_mate/shared/components/loading_scafford.dart';
import 'package:money_mate/shared/constants/avatar_component.dart';
import 'package:money_mate/shared/constants/constants.dart';
import 'package:money_mate/shared/extensions/xfile_ext.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';
import 'package:money_mate/shared/helper/gallery_helper.dart';

class ProfileDataWidget extends StatelessWidget {
  final bool isLoading;
  final User user;
  const ProfileDataWidget(this.user, this.isLoading, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.colorsData(context);
    final s = S.of(context);
    return LoadingScaffold(
      isLoading: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(s.record),
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
                    AvatarComponent(
                        url: user.avatar,
                        onTap: () {
                          _updateAvatar(context);
                        }),
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
                              color: AppColors.primaryColor,
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
                          color: AppColors.primaryColor,
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
                              color: AppColors.primaryColor,
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
                      title: s.role,
                      value: user.role == 'admin' ? s.admin : s.user,
                    ),
                    _buildInfoCard(
                      context: context,
                      icon: Icons.account_balance_wallet_outlined,
                      title: s.budget,
                      value: CurrencyHelper.formatCurrency(user.budget),
                      highlightValue: true,
                    ),
                    _buildInfoCard(
                      context: context,
                      icon: Icons.check_circle_outline,
                      title: s.accountStatus,
                      value: user.isActive ? s.active : s.notActive,
                      valueColor: user.isActive
                          ? const Color(0xFF4CAF50)
                          : const Color(0xFFFF5252),
                    ),
                    _buildInfoCard(
                      context: context,
                      icon: Icons.calendar_today_outlined,
                      title: s.createdAt,
                      value: DateFormat.yMMMd().format(user.createdAt),
                    ),
                    _buildInfoCard(
                      context: context,
                      icon: Icons.update_outlined,
                      title: s.lastUpdatedAt,
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

void _updateAvatar(BuildContext context) async {
  final xFile = await GalleryHelper.pickImageFromGallery();
  if (xFile != null) {
    BlocProvider.of<ProfileBloc>(context)
        .add(ProfileEvent.uploadAvatar(xFile.toFile()));
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
              color: AppColors.primaryColor,
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
                        (highlightValue ? AppColors.primaryColor : null),
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
