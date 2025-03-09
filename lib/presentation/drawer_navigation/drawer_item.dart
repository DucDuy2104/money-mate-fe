import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  final String route;
  final List<DrawerItem> children;

  DrawerItem({
    required this.title,
    required this.icon,
    required this.route,
    this.children = const [],
  });
}