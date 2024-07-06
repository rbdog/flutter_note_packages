import 'package:flutter/material.dart';

import '../theme/colors.dart';

class MinimalSeparator extends StatelessWidget {
  const MinimalSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      height: 1.5,
      color: BrandColor.background,
    );
  }
}
