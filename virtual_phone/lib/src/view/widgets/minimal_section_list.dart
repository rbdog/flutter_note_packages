import 'package:flutter/material.dart';
import 'package:virtual_phone/src/view/widgets/minimal_separator.dart';

import '../theme/colors.dart';
import 'section.dart';

class MinimalSectionList extends StatelessWidget {
  const MinimalSectionList({
    super.key,
    required this.sections,
  });

  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    final List<Widget> slivers = [];

    final sectionIndexList = List.generate(sections.length, (i) => i);
    for (final sectionIndex in sectionIndexList) {
      final section = sections[sectionIndex];
      // Header
      final headerSliver = SliverToBoxAdapter(child: section.header);
      slivers.add(headerSliver);

      // Gap
      const gap = SizedBox(height: 2);
      const gapSliver = SliverToBoxAdapter(child: gap);
      slivers.add(gapSliver);

      // List
      final _ListSliver listSliver = switch (section) {
        StaticSection(:final tiles) => _ListSliver(
            itemCount: tiles.length,
            itemBuilder: (index) => tiles[index],
          ),
        DynamicSection(:final tileCount, :final tileBuilder) => _ListSliver(
            itemCount: tileCount,
            itemBuilder: tileBuilder,
          ),
      };
      slivers.add(listSliver);

      // 最後の要素でなければスペースを追加
      final isLast = sectionIndex == sections.length - 1;
      if (!isLast) {
        const sectionGap = SizedBox(height: 20);
        const sectionGapSliver = SliverToBoxAdapter(child: sectionGap);
        slivers.add(sectionGapSliver);
      }
    }

    return Container(
      padding: const EdgeInsets.only(
        left: 8,
        top: 12,
        right: 8,
        bottom: 12,
      ),
      color: BrandColor.background,
      child: CustomScrollView(
        slivers: slivers.toList(),
      ),
    );
  }
}

class _ListSliver extends StatelessWidget {
  const _ListSliver({
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget Function(int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return DecoratedSliver(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: BrandColor.content,
      ),
      sliver: SliverList.separated(
        itemCount: itemCount,
        itemBuilder: (_, index) => itemBuilder(index),
        separatorBuilder: (_, index) => const MinimalSeparator(),
      ),
    );
  }
}
