import 'package:flutter/material.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_item.dart';

class DrawerService {
  static List<DrawerItem> getDrawerItems() {
    return [
      DrawerItem(title: 'Home', icon: Icons.home, route: '/'),
      DrawerItem(
        title: 'Dashboard', 
        icon: Icons.dashboard, 
        route: '/dashboard',
        children: [
          DrawerItem(title: 'Analytics', icon: Icons.analytics, route: '/dashboard/analytics'),
          DrawerItem(title: 'Reports', icon: Icons.summarize, route: '/dashboard/reports'),
        ],
      ),
      DrawerItem(title: 'Profile', icon: Icons.person, route: '/profile'),
      DrawerItem(title: 'Settings', icon: Icons.settings, route: '/settings'),
    ];
  }
}