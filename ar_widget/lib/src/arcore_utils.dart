import 'package:json_annotation/json_annotation.dart';
import 'package:vector_math/vector_math_64.dart';

class MatrixConverter implements JsonConverter<Matrix4, List<dynamic>> {
  const MatrixConverter();

  @override
  Matrix4 fromJson(List<dynamic> json) {
    return Matrix4.fromList(json.cast<double>());
  }

  @override
  List<dynamic> toJson(Matrix4 matrix) {
    final list = List<double>.filled(16, 0.0);
    matrix.copyIntoArray(list);
    return list;
  }
}
