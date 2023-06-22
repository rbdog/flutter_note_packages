import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ar_widget/src/arcore_anchor.dart';
import 'package:ar_widget/src/arcore_hit_result.dart';
import 'package:ar_widget/src/arcore_utils.dart';

class _Methods {
  static const init = 'init';
  static const addAnchor = 'addAnchor';
  static const getCamPose = 'getCamPose';
  static const getAncPose = 'getAncPose';
  static const dispose = 'dispose';
}

class _Callbacks {
  static const onTapPlane = 'onTapPlane';
}

class ArcoreController {
  final _channel = const MethodChannel('archannel');

  void Function(ArcoreAnchor anchor)? onTapPlane;

  void init() {
    _channel.setMethodCallHandler(_channelCallback);
    _channel.invokeMethod<void>(
      _Methods.init,
      const {
        'showAnimatedGuide': true,
        'showFeaturePoints': false,
        'showPlanes': true,
        'customPlaneTexturePath': false,
        'showWorldOrigin': false,
        'handleTaps': true,
        'handlePans': false,
        'handleRotation': false,
      },
    );
  }

  Future<bool?> addAnchor(ArcoreAnchor anchor) async {
    final args = anchor.toJson();
    return await _channel.invokeMethod<bool>(
      _Methods.addAnchor,
      args,
    );
  }

  Future<Matrix4?> getCamPose() async {
    final camPoseJson = await _channel.invokeMethod<List<dynamic>>(
      _Methods.getCamPose,
    );
    const converter = MatrixConverter();
    return converter.fromJson(camPoseJson!);
  }

  Future<Matrix4?> getAncPose(ArcoreAnchor anchor) async {
    final args = {
      'ancId': anchor.name,
    };
    final camPoseJson = await _channel.invokeMethod<List<dynamic>>(
      _Methods.getAncPose,
      args,
    );
    const converter = MatrixConverter();
    return converter.fromJson(camPoseJson!);
  }

  Future<void> dispose() async {
    await _channel.invokeMethod<void>(_Methods.dispose);
  }

  Future<void> _channelCallback(MethodCall call) async {
    if (call.method != _Callbacks.onTapPlane) return;
    final rawResults = call.arguments as List<dynamic>;
    final resultsJson = rawResults.map(
      (r) => Map<String, dynamic>.from(r),
    );
    final results = resultsJson
        .map(
          (e) => ArcoreHitResult.fromJson(e),
        )
        .toList();
    if (results.isEmpty) return;
    final result = results.first;
    final anchor = ArcoreAnchor(
      transform: result.transform,
      name: GlobalKey().toString(),
    );
    onTapPlane?.call(anchor);
  }
}
