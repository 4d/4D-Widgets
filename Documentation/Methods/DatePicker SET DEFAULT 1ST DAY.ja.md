# DatePicker SET DEFAULT 1ST DAY

> DatePicker SET DEFAULT 1ST DAY ( dayNum )

| 引数 | 型 | 説明 |
| --------- | -------- | ----------- |
| dayNum | 倍長整数 | 最初の曜日 |

## 説明

**DatePicker SET DEFAULT 1ST DAY**コマンドを使用して、すべてのDatePickerカレンダで、デフォルトで最左に表示される曜日を設定できます。 

`dayNum`引数にはOBJECT SET TITLEテーマの以下の4D定数を渡します:

| 定数 | 型 | 値 |
| --- | --- | --- |
| Sunday | 倍長整数 | 1 |
| Monday | 倍長整数 | 2 |
| Tuesday | 倍長整数 | 3 |
| Wednesday | 倍長整数 | 4 |
| Thursday | 倍長整数 | 5 |
| Friday | 倍長整数 | 6 |
| Saturday | 倍長整数 | 7 |

このパラメタは後で作成されるカレンダに適用され、既存のカレンダには影響を与えない点に留意してください。既存のカレンダに適用したい場合は[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.ja.md)コマンドを使用します。

## 参照

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.ja.md)
[DatePicker SET WEEK FIRST DAY](DatePicker%20SET%20WEEK%20FIRST%20DAY.ja.md)
