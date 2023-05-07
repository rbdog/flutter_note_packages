
# Live Room

- Simple WebSocket Room Server
- for **Flutter App** (and others)

![Header](https://github.com/rbdog/flutter_note_packages/blob/main/liveroom/static/img/liveroom-header.png?raw=true)

## Quick Start

localhost

```shell
$ deno run --allow-net https://deno.land/x/liveroom/quick.ts
```

## Flutter (client app)


$ flutter pub add liveroom

```
// main.dart
import 'package:flutter/material.dart';
import 'package:liveroom/liveroom.dart';

void main() {
  runApp(LiveroomQuickApp());
}
```

package site
https://pub.dev/packages/liveroom
