import 'package:flutter/material.dart';
import 'package:virtual_phone/src/view/widgets/minimal_section_header.dart';

class ControllDeviceSectionHeader extends StatelessWidget {
  const ControllDeviceSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const MinimalSectionHeader(
      title: '操作する',
    );
  }
}
