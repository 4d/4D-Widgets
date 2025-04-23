# TimePicker DISPLAY SECOND HAND

> TimePicker DISPLAY SECOND HAND ( objectName ; secondHand )

| 引数 | 型 |     | 説明 |
| --- | --- | --- | --- |
| objectName | テキスト | → | サブフォームオブジェクト名 |
| secondHand | ブール | → | True (デフォルト) = 秒針を表示, False = 秒針を非表示 |

## 説明

**TimePicker DISPLAY SECOND HAND** コマンドは、`objectName` で指定したサブフォームオブジェクトの、秒針の表示・非表示を設定します(ただしclockウィジェットに限る)。

デフォルトでは、秒針は表示されています。非表示にするためには、このコマンドを呼び出して `secondHand` 引数に **False** を渡します。
