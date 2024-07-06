import 'package:flutter/material.dart';

import '../theme/colors.dart';
import 'minimal_page_header.dart';

class MinimalPage extends StatelessWidget {
  const MinimalPage({
    super.key,
    required this.title,
    required this.body,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BrandColor.background,
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: MinimalPageHeader(title: title),
          ),
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
