import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/pages/profile/widgets/profile_skeleton.dart';
import 'package:money_mate/shared/constants/constants.dart';
import 'package:money_mate/shared/helper/currency_heler.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(
          loaded: (state) {
            final profile = state.data.profile;
            return Container(
              padding: const EdgeInsets.all(AppDimens.paddingMedium),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDarkMode
                      ? [const Color(0xFF232538), const Color(0xFF171926)]
                      : [const Color(0xFFFFFFFF), const Color(0xFFF5F7FD)],
                ),
                borderRadius: BorderRadius.circular(AppDimens.borderRadiusMedium),
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
                      radius: AppDimens.borderRadiusLarge * 1.2,
                      backgroundColor: isDarkMode ? const Color(0xFF1A1C2A) : Colors.white,
                      child: CircleAvatar(
                        radius: AppDimens.borderRadiusLarge * 1.2 - 2,
                        backgroundImage: NetworkImage(profile.avatarUrl ?? AppConstants.tempImage),
                      ),
                    ),
                  ),
                  AppDimens.spaceMedium,

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            profile.name!,
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: isDarkMode ? Colors.white : Colors.black87,
                            ),
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
                              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                            ),
                            AppDimens.divider,
                            Flexible(
                              child: Text(
                                profile.email,
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
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
                    margin: const EdgeInsets.symmetric(horizontal: 10),
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
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: isDarkMode
                            ? [const Color(0xFF2E7D32), const Color(0xFF1B5E20)]
                            : [const Color(0xFFE3F2FD), const Color(0xFFBBDEFB)],
                      ),
                      borderRadius: BorderRadius.circular(AppDimens.borderRadius * 1.2),
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
                        Container(
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? Colors.green[800]!.withOpacity(0.4)
                                : Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: isDarkMode ? Colors.greenAccent : Colors.blue[700],
                            size: AppDimens.iconSizeSmall,
                          ),
                        ),
                        AppDimens.divider,
                        Text(
                          "Số dư",
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