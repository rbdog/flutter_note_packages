class DeviceModel {
  const DeviceModel({
    required this.id,
    required this.screen,
    required this.os,
    required this.label,
    required this.imageUri,
  });

  final String id;
  final Screen screen;
  final OS os;
  final Label label;
  final String imageUri;
}

class Screen {
  const Screen({
    required this.position,
    required this.width,
    required this.height,
    required this.cornerRadius,
    required this.pixelRatio,
  });

  final RatioPosition position;
  final double width;
  final double height;
  final double cornerRadius;
  final double pixelRatio;
}

class RatioPosition {
  const RatioPosition({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  });

  final double left;
  final double top;
  final double right;
  final double bottom;
}

class OS {
  const OS({
    required this.portRaitSafeAreaInset,
    required this.landscapeSafeAreaInset,
    required this.keyboardHeight,
  });

  final Inset portRaitSafeAreaInset;
  final Inset landscapeSafeAreaInset;
  final double keyboardHeight;
}

class Inset {
  const Inset({
    required this.left,
    required this.top,
    required this.right,
    required this.bottom,
  });

  final double left;
  final double top;
  final double right;
  final double bottom;
}

class Label {
  const Label({
    required this.name,
    required this.releasedYear,
    required this.platform,
  });

  final String name;
  final int releasedYear;
  final Platform platform;
}

enum Platform {
  ios,
  android,
}
