import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_item.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_service.dart';
import 'package:money_mate/presentation/drawer_navigation/widgets/header_skeleton.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/shared/constants/constants.dart';

class AppDrawer extends StatefulWidget {
  final String currentRoute;

  const AppDrawer({
    super.key,
    required this.currentRoute,
  });

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final Set<String> _expandedItems = {};

  @override
  Widget build(BuildContext context) {
    final items = DrawerService.getDrawerItems();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Drawer(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDarkMode
                ? [
                    const Color(0xFF1E1E1E),
                    const Color(0xFF343A40),
                    const Color(0xFF495057)
                  ]
                : [
                    const Color(0xFF66B2FF),
                    const Color(0xFF99CCFF),
                    const Color(0xFFCCE5FF)
                  ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            // Modern Drawer Header
            _buildModernHeader(context, isDarkMode),

            // Drawer Items
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: AppDimens.padding),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildDrawerItem(context, items[index]);
                }
              ),
            ),

            // Logout Button
            _buildLogoutButton(context),

            // App Version
            const Divider(color: Colors.white70),
            const Padding(
              padding: EdgeInsets.all(AppDimens.padding),
              child: Text(
                'Money Mate Version 1.0.0',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding, vertical: AppDimens.paddingSmall),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.logout, color: Colors.white),
        label: Text(
          'Đăng xuất',
          style: context.textTheme.bodyMedium,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 3,
        ),
        onPressed: () {
          // Close the drawer
          Navigator.pop(context);

          // Show confirmation dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Xác nhận đăng xuất'),
                content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Hủy'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text('Đăng xuất'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildModernHeader(BuildContext context, bool isDarkMode) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(
            loaded: (state) {
              final profile = state.data.profile;
              return Container(
                padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: isDarkMode
                        ? [const Color(0xFF232526), const Color(0xFF414345)]
                        : [const Color(0xFF2193b0), const Color(0xFF6dd5ed)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(
                                profile.avatarUrl ?? AppConstants.tempImage),
                            backgroundColor: Colors.grey[200],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.name!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.email_outlined,
                                    color: Colors.white70,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      profile.email,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 14,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    AppDimens.space,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatItem(
                            '${profile.transactionsCount}', 'Giao dịch'),
                        Container(
                          height: 24,
                          width: 1,
                          color: Colors.white24,
                        ),
                        _buildStatItem(
                            '${profile.categoriesCount}', 'Danh mục'),
                        Container(
                          height: 24,
                          width: 1,
                          color: Colors.white24,
                        ),
                        _buildStatItem('${profile.reportsCount}', 'Báo cáo'),
                      ],
                    ),
                  ],
                ),
              );
            },
            orElse: () => const HeaderSkeleton());
      },
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            count,
            style: context.textTheme.titleLarge
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: context.textTheme.bodySmall?.copyWith(color: AppColors.subText)
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, DrawerItem item) {
    final isSelected = widget.currentRoute == item.route ||
        widget.currentRoute.startsWith('${item.route}/');
    final hasChildren = item.children.isNotEmpty;
    final isExpanded = _expandedItems.contains(item.route);
    final hasSelectedChild = hasChildren &&
        item.children.any((child) => widget.currentRoute == child.route);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            if (hasChildren) {
              setState(() {
                isExpanded
                    ? _expandedItems.remove(item.route)
                    : _expandedItems.add(item.route);
              });
              if (!isSelected) context.go(item.route);
            } else {
              Navigator.pop(context);
              if (!isSelected) context.go(item.route);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.padding),
            child: Row(
              children: [
                // Icon
                Icon(
                  item.icon,
                  color: (isSelected || hasSelectedChild)
                      ? Colors.white
                      : Colors.white70,
                  size: 24,
                ),
                const SizedBox(width: 16),
            
                // Title
                Expanded(
                  child: Text(
                    item.title,
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
            
                // Expand/Collapse icon for items with children
                if (hasChildren)
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white70,
                    size: 24,
                  ),
              ],
            ),
          ),
        ),

        // Children items
        if (hasChildren && isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: item.children.map((child) {
                final isChildSelected = widget.currentRoute == child.route;

                return InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    if (!isChildSelected) context.go(child.route);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color:
                          isChildSelected ? Colors.white24 : Colors.transparent,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          child.icon,
                          color:
                              isChildSelected ? Colors.white : Colors.white70,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            child.title,
                            style: TextStyle(
                              fontWeight: isChildSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isChildSelected
                                  ? Colors.white
                                  : Colors.white70,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
