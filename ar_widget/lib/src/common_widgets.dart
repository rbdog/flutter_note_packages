import 'package:flutter/material.dart';

/// Searching
class Searching extends StatelessWidget {
  const Searching({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        Container(
          color: Colors.black,
          child: const Text(
            'Searching for a plane..',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

/// NotSupported
class NotSupported extends StatelessWidget {
  const NotSupported({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: const Text(
        'This platform is not supported.',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
