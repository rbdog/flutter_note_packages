import 'package:flutter/material.dart';
import 'package:virtual_phone/src/view/widgets/minimal_section_header.dart';

class ClassicModelSectionHeader extends StatelessWidget {
  const ClassicModelSectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const MinimalSectionHeader(
      title: 'Classic',
    );
  }
}
