import 'package:nanoid_plus/nanoid_plus.dart';

void main() {
  final nanoid = Nanoid();

  // Use A–Z, a–z, 0–9, '-', '_'
  final id1 = nanoid.urlSafe();

  // Use A–Z, a–z, 0–9, '-', '_', length=8
  final id2 = nanoid.urlSafe(length: 8);

  // Removes O, I, l, 0, 1
  final id3 = nanoid.urlSafeHumanFriendly();

  // Removes O, I, l, 0, 1, length=12
  final id4 = nanoid.urlSafeHumanFriendly(length: 12);

  // Use A, B, C, 1, 2, 3, length=10
  const customChars = 'ABC123';
  final id5 = nanoid.custom(length: 10, charSet: customChars);

  print(id1); // e.g. Axs0km54bhQzL9_YW1D0p
  print(id2); // e.g. Zk3_Pq1A
  print(id3); // e.g. fG5kH3MnPqR2
  print(id4); // e.g. jK7hV8vT3bN5
  print(id5); // e.g. A1B2C3A1B2
}
