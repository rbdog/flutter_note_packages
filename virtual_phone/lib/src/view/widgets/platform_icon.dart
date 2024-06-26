import 'package:flutter/material.dart';

/// An icon for a [TargetPlatform].
class PlatformIcon extends StatelessWidget {
  const PlatformIcon({
    super.key,
    required this.platform,
    this.color,
  });

  final Color? color;
  final TargetPlatform platform;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? IconTheme.of(context).color ?? Colors.black;
    return FittedBox(
      child: SizedBox(
        width: 24,
        height: 24,
        child: CustomPaint(
          size: const Size(24, 24),
          painter: _PathPainter(
            platform,
            color,
          ),
        ),
      ),
    );
  }
}

class _PathPainter extends CustomPainter {
  const _PathPainter(this.target, this.color);

  final TargetPlatform target;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = _paths[target];
    canvas.drawPath(path!, paint);
  }

  @override
  bool shouldRepaint(_PathPainter oldDelegate) =>
      target != oldDelegate.target || color != oldDelegate.color;
}

/// Genereted from https://simpleicons.org/ with https://fluttershapemaker.com/
final _paths = <TargetPlatform, Path>{
  TargetPlatform.iOS: Path()
    ..moveTo(
      12.152,
      6.896,
    )
    ..cubicTo(
      11.203999999999999,
      6.896,
      9.736999999999998,
      5.818,
      8.192,
      5.856,
    )
    ..cubicTo(
      6.152,
      5.883,
      4.282,
      7.039,
      3.231,
      8.87,
    )
    ..cubicTo(
      1.1139999999999999,
      12.544999999999998,
      2.6849999999999996,
      17.973,
      4.75,
      20.96,
    )
    ..cubicTo(
      5.763,
      22.414,
      6.958,
      24.05,
      8.542,
      23.999000000000002,
    )
    ..cubicTo(
      10.062,
      23.934,
      10.632,
      23.012000000000004,
      12.477,
      23.012000000000004,
    )
    ..cubicTo(
      14.308,
      23.012000000000004,
      14.827,
      23.999000000000002,
      16.437,
      23.960000000000004,
    )
    ..cubicTo(
      18.074,
      23.934000000000005,
      19.113,
      22.480000000000004,
      20.113,
      21.012000000000004,
    )
    ..cubicTo(
      21.269,
      19.324000000000005,
      21.749,
      17.687000000000005,
      21.775,
      17.597000000000005,
    )
    ..cubicTo(
      21.735999999999997,
      17.584000000000003,
      18.593,
      16.376000000000005,
      18.555,
      12.740000000000006,
    )
    ..cubicTo(
      18.529,
      9.700000000000006,
      21.035,
      8.246000000000006,
      21.152,
      8.181000000000004,
    )
    ..cubicTo(
      19.723000000000003,
      6.091000000000005,
      17.529,
      5.857000000000005,
      16.762,
      5.805000000000005,
    )
    ..cubicTo(
      14.762,
      5.649000000000005,
      13.087,
      6.895000000000005,
      12.152000000000001,
      6.895000000000005,
    )
    ..close()
    ..moveTo(
      15.53,
      3.83,
    )
    ..cubicTo(
      16.372999999999998,
      2.818,
      16.93,
      1.403,
      16.775,
      0,
    )
    ..cubicTo(
      15.567999999999998,
      0.052,
      14.113,
      0.805,
      13.242999999999999,
      1.818,
    )
    ..cubicTo(
      12.463,
      2.714,
      11.788999999999998,
      4.156000000000001,
      11.969999999999999,
      5.532,
    )
    ..cubicTo(
      13.308,
      5.636,
      14.684999999999999,
      4.844,
      15.529,
      3.831,
    ),
  TargetPlatform.android: Path()
    ..moveTo(17.523, 15.3413)
    ..cubicTo(16.9719, 15.3413, 16.5237, 14.8927, 16.5237, 14.3416)
    ..cubicTo(16.5237, 13.7905, 16.972, 13.3423, 17.523, 13.3423)
    ..cubicTo(18.0741, 13.3423, 18.5223, 13.7906, 18.5223, 14.3416)
    ..cubicTo(18.5224, 14.8927, 18.0741, 15.3413, 17.523, 15.3413)
    ..close()
    ..moveTo(6.477, 15.3413)
    ..cubicTo(5.9259, 15.3413, 5.4777, 14.8927, 5.4777, 14.3416)
    ..cubicTo(5.4777, 13.7905, 5.9259, 13.3423, 6.477, 13.3423)
    ..cubicTo(7.0281, 13.3423, 7.4763, 13.7906, 7.4763, 14.3416)
    ..cubicTo(7.4763, 14.8927, 7.028, 15.3413, 6.477, 15.3413)
    ..close()
    ..moveTo(17.8815, 9.32131)
    ..lineTo(19.8788, 5.86211)
    ..cubicTo(19.9338, 5.76664, 19.9486, 5.65327, 19.9201, 5.54686)
    ..cubicTo(19.8916, 5.44045, 19.822, 5.3497, 19.7267, 5.29451)
    ..cubicTo(19.6312, 5.23954, 19.5179, 5.22468, 19.4115, 5.2532)
    ..cubicTo(19.305, 5.28171, 19.2143, 5.35127, 19.1591, 5.44661)
    ..lineTo(17.1368, 8.94961)
    ..cubicTo(15.5902, 8.24381, 13.8533, 7.85071, 12, 7.85071)
    ..cubicTo(10.1467, 7.85071, 8.4098, 8.24381, 6.8633, 8.94961)
    ..lineTo(4.841, 5.44661)
    ..cubicTo(4.78579, 5.35126, 4.69502, 5.2817, 4.5886, 5.25319)
    ..cubicTo(4.48217, 5.22468, 4.36878, 5.23954, 4.2733, 5.29451)
    ..cubicTo(4.1779, 5.34964, 4.10829, 5.4404, 4.07977, 5.54683)
    ..cubicTo(4.05125, 5.65326, 4.06615, 5.76666, 4.1212, 5.86211)
    ..lineTo(6.1185, 9.32131)
    ..cubicTo(2.6889, 11.1866, 0.3432, 14.6588, 0, 18.7609)
    ..lineTo(24, 18.7609)
    ..cubicTo(23.6565, 14.6588, 21.3108, 11.1866, 17.8815, 9.32131),
};
