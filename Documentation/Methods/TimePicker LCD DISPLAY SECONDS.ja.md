# TimePicker LCD DISPLAY SECONDS

> TimePicker LCD DISPLAY SECONDS ( objectName ; seconds )

| 引数 | 型 |     | 説明 |
| --- | --- | --- | --- |
| objectName | テキスト | → | サブフォームオブジェクト名 |
| seconds | ブール | → | True = 秒数を表示、 False = 非表示 |

## 説明

**TimePicker LCD DISPLAY SECONDS** コマンドは、`objectName` で指定したサブフォームオブジェクトの、秒数表示の表示・非表示を設定します。(ただしデジタル時計に限る)

デフォルトでは、秒数は表示されています。`seconds` 引数に **False** を渡す事によって非表示にすることができます。
