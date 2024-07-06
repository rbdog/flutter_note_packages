import 'package:flutter/material.dart';

import '../theme/colors.dart';

class MinimalSectionHeader extends StatelessWidget {
  const MinimalSectionHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              color: BrandColor.weakTitle,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
