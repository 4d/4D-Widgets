# TimePicker SET LABEL AM

> TimePicker SET LABEL AM ( objectName ; label )

| 引数 | 型 || 説明 |
| --- | --- | --- | --- |
| objectName | テキスト | → | サブフォームオブジェクト名 |
| label | テキスト | → | AMに使用するラベル |

## 説明

`TimePicker SET LABEL AM`コマンドを使用して、AM/PMフォーマットで表示されるTimePickerオブジェクトの"AM"ラベルを変更できます。コマンドは`objectName`で指定されたオブジェクトに適用されます。デフォルトでシステムのam/pmラベルが使用されます。

## 例題

AMのとき、システムラベルの代わりにデフォルトで"in the morning"を使用する:

```4d
 TimePicker SET LABEL AM("clock";"in the morning")
```

## 参照

[TimePicker SET DEFAULT LABEL AM](TimePicker%20SET%20DEFAULT%20LABEL%20AM.ja.md)  
[TimePicker SET LABEL PM](TimePicker%20SET%20LABEL%20PM.ja.md)
