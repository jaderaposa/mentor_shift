import 'package:flutter/material.dart';

class Achievement {
  final String name;
  final IconData? icon;
  final Color? color;
  final bool isLocked;

  Achievement({
    required this.name,
    this.icon,
    this.color,
    required this.isLocked,
  });
}
