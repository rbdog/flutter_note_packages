//
//
//

import 'package:flutter/material.dart';
import 'package:ui_router/src/state/loading_state.dart';

class UiLoading {
  const UiLoading({
    required this.name,
    this.indicator,
  });

  final String name;
  final Widget Function(UiLoadingState state)? indicator;
}
