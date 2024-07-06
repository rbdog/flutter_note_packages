import 'package:flutter/material.dart';

class RotationText extends StatelessWidget {
  const RotationText({
    super.key,
    required this.isPortrait,
  });

  final bool isPortrait;

  @override
  Widget build(BuildContext context) {
    return Text(
      switch (isPortrait) {
        true => 'Portrait',
        false => 'Landscape',
      },
    );
  }
}
