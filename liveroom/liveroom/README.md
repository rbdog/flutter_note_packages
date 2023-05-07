![Header](https://github.com/rbdog/flutter_note_packages/blob/main/liveroom/static/img/liveroom-header.png?raw=true)

https://pub.dev/packages/liveroom

### LiveRoom, Super-Simple WebSocket Room kit

## 1. Server

1. setup **Deno** ([Official Manual](https://deno.land/manual/getting_started/installation))


```
### Mac
$ curl -fsSL https://deno.land/x/install/install.sh | sh
### Windows powershell
$ irm https://deno.land/install.ps1 | iex
```

2. run quick server

```
$ deno run --allow-net https://deno.land/x/liveroom/quick.ts
```

<br />

## 2. Flutter App

```main.dart
import 'package:flutter/material.dart';
import 'package:liveroom/liveroom.dart';

void main() {
  runApp(LiveroomQuickApp());
}
```

<br />

simple interfaces
- `final liveroom = Liveroom();`
- liveroom.create(roomId: '0001');
- liveroom.join(roomId: '0001');
- liveroom.send(message: 'Hello');
- liveroom.receive((userId, message) {});
- liveroom.exit();


🎉 any issues, requests, contributions are welcomed!
