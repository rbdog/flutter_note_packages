import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'icon_text_button.dart';

class MinimalPageHeader extends StatelessWidget {
  const MinimalPageHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Row(
            children: [
              IconTextButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                icon: const Icon(
                  Icons.chevron_left,
                  color: BrandColor.activeButton,
                ),
                text: const Text(
                  'Back',
                  style: TextStyle(
                    color: BrandColor.activeButton,
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        Flexible(
          child: Center(
            child: Text(title),
          ),
        ),
        Flexible(
          child: Container(),
        ),
      ],
    );
  }
}
