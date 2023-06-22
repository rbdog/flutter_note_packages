#### 動作確認は最新のXcode,Flutterのみで行いました。バージョンにご注意ください。

<br/>

# 1. 新しいアプリを作成

- ターミナルで実行

```
$ flutter create -e --platforms=ios my_ar_widget
$ cd my_ar_widget
$ open ./
```

<br/>
<br/>
<br/>

# 2. パッケージを追加

- `/lib/pubspec.yaml` を開く

```
...
dependencies:
  ...
  # これを追加
  ar_widget:
```

- ターミナルで実行

```
$ flutter pub get
```

<br/>
<br/>
<br/>

# 3. アプリを編集

- `/lib/main.dart` を開く
- [こちらからコピペしてファイル全体を上書き](https://pub.dev/packages/ar_widget/example)

<br/>
<br/>
<br/>

# 4. カメラ許可設定

- `/ios/Runner/Info.plist` を開く
- Xcodeで開くとGUIになるため, 右クリックからVSCodeなどで開くのがオススメ

```
<plist ...>
<dict>
  ...
  <!-- これを追加 -->
  <key>NSCameraUsageDescription</key>
  <string>For AR</string>
```

<br/>
<br/>
<br/>

# 5. アプリに署名

- `/ios/Runner.xcworkspace` を開く

- `Runner` > `Signing & Capabilities` > `Team` の項目に開発チームを設定

<img src='https://github.com/rbdog/flutter_note_packages/blob/main/ar_widget/docs_jp_ios/img1.png?raw=true' width='100%'>

- まだ開発チームを作成してない場合は新しく作成

<br/>
<br/>
<br/>

# 6. 実機にインストール

- カメラを使うためシミュレータでは実行できません
- Xcode の画面上部から実機を選択 > 実行ボタン

<img src='https://github.com/rbdog/flutter_note_packages/blob/main/ar_widget/docs_jp_ios/img2.png?raw=true' width='100%'>

- デバイス ID が分かるときはターミナルで実行しても OK

```
flutter run --release -d <デバイス ID>
```

<br/>
<br/>
<br/>

# 7. 開発者を信頼

- `信頼されていないデベロッパ` のエラーが出たときに実行
- 実機で `設定アプリ` を開く
- `一般` > `デバイス管理` > (アプリ名) > (開発者)を信頼

<br/>
<br/>
<br/>
