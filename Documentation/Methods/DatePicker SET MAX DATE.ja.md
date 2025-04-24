# DatePicker SET MAX DATE

> DatePicker SET MAX DATE ( objectName ; maxDate )

| 引数 | 型 | 説明 |
| --------- | -------- | ----------- |
| objectName | テキスト | サブフォームオブジェクト名 |
| maxDate | 日付 | 入力可能な日付の上限 |

## 説明

`DatePicker SET MAX DATE`コマンドを使用して、DatePickerカレンダに入力可能な日付の上限を設定できます (上限より後の日付はカレンダ中で灰色に表示されます)。

`objectName`引数では、コマンドを適用するサブフォームのインスタンスを指定します。この引数にはカレントフォーム中に表示されるサブフォームの名前を渡さなければなりません。

`maxDate`はシステム言語に基づくデフォルト入力フォーマットで表現されなければなりません。空の日付 (!00/00/00!) を渡すと、今日の日付より後の日付はすべて入力可能になります。

日付の上限が下限より小さい場合([DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.ja.md)参照)、日付の入力はできなくなります。

### 例題

オブジェクト名"ReturnDate"で、2009/12/31より後を無効にする:

```4d
DatePicker SET MAX DATE("ReturnDate";!2009/12/31!)
```

## 参照

[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.ja.md)
[DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.ja.md)
