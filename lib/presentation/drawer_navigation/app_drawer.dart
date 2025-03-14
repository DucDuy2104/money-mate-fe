import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_item.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_service.dart';
import 'package:money_mate/shared/constants/app_constants.dart';

class AppDrawer extends StatefulWidget {
  final String currentRoute;

  const AppDrawer({
    Key? key,
    required this.currentRoute,
  }) : super(key: key);

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
                ? [const Color(0xFF1E1E1E), const Color(0xFF343A40), const Color(0xFF495057)]
                : [const Color(0xFF007AFF), const Color(0xFF32CD32), const Color(0xFFFFD700)],
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
                padding: const EdgeInsets.only(top: 8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildDrawerItem(context, items[index]);
                },
              ),
            ),

            // Logout Button
            _buildLogoutButton(context),

            // App Version
            const Divider(color: Colors.white70),
            const Padding(
              padding: EdgeInsets.all(16.0),
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
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ElevatedButton.icon(
        icon: const Icon(Icons.logout, color: Colors.white),
        label: const Text(
          'Đăng xuất',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
                      Navigator.pop(context);
                      // TODO: Implement logout logic here
                      // For example:
                      // AuthService.logout();
                      // Then navigate to login page
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
                  backgroundImage: const NetworkImage(tempImage),
                  backgroundColor: Colors.grey[200],
                ),
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cao Vũ Đức Duy',
                      style: TextStyle(
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
                        const Expanded(
                          child: Text(
                            'cvducduy@gmail.com',
                            style: TextStyle(
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatItem('43', 'Transactions'),
              Container(
                height: 24,
                width: 1,
                color: Colors.white24,
              ),
              _buildStatItem('3', 'Categories'),
              Container(
                height: 24,
                width: 1,
                color: Colors.white24,
              ),
              _buildStatItem('15', 'Reports'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Expanded(
      child: Column(
        children: [
          Text(
            count,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white70,
            ),
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
      children: [
        ListTile(
          leading: Icon(
            item.icon,
            color: (isSelected || hasSelectedChild) 
                ? Colors.white 
                : Colors.white70,
          ),
          title: Text(
            item.title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          selected: isSelected,
          trailing: hasChildren 
              ? Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.white70,
                )
              : null,
          onTap: () {
            if (hasChildren) {
              setState(() {
                isExpanded ? _expandedItems.remove(item.route) : _expandedItems.add(item.route);
              });
              if (!isSelected) context.go(item.route);
            } else {
              Navigator.pop(context);
              if (!isSelected) context.go(item.route);
            }
          },
        ),

        if (hasChildren && isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: item.children.map((child) {
                final isChildSelected = widget.currentRoute == child.route;

                return ListTile(
                  leading: Icon(
                    child.icon,
                    color: isChildSelected ? Colors.white : Colors.white70,
                    size: 20,
                  ),
                  title: Text(
                    child.title,
                    style: TextStyle(
                      fontWeight: isChildSelected ? FontWeight.bold : FontWeight.normal,
                      color: isChildSelected ? Colors.white : Colors.white70,
                    ),
                  ),
                  selected: isChildSelected,
                  selectedTileColor: isChildSelected ? Colors.white24 : null,
                  onTap: () {
                    Navigator.pop(context);
                    if (!isChildSelected) context.go(child.route);
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}