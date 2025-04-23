# TimePicker LCD SET MODE

> TimePicker LCD SET MODE ( objectName ; mode )

| 引数 | 型 |     | 説明 |
| --- | --- | --- | --- |
| objectName | テキスト | → | サブフォームオブジェクト名 |
| mode | 倍長整数 | → | 12 = 時間を12時間モードで表示、24 = 時間を24時間モードで表示 |

## 説明

**TimePicker LCD SET MODE** コマンドは、`objectName` で指定したサブフォームオブジェクトの、12時間モードまたは24時間モードの表示モードを設定します。(ただしデジタル時計に限る)

デフォルトでは、オブジェクトは12時間モードで表示されています。`mode` 引数に24を渡す事によって24時間モードに切り替えることが出来ます。この場合、一般的に言ってAM/PM表示を同時に非表示すると良いです([TimePicker LCD DISPLAY AMPM](TimePicker%20LCD%20DISPLAY%20AMPM.ja.md) コマンドを参照して下さい)。

### 例題

24時間表示モードへと切り替えて、同時にAM/PM表示を非表示にする場合:

```4d
 TimePicker LCD SET MODE("Subform1";24)
 TimePicker LCD DISPLAY AMPM("Subform1";False)
```

![](../images/pict1239968.fr.png)

## 参照

[TimePicker LCD DISPLAY AMPM](TimePicker%20LCD%20DISPLAY%20AMPM.ja.md)
