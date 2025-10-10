import 'dart:math' show cos, pi;
import 'package:ar_widget/src/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart' show Vector2, Vector3;
import 'package:ar_widget/src/utils.dart';

class ArkitWidget extends StatefulWidget {
  const ArkitWidget({
    super.key,
    required this.size,
    required this.canvasSize,
    required this.child,
  });

  final Vector2 size;
  final Vector2 canvasSize;
  final Widget child;

  @override
  ArkitWidgetState createState() => ArkitWidgetState();
}

class ArkitWidgetState extends State<ArkitWidget> {
  ARKitController? _arkit;
  Offset _offset = Offset.zero;
  Matrix4 _canvas = Matrix4.identity();
  double _angle = 0;
  Offset _origin = const Offset(0, 0);
  String? _ancId;

  @override
  void dispose() {
    _arkit?.onAddNodeForAnchor = null;
    _arkit?.onUpdateNodeForAnchor = null;
    _arkit?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ARKitSceneView(
          onARKitViewCreated: _onARCreated,
          planeDetection: ARPlaneDetection.horizontal,
        ),
        _ancId == null
            ? const Searching()
            : Positioned(
                left: _offset.dx,
                top: _offset.dy,
                child: Transform.rotate(
                  angle: _angle,
                  origin: _origin,
                  alignment: Alignment.topLeft,
                  child: Container(
                    transform: _canvas,
                    alignment: Alignment.center,
                    width: widget.canvasSize.x,
                    height: widget.canvasSize.y,
                    child: widget.child,
                  ),
                ),
              ),
      ],
    );
  }

  void _onARCreated(ARKitController arkit) {
    _arkit = arkit;
    _arkit?.onAddNodeForAnchor = _onAddAnchor;
    _arkit?.onUpdateNodeForAnchor = _onUpdateAnchor;
  }

  void _onAddAnchor(ARKitAnchor anchor) {
    if (_ancId != null) return;
    if (anchor is! ARKitPlaneAnchor) return;
    _showCanvas(anchor);
  }

  void _showCanvas(ARKitPlaneAnchor anchor) {
    // Shadow
    final color = ARKitMaterialProperty.color(Colors.black);
    final material = ARKitMaterial(transparency: 0.9, diffuse: color);
    final shape = ARKitCylinder(
      height: 0.001,
      radius: 0.1,
      materials: [material],
    );
    final node = ARKitNode(
      name: anchor.identifier,
      geometry: shape,
      position: Vector3(
        anchor.center.x,
        anchor.center.y,
        anchor.center.z + 0.1,
      ),
      scale: Vector3(2, 1, 1),
    );
    _arkit?.add(node, parentNodeName: anchor.nodeName);
    // Canvas
    setState(() {
      _ancId = anchor.identifier;
    });
  }

  void _onUpdateAnchor(ARKitAnchor anchor) {
    if (anchor.identifier != _ancId) return;
    if (anchor is! ARKitPlaneAnchor) return;
    _updateTransform(anchor);
  }

  Future<void> _updateTransform(ARKitPlaneAnchor anchor) async {
    // cam
    final camPosInWorld = await _arkit?.cameraPosition();
    final rawCamAngleInWorld = await _arkit?.getCameraEulerAngles();
    if (rawCamAngleInWorld == null) return;
    final camAngleInWorld = Vector3(
      rawCamAngleInWorld.x,
      rawCamAngleInWorld.y,
      rawCamAngleInWorld.z + (pi / 2.0), // iOSのズレを修正
    );
    // anc
    final ancInWorld = anchor.transform;
    final ancPosInWorld = ancInWorld.getTranslation();
    final ancPosInScreen = await _arkit?.projectPoint(ancPosInWorld);
    // calc
    final ancRotInWorld = ancInWorld.getRotation();
    final front = Vector3(0.0, 0.0, 1.0);
    final vecAncToFront = ancRotInWorld.transform(front);
    final vecAncToCam = camPosInWorld! - ancPosInWorld;
    final angles = getAngles(vecAncToFront, vecAncToCam);
    final distance = ancPosInWorld.distanceTo(camPosInWorld);
    const scaleFactor = 0.3;
    final scale = scaleFactor / distance;
    final cosX = cos(angles.x);
    final cosY = cos(angles.y);
    final width = widget.canvasSize.x * cosY * scale;
    final height = widget.canvasSize.y * cosX * scale;
    final halfW = (width / 2.0);
    final left = ancPosInScreen!.x - halfW;
    final top = ancPosInScreen.y - height;
    final offset = Offset(left, top);
    final origin = Offset(halfW, height);
    final canvas = Matrix4.identity();
    canvas.rotateX(angles.x);
    canvas.rotateY(-angles.y);
    canvas.scaleByDouble(scale, scale, scale, 1.0);
    // update
    setState(() {
      _canvas = canvas;
      _offset = offset;
      _angle = camAngleInWorld.z;
      _origin = origin;
    });
  }
}
