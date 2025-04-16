import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/core/service/langs/cubit/locale_cubit.dart';
import 'package:money_mate/core/service/langs/generated/l10n/l10n.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_item.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_service.dart';
import 'package:money_mate/presentation/drawer_navigation/widgets/header_skeleton.dart';
import 'package:money_mate/presentation/pages/category/bloc/categories_bloc.dart';
import 'package:money_mate/presentation/pages/home/bloc/home_bloc.dart';
import 'package:money_mate/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:money_mate/presentation/routes/bloc/routes_bloc.dart';
import 'package:money_mate/presentation/routes/route_name.dart';
import 'package:money_mate/shared/constants/avatar_component.dart';
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

    final colors = AppColors.colorsData(context);

    return Drawer(
      child: Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors.gradientColors,
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
                  padding: const EdgeInsets.only(top: AppDimens.paddingMd),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return _buildDrawerItem(context, items[index]);
                  }),
            ),

            // Logout Button
            _buildLogoutButton(context),

            // App Version
            const Divider(color: Colors.white70),
            Padding(
              padding: EdgeInsets.all(AppDimens.paddingMd),
              child: Text(
                'Money Mate Version 1.0.0',
                style: TextStyle(color: colors.subTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLogout(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(const HomeEvent.logout());
    BlocProvider.of<ProfileBloc>(context).add(const ProfileEvent.logout());
    BlocProvider.of<CategoriesBloc>(context)
        .add(const CategoriesEvent.logout());
    BlocProvider.of<RoutesBloc>(context).add(const RoutesEvent.logout());
    context.goNamed(RouteNames.loginName);
  }

  Widget _buildLogoutButton(BuildContext context) {
    final s = S.of(context);
    final colors = AppColors.colorsData(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.paddingMd, vertical: AppDimens.paddingSm),
      child: ElevatedButton.icon(
        icon: Icon(Icons.logout, color: colors.contrastColor),
        label: Text(
          s.logout,
          style: context.textTheme.bodyMedium,
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radiusSm),
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
                title: Text(s.logoutConfirm),
                content: Text(s.logoutQuestion),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(s.cancel),
                  ),
                  TextButton(
                    onPressed: () {
                      _onLogout(context);
                      context.pop();
                    },
                    child: Text(s.logout),
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
    final colors = AppColors.colorsData(context);
    final s = S.of(context);
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(
            loaded: (state) {
              final profile = state.data.profile;
              return Container(
                padding: const EdgeInsets.fromLTRB(AppDimens.paddingMd, 48,
                    AppDimens.paddingMd, AppDimens.paddingMd),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: colors.gradientColors.reversed.toList(),
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
                        AvatarComponent(
                            url: profile.avatar,
                            radius: AppDimens.avatarSize * 0.6),
                        AppDimens.spaceMd,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.name!,
                                style: context.textTheme.titleLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                              AppDimens.spaceXs,
                              Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    color: colors.subTextColor,
                                    size: AppDimens.iconSizeSmall,
                                  ),
                                  const SizedBox(width: AppDimens.paddingXs),
                                  Expanded(
                                    child: Text(
                                      profile.email,
                                      style: context.textTheme.bodyMedium
                                          ?.copyWith(
                                              color: colors.subTextColor),
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
                    AppDimens.spaceMd,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatItem(
                            '${profile.transactionsCount}', s.transactions),
                        Container(
                          height: 24,
                          width: 1,
                          color: colors.contrastColor,
                        ),
                        _buildStatItem(
                            '${profile.categoriesCount}', s.categories),
                        Container(
                          height: 24,
                          width: 1,
                          color: colors.contrastColor,
                        ),
                        _buildStatItem('${profile.reportsCount}', s.reports),
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
          Text(count, style: context.textTheme.titleLarge),
          const SizedBox(height: AppDimens.paddingXs / 2),
          Text(label,
              style: context.textTheme.bodySmall
                  ?.copyWith(color: AppColors.subText)),
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
    final colors = AppColors.colorsData(context);

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
            padding: const EdgeInsets.all(AppDimens.paddingMd),
            child: Row(
              children: [
                // Icon
                Icon(
                  item.icon,
                  color: (isSelected || hasSelectedChild)
                      ? null
                      : colors.subTextColor,
                  size: AppDimens.iconSize,
                ),
                const SizedBox(width: AppDimens.paddingMd),

                // Title
                Expanded(
                  child: BlocBuilder<LocaleCubit, LocaleState>(
                    builder: (context, state) {
                      return Text(
                        state.maybeMap(
                            loaded: (value) {
                              return value.locale.languageCode == 'vi'
                                  ? item.title
                                  : item.titleEn;
                            },
                            orElse: () => item.titleEn),
                        style: TextStyle(
                          color: isSelected ? null : colors.subTextColor,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      );
                    },
                  ),
                ),

                // Expand/Collapse icon for items with children
                if (hasChildren)
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.white70,
                    size: AppDimens.iconSize,
                  ),
              ],
            ),
          ),
        ),

        // Children items
        if (hasChildren && isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: AppDimens.paddingMd),
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
                        horizontal: AppDimens.paddingMd,
                        vertical: AppDimens.paddingSm),
                    decoration: BoxDecoration(
                      color:
                          isChildSelected ? Colors.white24 : Colors.transparent,
                      borderRadius:
                          BorderRadius.circular(AppDimens.radiusSm / 2),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          child.icon,
                          color:
                              isChildSelected ? Colors.white : Colors.white70,
                          size: AppDimens.iconSizeSmall + 4,
                        ),
                        const SizedBox(width: AppDimens.paddingSm + 4),
                        Expanded(
                          child: BlocBuilder<LocaleCubit, LocaleState>(
                            builder: (context, state) {
                              return Text(
                                state.maybeMap(
                                    loaded: (value) {
                                      return value.locale.languageCode == 'vi'
                                          ? child.title
                                          : child.titleEn;
                                    },
                                    orElse: () => child.title),
                                style: TextStyle(
                                  fontWeight: isChildSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: isChildSelected
                                      ? Colors.white
                                      : Colors.white70,
                                ),
                              );
                            },
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
