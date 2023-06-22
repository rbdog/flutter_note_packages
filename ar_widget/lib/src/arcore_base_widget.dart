import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:ar_widget/src/arcore_controller.dart';

class ArcoreBaseWidget extends StatefulWidget {
  const ArcoreBaseWidget({
    super.key,
    required this.onCreated,
  });

  final void Function(ArcoreController controller) onCreated;

  @override
  ArcoreBaseWidgetState createState() => ArcoreBaseWidgetState();
}

class ArcoreBaseWidgetState extends State<ArcoreBaseWidget> {
  PermissionStatus _camPermission = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();
    requestCameraPermission();
  }

  requestCameraPermission() async {
    final camPermission = await Permission.camera.request();
    setState(() {
      _camPermission = camPermission;
    });
  }

  @override
  build(BuildContext context) {
    if (_camPermission != PermissionStatus.granted) {
      return const Center(child: Text('NO PERMISSION'));
    }

    return Expanded(
      child: AndroidView(
        viewType: 'ar_widget_plugin',
        layoutDirection: TextDirection.ltr,
        creationParams: const {},
        creationParamsCodec: const StandardMessageCodec(),
        onPlatformViewCreated: (int id) {
          debugPrint("Android platform view created!");
          final controller = ArcoreController();
          widget.onCreated(controller);
        },
      ),
    );
  }
}
