import 'dart:math';
import 'package:vector_math/vector_math_64.dart'
    show Matrix4, Matrix3, Vector2, Vector3, makePerspectiveMatrix, radians;

Vector3 getAngles(Vector3 vec1, Vector3 vec2) {
  final x1 = Vector2(vec1.y, vec1.z);
  final x2 = Vector2(vec2.y, vec2.z);
  final y1 = Vector2(vec1.z, vec1.x);
  final y2 = Vector2(vec2.z, vec2.x);
  final z1 = Vector2(vec1.x, vec1.y);
  final z2 = Vector2(vec2.x, vec2.y);
  final x = x1.angleToSigned(x2);
  final y = y1.angleToSigned(y2);
  final z = z1.angleToSigned(z2);
  return Vector3(x, y, z);
}

Vector2 projectPoint(
  Vector3 pos,
  Vector2 screenSize,
) {
  final aspectRatio = screenSize.x / screenSize.y;
  const fovDegrees = 60.0;
  final fovRadians = radians(fovDegrees);
  const near = 0.001;
  const far = 1000.0;
  final projectionMatrix = makePerspectiveMatrix(
    fovRadians,
    aspectRatio,
    near,
    far,
  );
  Matrix4 transformMatrix = Matrix4.identity() * projectionMatrix;
  Vector3 homogeneousPoint = transformMatrix.transform3(pos);
  double x = homogeneousPoint.x;
  double y = homogeneousPoint.y;
  double w = homogeneousPoint.z;
  double screenX = (x / w + 1.0) * 0.5 * screenSize.x;
  double screenY = (1.0 - y / w) * 0.5 * screenSize.y;
  return Vector2(screenX, screenY);
}

Matrix4 createTransform(Matrix3 rot, Vector3 pos) {
  final transform = Matrix4.identity();
  transform.setRotation(rot);
  transform.setTranslation(pos);
  return transform;
}

Matrix3 angles2rot(Vector3 angles) {
  Matrix3 rotationMatrixX = Matrix3.rotationX(angles.x);
  Matrix3 rotationMatrixY = Matrix3.rotationY(angles.y);
  Matrix3 rotationMatrixZ = Matrix3.rotationZ(angles.z);
  Matrix3 resultMatrix = rotationMatrixZ * rotationMatrixY * rotationMatrixX;
  return resultMatrix;
}

Matrix4 getLocalTransform(Matrix4 target, Matrix4 base) {
  Matrix4 inverseBase = Matrix4.inverted(base);
  Matrix4 localMatrix = inverseBase * target;
  return localMatrix;
}

Matrix4 getTransformIn(Matrix4 target, Matrix4 base) {
  Matrix4 inverseBase = Matrix4.inverted(base);
  Matrix4 localMatrix = inverseBase * target;
  return localMatrix;
}

Vector2 getIntersection(Vector3 point, double distance, Vector2 screenSize) {
  double x = (distance * point.x) / point.z;
  double y = (distance * point.y) / point.z;
  return Vector2(
    (-x * screenSize.x) + (screenSize.x / 2.0),
    (y * screenSize.y) + (screenSize.y / 2.0),
  );
}

Vector3 rot2angles(Matrix3 rotation) {
  final rot = rotation.clone();
  final e00 = rot.entry(0, 0);
  final e10 = rot.entry(1, 0);
  final sy = sqrt(e00 * e00 + e10 * e10);
  final singular = sy < 1e-6;
  late final double x;
  late final double y;
  late final double z;
  if (singular) {
    final e11 = rot.entry(1, 1);
    final e12 = rot.entry(1, 2);
    final e20 = rot.entry(2, 0);
    x = atan2(-e12, e11);
    y = atan2(-e20, sy);
    z = 0;
  } else {
    final e20 = rot.entry(2, 0);
    final e21 = rot.entry(2, 1);
    final e22 = rot.entry(2, 2);
    x = atan2(e21, e22);
    y = atan2(-e20, sy);
    z = atan2(e10, e00);
  }
  return Vector3(x, y, z);
}
