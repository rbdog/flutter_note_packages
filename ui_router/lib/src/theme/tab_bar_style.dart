import 'package:flutter/material.dart';

class UiTabBarStyle {
  const UiTabBarStyle({
    this.height = 60,
    this.elevation = 20,
    this.color = Colors.white,
    this.itemColor = Colors.transparent,
    this.itemChildColor = Colors.grey,
    this.selectedItemColor = Colors.transparent,
    this.selectedItemChildColor = Colors.blue,
  });

  /// bar height
  final double height;

  /// elevation
  final double elevation;

  /// bar color
  final Color? color;

  /// item color
  final Color? itemColor;

  /// item child color
  final Color? itemChildColor;

  /// selected item color
  final Color? selectedItemColor;

  /// selected item child color
  final Color? selectedItemChildColor;
}
