import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/pages/profile/widgets/profile_skeleton.dart';
import 'package:money_mate/shared/constants/constants.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final colors = AppColors.colorsData(context);
    final s = S.of(context);

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            final profile = state.data.profile;
            return Container(
              padding: const EdgeInsets.all(AppDimens.paddingMd),
              decoration: BoxDecoration(
                color: colors.seccondColor,
                borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode
                        ? Colors.black.withOpacity(0.4)
                        : Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryColor.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: AppDimens.avatarSize / 1.7,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: (AppDimens.avatarSize / 1.7) - 2,
                        backgroundImage: NetworkImage(
                            profile.avatarUrl ?? AppConstants.tempImage),
                      ),
                    ),
                  ),
                  AppDimens.spaceMd,
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            profile.name!,
                            style: context.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        AppDimens.divider,
                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: AppDimens.iconSizeSmall,
                              color: colors.subTextColor,
                            ),
                            AppDimens.spaceXs,
                            Flexible(
                              child: Text(
                                profile.email,
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: colors.subTextColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 44,
                    width: 1.5,
                    margin: const EdgeInsets.symmetric(
                        horizontal: AppDimens.paddingSm),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.05),
                          Colors.grey.withOpacity(0.3),
                          Colors.grey.withOpacity(0.05),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: AppDimens.paddingSm,
                        horizontal: AppDimens.paddingSm + 2),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: isDarkMode
                            ? [const Color(0xFF2E7D32), const Color(0xFF1B5E20)]
                            : [
                                const Color(0xFFE3F2FD),
                                const Color(0xFFBBDEFB)
                              ],
                      ),
                      borderRadius: BorderRadius.circular(AppDimens.radiusMd),
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.black.withOpacity(0.25)
                              : Colors.blue.withOpacity(0.15),
                          blurRadius: 6,
                          spreadRadius: 0,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.account_balance_wallet,
                          color: isDarkMode
                              ? Colors.greenAccent
                              : Colors.blue[700],
                          size: AppDimens.iconSizeSmall,
                        ),
                        AppDimens.divider,
                        Text(
                          s.balance,
                          style: context.textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          CurrencyHelper.formatCurrencyCompact(profile.budget),
                          style: context.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? Colors.white : Colors.blue[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          orElse: () => const ProfileSkeleton(),
        );
      },
    );
  }
}
