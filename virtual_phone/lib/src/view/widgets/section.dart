import 'package:flutter/material.dart';

sealed class Section {
  const Section({
    required this.header,
  });

  final Widget header;
}

class StaticSection extends Section {
  const StaticSection({
    required super.header,
    required this.tiles,
  });

  final List<Widget> tiles;
}

class DynamicSection extends Section {
  const DynamicSection({
    required super.header,
    required this.tileCount,
    required this.tileBuilder,
  });

  final int tileCount;
  final Widget Function(int index) tileBuilder;
}
