import 'package:ui_router/src/state/dialog_state.dart';
import 'package:flutter/material.dart';

class UiDialog {
  const UiDialog({
    required this.name,
    required this.build,
  });

  final String name;
  final Widget Function(UiDialogState state) build;
}
