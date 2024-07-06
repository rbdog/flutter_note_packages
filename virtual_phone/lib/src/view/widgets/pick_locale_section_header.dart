import 'package:flutter/material.dart';
import 'package:virtual_phone/src/view/widgets/minimal_section_header.dart';

class PickLocaleSectionHeader extends StatelessWidget {
  const PickLocaleSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const MinimalSectionHeader(
      title: '言語と地域',
    );
  }
}
