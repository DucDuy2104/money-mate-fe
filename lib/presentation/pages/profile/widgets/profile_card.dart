import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/pages/profile/widgets/profile_skeleton.dart';
import 'package:money_mate/shared/constants/app_constants.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10), // Giảm padding
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDarkMode
                      ? [const Color(0xFF2B2D3E), const Color(0xFF1A1C2A)]
                      : [const Color(0xFFFFFFFF), const Color(0xFFF8F9FE)],
                ),
                borderRadius: BorderRadius.circular(16), // Giảm bo góc
                boxShadow: [
                  BoxShadow(
                    color: isDarkMode
                        ? Colors.black.withOpacity(0.3)
                        : Colors.grey.withOpacity(0.15),
                    blurRadius: 8, // Giảm blur
                    spreadRadius: 1,
                    offset: const Offset(0, 4), // Giảm offset
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Avatar
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF4776E6), Color(0xFF8E54E9)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8E54E9).withOpacity(0.2),
                          blurRadius: 6, // Giảm blur
                          spreadRadius: 1,
                          offset: const Offset(0, 2), // Giảm offset
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 28, // Giảm kích thước
                      backgroundColor: isDarkMode ? const Color(0xFF1A1C2A) : Colors.white,
                      child: CircleAvatar(
                        radius: 26, // Giảm kích thước
                        backgroundImage: NetworkImage(profile.avatarUrl ?? AppConstants.tempImage),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12), // Giảm khoảng cách

                  // User information
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 150), // Giới hạn chiều rộng
                          child: Text(
                            profile.name!,
                            style: TextStyle(
                              fontSize: 16, // Giảm font size
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? Colors.white : const Color(0xFF303952),
                              letterSpacing: 0.2,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis, // Xử lý text dài
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              size: 12, // Giảm size
                              color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                profile.email,
                                style: TextStyle(
                                  fontSize: 11, // Giảm font size
                                  color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis, // Xử lý text dài
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Vertical divider
                  Container(
                    height: 40, // Giảm chiều cao
                    width: 1,
                    margin: const EdgeInsets.symmetric(horizontal: 8), // Giảm margin
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.05),
                          Colors.grey.withOpacity(0.2),
                          Colors.grey.withOpacity(0.05),
                        ],
                      ),
                    ),
                  ),

                  // Balance column
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8), // Giảm padding
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: isDarkMode
                            ? [const Color(0xFF2E7D32), const Color(0xFF1B5E20)]
                            : [const Color(0xFFE8F5E9), const Color(0xFFC8E6C9)],
                      ),
                      borderRadius: BorderRadius.circular(10), // Giảm bo góc
                      boxShadow: [
                        BoxShadow(
                          color: isDarkMode
                              ? Colors.black.withOpacity(0.2)
                              : Colors.green.withOpacity(0.1),
                          blurRadius: 4, // Giảm blur
                          spreadRadius: 0,
                          offset: const Offset(0, 2), // Giảm offset
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(4), // Giảm padding
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? Colors.green[800]!.withOpacity(0.3)
                                : Colors.white.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.account_balance_wallet,
                            color: isDarkMode ? Colors.greenAccent : Colors.green[700],
                            size: 14, // Giảm size
                          ),
                        ),
                        const SizedBox(height: 4), // Giảm khoảng cách
                        Text(
                          "Số dư",
                          style: TextStyle(
                            fontSize: 9, // Giảm font size
                            color: isDarkMode ? Colors.green[100] : Colors.green[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2), // Giảm khoảng cách
                        Text(
                          _formatMoney(profile.budget),
                          style: TextStyle(
                            fontSize: 12, // Giảm font size
                            fontWeight: FontWeight.bold,
                            color: isDarkMode ? Colors.white : Colors.green[900],
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

  String _formatMoney(double amount) {
    if (amount >= 1000000000) {
      return '${(amount / 1000000000).toStringAsFixed(amount % 1000000000 == 0 ? 0 : 1)}B ₫';
    } else if (amount >= 1000000) {
      return '${(amount / 1000000).toStringAsFixed(amount % 1000000 == 0 ? 0 : 1)}M ₫';
    } else if (amount >= 1000) {
      return '${(amount / 1000).toStringAsFixed(amount % 1000 == 0 ? 0 : 1)}K ₫';
    } else {
      return '${amount.toStringAsFixed(amount % 1 == 0 ? 0 : 1)} ₫';
    }
  }
}