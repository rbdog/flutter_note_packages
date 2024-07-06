import 'package:flutter/material.dart';
import 'package:virtual_phone/src/view/widgets/minimal_section_header.dart';

class PickModelSectionHeader extends StatelessWidget {
  const PickModelSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const MinimalSectionHeader(
      title: 'スマホを選ぶ',
    );
  }
}
