import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:money_mate/presentation/drawer_navigation/drawer_item.dart';
import 'package:money_mate/presentation/routes/route_name.dart';

class DrawerService {
  static List<DrawerItem> getDrawerItems() {
    return [
      DrawerItem(title: 'Trang chủ', icon: EvaIcons.home, route: RouteNames.home),
      DrawerItem(title: 'Danh mục', icon: EvaIcons.cube, route: RouteNames.category),
      DrawerItem(title: 'Thông báo', icon: EvaIcons.bell, route: RouteNames.notifications),
      DrawerItem(title: 'Tài khoản', icon: Icons.person, route: RouteNames.profile),
      DrawerItem(title: 'Cài đặt', icon: Icons.settings, route: RouteNames.settings),
    ];
  }
}