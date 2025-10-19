import 'dart:math';

@Deprecated('Use [Nanoid] instead.')
typedef NanoID = Nanoid;

/// Nano ID generator.
class Nanoid {
  const Nanoid();

  /// Generate an ID using the standard URL-safe Base64 charset.
  ///
  /// [length]: Number of characters in the generated ID (default is 21).
  /// [excludedCharSet]: Characters to exclude from the default charset.
  String urlSafe({int length = 21, String excludedCharSet = ''}) {
    return _generate(
      length: length,
      charSet: NanoIDCharset.urlSafe,
      excludedCharSet: excludedCharSet,
    );
  }

  /// Generate an ID using a human-friendly URL-safe charset.
  ///
  /// Removes confusing characters:
  ///   - Uppercase: 'O', 'I'
  ///   - Lowercase: 'l'
  ///   - Digits: '0', '1'
  /// [length]: Number of characters in the generated ID (default is 21).
  /// [excludedCharSet]: Characters to exclude from the default charset.
  String urlSafeHumanFriendly({int length = 21, String excludedCharSet = ''}) {
    return _generate(
      length: length,
      charSet: NanoIDCharset.urlSafeHumanFriendly,
      excludedCharSet: excludedCharSet,
    );
  }

  /// Generate an ID using a custom [charSet].
  ///
  /// [length]: Number of characters in the generated ID.
  /// [charSet]: String of characters from which to pick randomly.
  String custom({required int length, required String charSet}) {
    return _generate(length: length, charSet: charSet, excludedCharSet: '');
  }

  /// Core method to generate a random ID.
  ///
  /// Picks [length] characters randomly from [charSet] using
  /// a cryptographically secure random source.
  String _generate({
    required int length,
    required String charSet,
    required String excludedCharSet,
  }) {
    final effectiveCharSet = charSet
        .split('')
        .where((c) => !excludedCharSet.contains(c))
        .join();

    if (effectiveCharSet.isEmpty) {
      throw ArgumentError('Character set is empty after exclusions.');
    }

    final random = Random.secure();
    final setLength = effectiveCharSet.length;
    final buffer = StringBuffer();
    for (var i = 0; i < length; i++) {
      buffer.write(effectiveCharSet[random.nextInt(setLength)]);
    }
    return buffer.toString();
  }
}

/// Charset definitions for NanoID.
abstract class NanoIDCharset {
  /// Standard URL-safe Base64 charset (64 characters).
  /// Includes letters, digits, '-' and '_'.
  static const String urlSafe =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
      'abcdefghijklmnopqrstuvwxyz'
      '0123456789'
      '-_';

  /// Human-friendly URL-safe charset.
  /// Removes characters that can be confused with others:
  ///   - 'O' (uppercase o)
  ///   - 'I' (uppercase i)
  ///   - 'l' (lowercase L)
  ///   - '0' (zero)
  ///   - '1' (one)
  static const String urlSafeHumanFriendly =
      'ABCDEFGHJKMNPQRSTUVWXYZ' // excludes 'O', 'I'
      'abcdefghjkmnpqrstuvwxyz' // excludes 'l'
      '23456789' // excludes '0', '1'
      '-_';
}
