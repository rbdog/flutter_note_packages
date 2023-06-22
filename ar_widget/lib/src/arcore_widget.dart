import 'dart:async';
import 'dart:math';
import 'package:ar_widget/src/arcore_anchor.dart';
import 'package:ar_widget/src/arcore_base_widget.dart';
import 'package:ar_widget/src/arcore_controller.dart';
import 'package:ar_widget/src/utils.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;
import 'package:flutter/material.dart';

class ArcoreWidget extends StatelessWidget {
  const ArcoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      alignment: Alignment.center,
      child: const Text(
        'Android is not supported yet.',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class DevArcoreWidget extends StatefulWidget {
  const DevArcoreWidget({
    super.key,
    required this.size,
    required this.canvasSize,
  });

  final Vector2 size;
  final Vector2 canvasSize;
  @override
  State<DevArcoreWidget> createState() => _ARCoreWidgetState();
}

class _ARCoreWidgetState extends State<DevArcoreWidget> {
  ArcoreController? _arcore;
  ArcoreAnchor? _anchor;
  double _left = 0;
  double _top = 0;
  Matrix4 _canvas = Matrix4.identity();
  double _angle = 0;
  Offset _origin = const Offset(0, 0);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) async {
        if (_arcore == null) return;
        if (_anchor == null) return;
        final ancPose = await _arcore!.getAncPose(_anchor!);
        if (ancPose == null) return;
        final cam = await _arcore!.getCamPose();
        if (cam == null) return;
        updateCanvas(
          widget.size,
          1.0,
          cam,
          ancPose,
          (cvs, lf, tp, ang, ogn) {
            setState(() {
              _canvas = cvs;
              _left = lf;
              _top = tp;
              _angle = ang;
              _origin = ogn;
            });
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _arcore?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ArcoreBaseWidget(
          onCreated: (controller) {
            _arcore = controller;
            _arcore!.onTapPlane = (a) async {
              if (_anchor != null) return;
              final successAdd = await controller.addAnchor(a);
              if (successAdd != true) return;
              final ancPose = await _arcore!.getAncPose(a);
              if (ancPose == null) return;
              final cam = await _arcore!.getCamPose();
              if (cam == null) return;

              setState(() {
                _anchor = a;
              });

              updateCanvas(
                widget.size,
                1.0,
                cam,
                ancPose,
                (cvs, lf, tp, ang, ogn) {
                  setState(() {
                    _canvas = cvs;
                    _left = lf;
                    _top = tp;
                    _angle = ang;
                    _origin = ogn;
                  });
                },
              );
            };
            controller.init();
          },
        ),
        _anchor == null
            ? const SizedBox.shrink()
            : Positioned(
                left: _left,
                top: _top,
                child: Transform.rotate(
                  angle: _angle,
                  origin: _origin,
                  alignment: Alignment.topLeft,
                  child: Container(
                    transform: _canvas,
                    alignment: Alignment.center,
                    width: widget.canvasSize.x,
                    height: widget.canvasSize.y,
                    child: Container(
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  void updateCanvas(
    Vector2 screenSize,
    double distanceToScreen,
    Matrix4 camInWorld,
    Matrix4 ancInWorld,
    void Function(
      Matrix4 canvas,
      double left,
      double top,
      double angle,
      Offset origin,
    ) setCanvasTransform,
  ) async {
    // 1. anc in cam
    final ancInCam = getTransformIn(ancInWorld, camInWorld);
    // 2. pos in cam
    final posInCam = ancInCam.getTranslation();
    // 3. distance
    final distance = posInCam.length;
    // 4. scale unit
    const scaleUnit = 0.5;
    // 5. scale
    final scale = (scaleUnit / distance);
    // 6. anc pos in screen
    final posInScreen = getIntersection(
      posInCam,
      distanceToScreen,
      screenSize,
    );
    // 7. anc to cam
    final ancToCam = -posInCam;
    // 8. anc to front
    final rotInCam = ancInCam.getRotation();
    final front = Vector3(0.0, 0.0, 1.0);
    final ancToFront = rotInCam.transform(front);
    final angles = getAngles(ancToFront, ancToCam);
    // 9. left
    final cosY = cos(angles.y);
    final wInScreen = widget.canvasSize.x * cosY * scale;
    final left = posInScreen.x - (wInScreen / 2.0);
    // 10. top
    final cosX = cos(angles.x);
    final hInScreen = widget.canvasSize.y * cosX * scale;
    final top = posInScreen.y - (hInScreen);
    // 11. origin
    final origin = Offset(posInScreen.x - left, posInScreen.y - top);
    // 12. cam rot
    final camRot = camInWorld.getRotation();
    final camAngles = rot2angles(camRot);
    final canvas = Matrix4.identity();
    canvas.rotateX(angles.x);
    canvas.rotateY(-angles.y);
    canvas.scale(scale);
    setCanvasTransform(
      canvas,
      left,
      top,
      camAngles.z,
      origin,
    );
  }
}
