import 'package:flutter/material.dart';

class NavItemModel {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  final String route;

  const NavItemModel({
    required this.label,
    required this.icon,
    required this.activeIcon,
    required this.route,
  });
}

class FabMenuItemModel {
  final String label;
  final IconData icon;
  final Color color;
  final Color bgColor;
  final String route;
  final List<String> allowedRoles; // ['employee', 'supervisor', 'hr', 'all']

  const FabMenuItemModel({
    required this.label,
    required this.icon,
    required this.color,
    required this.bgColor,
    required this.route,
    this.allowedRoles = const ['all'],
  });
}
