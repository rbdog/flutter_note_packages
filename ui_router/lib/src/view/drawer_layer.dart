//
//
//

import 'package:ui_router/src/notifier/drawer_notifier.dart';
import 'package:flutter/material.dart';

class UiDrawerLayer extends StatefulWidget {
  const UiDrawerLayer(
    this.notifier, {
    super.key,
  });

  final UiDrawerNotifier notifier;

  @override
  State<UiDrawerLayer> createState() => _UiDrawerLayerState();
}

/// UiNavRouteState
class _UiDrawerLayerState extends State<UiDrawerLayer> {
  late bool isOpen;
  final drawerKey = GlobalKey<ScaffoldState>();

  void updateState() {
    final newState = widget.notifier.state.value;

    setState(() {
      isOpen = newState;
    });

    if (newState) {
      drawerKey.currentState?.openDrawer();
    } else {
      drawerKey.currentState?.closeDrawer();
    }
  }

  @override
  void initState() {
    super.initState();
    isOpen = widget.notifier.state.value;
    widget.notifier.state.addListener(updateState);
  }

  @override
  void dispose() {
    widget.notifier.state.removeListener(updateState);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isOpen,
      child: Scaffold(
        drawer: widget.notifier.drawer?.call(),
        onDrawerChanged: (isOpened) {
          if (isOpened && !isOpen) {
            widget.notifier.slideIn();
          } else if (!isOpened && isOpen) {
            widget.notifier.slideOut();
          }
        },
        key: drawerKey,
        backgroundColor: Colors.transparent,
        body: Container(),
      ),
    );
  }
}
