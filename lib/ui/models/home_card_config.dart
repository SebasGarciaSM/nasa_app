import 'package:flutter/material.dart';

class HomeCardConfig {
  final IconData icon;
  final String title;
  final Color lightColor;
  final Color darkColor;
  final VoidCallback? onTap;

  HomeCardConfig({
    required this.icon,
    required this.title,
    required this.lightColor,
    required this.darkColor,
    this.onTap,
  });
}
