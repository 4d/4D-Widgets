# TimePicker SET LABEL PM

> TimePicker SET LABEL PM ( objectName ; label )

| 引数 | 型 || 説明 |
| --- | --- | --- | --- |
| objectName | テキスト | → | サブフォームオブジェクト名 |
| label | テキスト | → | PMに使用するラベル |

## 説明

`TimePicker SET LABEL PM`コマンドを使用して、AM/PMフォーマットで表示されるTimePickerオブジェクトの"PM"ラベルを変更できます。コマンドは`objectName`で指定されたオブジェクトに適用されます。デフォルトでシステムのam/pmラベルが使用されます。

## 例題  

PMのとき、システムラベルの代わりにデフォルトで"in the evening"を使用する:

```4d
 TimePicker SET LABEL PM("clock";"in the evening")
```

## 参照

[TimePicker SET DEFAULT LABEL PM](TimePicker%20SET%20DEFAULT%20LABEL%20PM.ja.md)  
[TimePicker SET LABEL AM](TimePicker%20SET%20LABEL%20AM.ja.md)
