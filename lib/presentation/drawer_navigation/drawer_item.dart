import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final String titleEn;
  final IconData icon;
  final String route;
  final List<DrawerItem> children;

  DrawerItem({
    required this.titleEn, 
    required this.title,
    required this.icon,
    required this.route,
    this.children = const [],
  });
}
