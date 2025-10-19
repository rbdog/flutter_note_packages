# 🐣 Nano ID

[🌐 English](#🌐English) | [🇯🇵 日本語](#🇯🇵日本語) | [🇨🇳 中文](#🇨🇳中文)


```
import 'package:nanoid_plus/nanoid_plus.dart';


const nanoid = Nanoid();
final id = nanoid.urlSafe(length: 8);

// id: AXBYCZ01

```


---
## 🌐English

- ✅ **Lightweight**: only a few KB.
- ✅ **Secure**: uses `Random.secure()` to generate unpredictable randomness.
- ✅ **Simple**: just a few lines of code.
- ✅ **Short**: shorter than UUID (36 characters).
- ✅ **Safe**: no percent-encoding needed.
- ✅ **Customizable**: characters for URLs, human-friendly characters, and custom characters.

### Example Use Cases

- **UserID**: for example, an 8-character Nano ID is enough for each of 100,000 users.

| User Scale   | ID Length | Collision Probability |
|:------------:|:---------:|:-------------------------------:|
| 100,000      |     8     | 0.002%                          |
| 1,000,000    |     9     | 0.003%                          |
| 10,000,000   |    10     | 0.002%                          |


#### Other Use Cases

- ***Ticket number***
- ***Temporary password***
- ***Short URL***

<br />
<br />
<br />

### ========================

<br />
<br />
<br />


## 🇯🇵日本語

- ✅ **軽量**: わずか数キロバイト
- ✅ **安全**: `Random.secure()` で予測不可能な乱数を生成
- ✅ **シンプル**: 数行のコードでIDを生成
- ✅ **短い**: UUID（36文字）より短い
- ✅ **安全（URL）**: パーセントエンコーディング不要
- ✅ **カスタマイズ可能**: URL文字列、人間が読みやすい文字列、カスタム文字セット...等

### 使用例

- **ユーザーID**: 例えば, 8文字の Nano ID は 10 万人規模のサービスにおいても十分に衝突しにくいユーザーIDとして利用できます.

| ユーザー規模 | ID 長さ | 重複確率 |
|:------------:|:-------:|:----------------:|
|  10 万人     |    8    | 0.002%        |
| 100 万人     |    9    | 0.003%        |
| 1,000 万人   |   10    | 0.002%        |


#### その他の使用例

- ***チケット番号***
- ***一時パスワード***
- ***短縮URL***

<br />
<br />
<br />

### ========================

<br />
<br />
<br />

## 🇨🇳中文

- ✅ **轻量**: 只有几 KB。
- ✅ **安全**: 使用 `Random.secure()` 生成不可预测的随机数。
- ✅ **简洁**: 仅需几行代码。
- ✅ **短小**: 比 UUID（36 字符）更短。
- ✅ **安全（URL）**: 无需百分号编码。
- ✅ **可定制**: 用于 URL 的字符、人性化字符和自定义字符。

### 示例用例

- **用户 ID**: 例如，8 字符的 Nano ID 足以为 100,000 名用户中的每一位提供。

| 用户规模     | ID 长度 | 冲突概率 |
|:------------:|:-------:|:----------------:|
| 100,000      |    8    | 0.002%        |
| 1,000,000    |    9    | 0.003%        |
| 10,000,000   |   10    | 0.002%        |

#### 其他

- ***票号***
- ***临时密码***
- ***短链接***
