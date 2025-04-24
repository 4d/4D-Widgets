# DatePicker SET MIN DATE

> DatePicker SET MIN DATE ( objectName ; dateMin )

| 引数 | 型 | 説明 |
| --------- | -------- | ----------- |
| objectName | テキスト | サブフォームオブジェクト名 |
| dateMin | 日付 | 入力可能な日付の下限 |

## 説明

`DatePicker SET MIN DATE`コマンドを使用して、DatePickerカレンダに入力可能な日付の下限を設定できます (下限より過去の日付はカレンダ中で灰色に表示されます)。

`objectName`引数では、コマンドを適用するサブフォームのインスタンスを指定します。この引数にはカレントフォーム中に表示されるサブフォームの名前を渡さなければなりません。

`minDate`はシステム言語に基づくデフォルト入力フォーマットで表現されなければなりません。空の日付 (!00/00/00!) を渡すと、今日の日付より前の日付はすべて入力可能になります。

日付の下限が上限より大きい場合 ([DatePicker SET MAX DATE](DatePicker%20SET%20MAX%20DATE.ja.md)参照)、日付の入力はできなくなります。

### 例題

フォームの2つのサブフォーム"DP1"と"DP2"に2つのDatePickerカレンダが置かれています。

```4d
  //一番目のカレンダで2009/01/01以前を無効にする
DatePicker SET MIN DATE("DP1";!2009/01/01!)
  //二番目のカレンダで2009/03/01以前を無効にする
DatePicker SET MIN DATE("DP2";!2009/03/01!)
```

## 参照

[DatePicker SET DEFAULT MIN DATE](DatePicker%20SET%20DEFAULT%20MIN%20DATE.ja.md)
[DatePicker SET MAX DATE](DatePicker%20SET%20MAX%20DATE.ja.md)
