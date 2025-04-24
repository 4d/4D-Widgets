# DatePicker SET WEEK FIRST DAY

> DatePicker SET WEEK FIRST DAY ( objectName ; dayNum )

| 引数 | 型 | 説明 |
| --------- | -------- | ----------- |
| objectName | テキスト | サブフォームオブジェクト名 |
| dayNum | 倍長整数 | 先頭に表示する曜日の番号 |

## 説明

`DatePicker SET WEEK FIRST DAY`コマンドを使用してDatePickerカレンダの最左に表示する曜日を指定できます。デフォルトで最初の曜日は月曜日です。

`objectName`引数では、コマンドを適用するサブフォームのインスタンスを指定します。この引数にはカレントフォーム中に表示されるサブフォームの名前を渡さなければなりません。

`dayNum`引数には`OBJECT SET TITLE`テーマの4D定数を渡します。

| 定数 | 型 | 値 |
| --------- | -------- | ----------- |
| Sunday | 倍長整数 | 1 |
| Monday | 倍長整数 | 2 |
| Tuesday | 倍長整数 | 3 |
| Wednesday | 倍長整数 | 4 |
| Thursday | 倍長整数 | 5 |
| Friday | 倍長整数 | 6 |
| Saturday | 倍長整数 | 7 |

### 例題 1

日曜日からの表示に設定する:

```4d
DatePicker SET WEEK FIRST DAY("mycalendar";Sunday)
```

### 例題 2

木曜日からの表示設定する:

```4d
DatePicker SET WEEK FIRST DAY("mycalendar";Thursday)
```

## 参照

[DatePicker SET DAYS OFF](DatePicker%20SET%20DAYS%20OFF.ja.md)
[DatePicker SET DEFAULT 1ST DAY](DatePicker%20SET%20DEFAULT%201ST%20DAY.ja.md)
