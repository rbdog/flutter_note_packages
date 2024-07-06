import 'package:flutter/material.dart';

class SideMenuPage extends StatelessWidget {
  const SideMenuPage({
    super.key,
    required this.menuWidth,
    required this.menu,
    required this.content,
  });

  final double menuWidth;
  final Widget menu;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // back layer
          Row(
            children: [
              SizedBox(
                width: menuWidth,
              ),
              Expanded(
                child: content,
              ),
            ],
          ),
          // front layer
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 0),
                      blurRadius: 10,
                    ),
                  ],
                ),
                width: menuWidth,
                child: menu,
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
