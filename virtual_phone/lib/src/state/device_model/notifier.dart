import 'package:flutter_riverpod/flutter_riverpod.dart';

class DeviceModelIdNotifier extends Notifier<String> {
  DeviceModelIdNotifier({
    required this.initialModelId,
  });

  final String initialModelId;

  @override
  String build() {
    return initialModelId;
  }

  /// Select the current device.
  void setId(String id) {
    state = id;
  }
}
