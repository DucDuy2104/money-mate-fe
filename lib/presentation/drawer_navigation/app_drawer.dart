import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_item.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_service.dart';

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
  Set<String> _expandedItems = {};

  @override
  Widget build(BuildContext context) {
    final items = DrawerService.getDrawerItems();
    
    return Drawer(
      child: Column(
        children: [
          // Drawer header with app logo and name
          UserAccountsDrawerHeader(
            accountName: const Text('User Name'),
            accountEmail: const Text('user@example.com'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          ),
          
          // Display all drawer items
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _buildDrawerItem(context, items[index]);
              },
            ),
          ),
          
          // App version at the bottom
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'App Version 1.0.0',
              style: TextStyle(color: Colors.grey),
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
    
    // Determine if any child is selected
    final hasSelectedChild = hasChildren && 
        item.children.any((child) => widget.currentRoute == child.route);

    return Column(
      children: [
        ListTile(
          leading: Icon(
            item.icon,
            color: (isSelected || hasSelectedChild) 
                ? Theme.of(context).primaryColor 
                : Colors.grey[600],
          ),
          title: Text(
            item.title,
            style: TextStyle(
              fontWeight: (isSelected || hasSelectedChild) ? FontWeight.bold : FontWeight.normal,
              color: (isSelected || hasSelectedChild) ? Theme.of(context).primaryColor : Colors.black87,
            ),
          ),
          selected: isSelected,
          trailing: hasChildren 
              ? Icon(
                  isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.grey[600],
                )
              : null,
          onTap: () {
            if (hasChildren) {
              // Toggle expansion
              setState(() {
                if (isExpanded) {
                  _expandedItems.remove(item.route);
                } else {
                  _expandedItems.add(item.route);
                }
              });
              
              // If not already on parent route, navigate to it
              if (!isSelected) {
                context.go(item.route);
              }
            } else {
              // Close the drawer first
              Navigator.pop(context);
              
              // Navigate using GoRouter
              if (!isSelected) {
                context.go(item.route);
              }
            }
          },
        ),
        
        // Show children if expanded
        if (hasChildren && isExpanded)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: item.children.map((child) {
                final isChildSelected = widget.currentRoute == child.route;
                
                return ListTile(
                  leading: Icon(
                    child.icon,
                    color: isChildSelected 
                        ? Theme.of(context).primaryColor 
                        : Colors.grey[600],
                    size: 20,
                  ),
                  title: Text(
                    child.title,
                    style: TextStyle(
                      fontWeight: isChildSelected ? FontWeight.bold : FontWeight.normal,
                      color: isChildSelected ? Theme.of(context).primaryColor : Colors.black87,
                    ),
                  ),
                  selected: isChildSelected,
                  selectedTileColor: isChildSelected ? Colors.grey[200] : null,
                  onTap: () {
                    // Close the drawer
                    Navigator.pop(context);
                    
                    // Navigate using GoRouter
                    if (!isChildSelected) {
                      context.go(child.route);
                    }
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}
