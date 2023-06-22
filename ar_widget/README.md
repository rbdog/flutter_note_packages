![Header](https://github.com/rbdog/flutter_note_packages/blob/main/ar_widget/static/ar-widget-header.png?raw=true)

## 🚀Getting Started

# iOS

- `/ios/Runner/Info.plist`

```Info.plist
<plist ...>
<dict>
  ...
  <!-- ADD THIS -->
	<key>NSCameraUsageDescription</key>
	<string>For AR</string>
</dict>
</plist>
```

# Android

- Not yet supported.

<br>
<br>
<br>

## 🗒Usage

# ARWidget

- main.dart

```/lib/main.dart

import 'package:flutter/material.dart';
import 'package:ar_widget/ar_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        //
        // --- use ARWidget ---
        //
        body: ARWidget(
          canvasWidth: 400,
          canvasHeight: 600,
          child: Container(color: Colors.orange),
        ),
      ),
    );
  }
}

```
