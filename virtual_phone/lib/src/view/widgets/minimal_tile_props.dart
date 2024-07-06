import 'package:flutter/material.dart';

/// タイルのデータ
sealed class MinimalTileProps {
  MinimalTileProps({
    required this.title,
  });
  final Widget title;
}

/// タップアクション
class TapActionProps extends MinimalTileProps {
  TapActionProps({
    required super.title,
    required this.icon,
    required this.onTap,
  });

  final Widget icon;
  final VoidCallback onTap;
}

/// 別の画面へ移動
class NavigationProps extends MinimalTileProps {
  NavigationProps({
    required super.title,
    required this.builder,
  });
  final WidgetBuilder builder;
}

/// On / Off
class OnOffProps extends MinimalTileProps {
  OnOffProps({
    required super.title,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final void Function(bool newValue) onChanged;
}

/// 子 Widget 付き
class WithChildProps extends MinimalTileProps {
  WithChildProps({
    required super.title,
    required this.child,
  });

  final Widget child;
}
