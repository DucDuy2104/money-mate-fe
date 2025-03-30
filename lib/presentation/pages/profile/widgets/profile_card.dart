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
              final profile = state.profile;
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: isDarkMode
                        ? [const Color(0xFF2B2D3E), const Color(0xFF1A1C2A)]
                        : [const Color(0xFFFFFFFF), const Color(0xFFF8F9FE)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: isDarkMode
                          ? Colors.black.withOpacity(0.3)
                          : Colors.grey.withOpacity(0.15),
                      blurRadius: 12,
                      spreadRadius: 1,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Avatar with gradient border
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF4776E6),
                            Color(0xFF8E54E9),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF8E54E9).withOpacity(0.2),
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor:
                            isDarkMode ? const Color(0xFF1A1C2A) : Colors.white,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              profile.avatarUrl ?? AppConstants.tempImage),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),

                    // User information
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            profile.name!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:
                                  isDarkMode ? Colors.white : Color(0xFF303952),
                              letterSpacing: 0.3,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                size: 14,
                                color: isDarkMode
                                    ? Colors.grey[400]
                                    : Colors.grey[600],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                profile.email,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDarkMode
                                      ? Colors.grey[400]
                                      : Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Vertical divider
                    Container(
                      height: 50,
                      width: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: isDarkMode
                              ? [
                                  const Color(0xFF2E7D32),
                                  const Color(0xFF1B5E20)
                                ]
                              : [
                                  const Color(0xFFE8F5E9),
                                  const Color(0xFFC8E6C9)
                                ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: isDarkMode
                                ? Colors.black.withOpacity(0.2)
                                : Colors.green.withOpacity(0.1),
                            blurRadius: 6,
                            spreadRadius: 0,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: isDarkMode
                                  ? Colors.green[800]!.withOpacity(0.3)
                                  : Colors.white.withOpacity(0.6),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.account_balance_wallet,
                              color: isDarkMode
                                  ? Colors.greenAccent
                                  : Colors.green[700],
                              size: 16,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            "Số dư",
                            style: TextStyle(
                              fontSize: 10,
                              color: isDarkMode
                                  ? Colors.green[100]
                                  : Colors.green[800],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            _formatMoney(profile.budget),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:
                                  isDarkMode ? Colors.white : Colors.green[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            orElse: () => const ProfileSkeleton());
      },
    );
  }

  // Format money with suffix and add currency symbol
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
