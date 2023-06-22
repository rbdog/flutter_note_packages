import 'package:ar_widget/src/arcore_utils.dart';
import 'package:vector_math/vector_math_64.dart';

class ArcoreHitResult {
  ArcoreHitResult(
    this.distance,
    this.transform,
  );

  final double distance;
  final Matrix4 transform;
  static ArcoreHitResult fromJson(Map<String, dynamic> json) =>
      _json2result(json);
  Map<String, dynamic> toJson() => _result2json(this);
}

ArcoreHitResult _json2result(Map<String, dynamic> json) {
  final distance = json['distance'];
  final worldTransform = json['worldTransform'];
  const converter = MatrixConverter();
  return ArcoreHitResult(
    (distance as num).toDouble(),
    converter.fromJson(worldTransform as List),
  );
}

Map<String, dynamic> _result2json(ArcoreHitResult result) {
  final json = <String, dynamic>{};
  const converter = MatrixConverter();
  final transformJson = converter.toJson(result.transform);
  json['worldTransform'] = transformJson;
  json['distance'] = result.distance;
  return json;
}
