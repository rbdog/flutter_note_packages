import 'package:ui_router/src/notifier/tab_shell_notifier.dart';
import 'package:ui_router/src/view/tab_bar_item.dart';
import 'package:ui_router/src/theme/tab_bar_style.dart';
import 'package:flutter/material.dart';

class UiTabBar extends StatefulWidget {
  const UiTabBar(
    this.notifier, {
    super.key,
    UiTabBarStyle? style,
  }) : style = style ?? const UiTabBarStyle();

  final UiTabShellNotifier notifier;
  final UiTabBarStyle style;

  @override
  State<UiTabBar> createState() => _UiTabBarState();
}

class _UiTabBarState extends State<UiTabBar> {
  @override
  void initState() {
    super.initState();
    widget.notifier.state.addListener(updateState);
  }

  @override
  void dispose() {
    widget.notifier.state.removeListener(updateState);
    super.dispose();
  }

  void updateState() {
    // rebuild
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final layoutBuilder = LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth = constraints.maxWidth / widget.notifier.pages.length;
        final itemHeight = widget.style.height;
        final paths = widget.notifier.pages.map((e) => e.path).toList();

        final row = Row(
          mainAxisSize: MainAxisSize.min,
          children: List<Widget>.generate(
            paths.length,
            (index) {
              final path = paths[index];
              final isSelected = widget.notifier.selectedPath == path;
              final itemColor = isSelected
                  ? widget.style.selectedItemColor
                  : widget.style.itemColor;
              final itemChildBuilder = widget.notifier.pages
                  .singleWhere(
                    (e) => e.path == path,
                  )
                  .item;
              final nullableItemChild = itemChildBuilder?.call(isSelected);
              final itemChild = nullableItemChild ??
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.circle),
                      Text(path),
                    ],
                  );
              final itemChildColor = isSelected
                  ? widget.style.selectedItemChildColor
                  : widget.style.itemChildColor;

              return Container(
                width: itemWidth,
                height: itemHeight,
                color: itemColor,
                child: UiTabBarItem(
                  onTap: () {
                    widget.notifier.select(path);
                  },
                  color: itemColor,
                  childColor: itemChildColor,
                  child: itemChild,
                ),
              );
            },
          ),
        );

        return row;
      },
    );

    return Material(
      color: widget.style.color,
      elevation: widget.style.elevation,
      child: layoutBuilder,
    );
  }
}
