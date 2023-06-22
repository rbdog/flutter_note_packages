# ar_widget_example

Demonstrates how to use the ar_widget plugin.

## Getting Started

- iOS
  - `/ios/Runner/Info.plist`

```Info.plist
<plist ...>
<dict>
  ...
  <!-- ADD THIS -->
  <key>NSCameraUsageDescription</key>
  <string>AR Widget Test</string>
</dict>
</plist>
```

- Android
  - `/android/app/build.gradle`

```build.gradle
android {
  ...
  defaultConfig {
    ...
    // CHANGE TO THIS
    minSdkVersion 24
  }
}
```

- Android
  - `/android/app/src/main/AndroidManifest.xml`

```
<manifest ...>
  ...
  <!-- ADD THIS -->
  <uses-permission android:name="android.permission.CAMERA" />
</manifest>
```
