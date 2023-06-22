import 'package:flutter/widgets.dart';
import 'package:ar_widget/src/arcore_utils.dart';

class ArcoreAnchor {
  const ArcoreAnchor({
    required this.transform,
    required this.name,
    this.childNodes = const [],
    this.ttl = 1,
  });

  final List<String> childNodes;
  final int? ttl;
  final Matrix4 transform;
  final String name;

  factory ArcoreAnchor.fromJson(Map<String, dynamic> json) => json2anchor(json);
  Map<String, dynamic> toJson() => anchor2json(this);
}

ArcoreAnchor json2anchor(Map<String, dynamic> json) {
  final transform = json['transform'];
  final name = json['name'];
  final childNodes = json['childNodes'];
  final ttl = json['ttl'];

  return ArcoreAnchor(
    transform: const MatrixConverter().fromJson(transform as List),
    name: name as String,
    childNodes: childNodes?.map((n) => n.toString())?.toList()?.cast<String>(),
    ttl: ttl as int?,
  );
}

Map<String, dynamic> anchor2json(ArcoreAnchor anchor) {
  const converter = MatrixConverter();
  return <String, dynamic>{
    'transform': converter.toJson(anchor.transform),
    'name': anchor.name,
    'childNodes': anchor.childNodes,
    'ttl': anchor.ttl,
  };
}
