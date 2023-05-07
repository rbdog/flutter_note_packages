![Header](https://github.com/rbdog/pixel_color_image/blob/main/resources/images/pixel-color-image-header.png?raw=true)

https://pub.dev/packages/pixel_color_image

<br>
<br>

## Usage

### 1. Widget

- image in assets folder

```
PixelColor.assetImage(
  path: 'images/xxx.png',
  onHover: onHover,
  onTap: onTap,
);
```

- image by URL

```
PixelColor.networkImage(
  url: 'https://example.com/xxx.png',
  onHover: onHover,
  onTap: onTap,
);
```

### 2. functions are called

```
/// While Hoverring
void onHover(int x, int y, Color color) async {
  debugPrint('Hover x: $x, y: $y, color: $color');
}

/// When tap
void onTap(int x, int y, Color color) async {
  debugPrint('Tap x: $x, y: $y, color: $color');
}
```

<br>
<br>
<br>

## Color-Preview Widget

![diagram](https://github.com/rbdog/pixel_color_image/blob/main/resources/images/pixel-color-preview.png?raw=true)

### 1. Define ref

```
final ref = PixelColorRef();
```

### 2. Connect widgets with ref

```
// Image
PixelColor.assetImage(
  ...
  ...
  ref: ref,
);

// Color Preview
PixelColorPreview(
  ref: ref,
);
```

<br>

🎉 any issues, requests, contributions are welcomed!

<br>
