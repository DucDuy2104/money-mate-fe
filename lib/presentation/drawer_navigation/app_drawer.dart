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
            // Drawer Header
            const UserAccountsDrawerHeader(
              accountName: const Text('Cao Vũ Đức Duy'),
              accountEmail: const Text('cvducduy@gmail.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(tempImage),
              ),
              decoration: BoxDecoration(
                color: Colors.transparent, // Gradient đã bao phủ toàn bộ
              ),
            ),

            // Drawer Items
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildDrawerItem(context, items[index]);
                },
              ),
            ),

            // App Version
            const Divider(color: Colors.white70),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'App Version 1.0.0',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
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
