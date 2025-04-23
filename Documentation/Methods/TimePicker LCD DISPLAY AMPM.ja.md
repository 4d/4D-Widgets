# TimePicker LCD DISPLAY AMPM

> TimePicker LCD DISPLAY AMPM ( objectName ; amPm )

| 引数 | 型 |     | 説明 |
| --- | --- | --- | --- |
| objectName | テキスト | → | サブフォームオブジェクト名 |
| amPm | ブール | → | True = AM/PMを表示、 False = 非表示 |

## 説明

**TimePicker LCD DISPLAY AMPM** コマンドは、`objectName` で指定したサブフォームオブジェクトの、AM/PM表示を表示・非表示を設定します(デジタル時計に限る)。

この文字は時計が12時間モードのときに午前か午後を区別するために表示されています。([TimePicker LCD SET MODE](TimePicker%20LCD%20SET%20MODE.ja.md) を参照して下さい。)

デフォルトでは、この文字は表示されています。`amPm` 引数に **False** を渡すことによって非表示にすることができます。

### 例題

AM/PM の文字表示を非表示にします:

```4d
 TimePicker LCD DISPLAY AMPM("Subform1";False)
```

![](../images/pict1239891.fr.png)

## 参照

[TimePicker LCD SET MODE](TimePicker%20LCD%20SET%20MODE.ja.md)
