import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../theme/colors.dart';

/// A search field for the tool menu.
class MinimalTextField extends HookWidget {
  const MinimalTextField({
    super.key,
    required this.hintText,
    required this.text,
    required this.onChanged,
  });

  final String text;

  final String hintText;

  final void Function(String text) onChanged;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(
      text: text,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 80,
        child: Material(
          child: Container(
            color: BrandColor.field,
            child: TextField(
              controller: textController,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: hintText,
                filled: true,
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                suffix: InkWell(
                  onTap: () {
                    textController.text = '';
                    onChanged('');
                  },
                  child: const Icon(Icons.close),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
