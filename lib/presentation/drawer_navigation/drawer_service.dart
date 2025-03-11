import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_item.dart';
import 'package:money_mate/presentation/routes/route_name.dart';

class DrawerService {
  static List<DrawerItem> getDrawerItems() {
    return [
      DrawerItem(title: 'Home', icon: EvaIcons.home, route: RouteNames.home),
      DrawerItem(title: 'Category', icon: EvaIcons.cube, route: RouteNames.category),
      DrawerItem(title: 'Profile', icon: Icons.person, route: '/profile'),
      DrawerItem(title: 'Settings', icon: Icons.settings, route: RouteNames.settings),
    ];
  }
}