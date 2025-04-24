# DatePicker SET DEFAULT MIN DATE

> DatePicker SET DEFAULT MIN DATE ( dateMin )

| 引数 | 型 | 説明 |
| --------- | -------- | ----------- |
| dateMin | 日付 | 入力可能な日付の下限 |

## 説明

`DatePicker SET DEFAULT MIN DATE`コマンドを使用して、DatePickerコンポーネントのすべてのカレンダの、入力可能な日付の下限を設定できます。

このパラメタは後で作成されるカレンダに適用され、既存のカレンダには影響を与えない点に留意してください。既存のカレンダに適用したい場合は[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.ja.md)コマンドを使用します。

### 例題

日付の下限を2000年1月1日にする:

```4d
DatePicker SET DEFAULT MIN DATE(!2000/01/01!)
```

## 参照

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.ja.md)
[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.ja.md)
[DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.ja.md)
