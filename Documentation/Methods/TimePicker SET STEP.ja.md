# TimePicker SET STEP

> TimePicker SET STEP ( objectName ; step )

| 引数 | 型 | 説明 |
| --------- | -------- | ----------- |
| objectName | テキスト | サブフォームオブジェクト名 |
| step | 時間 | 2つの時間値の間隔 |

## 説明

`TimePicker SET STEP`コマンドを使用して、 `objectName`で指定したオブジェクトで利用される時間と時間の間のステップを設定できます。このパラメタはポップアップメニューとして表示されるTimePickerにのみ適用されます。

`step`値は1分から1時間の間で、60分を割り切れる整数値のみを指定できます。 つまり実際1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30 そして 60が利用可能です。他の値は自動でこの原則に沿うよう丸められます。

## 例題

"time1"という名前のポップアップメニュー形式のTimePickerを設定します。入力可能な時間は8:30から16:30で、間隔は10分です:

```4d
TimePicker SET MIN TIME("time1";?08:30:00?)
TimePicker SET MAX TIME("time1";?16:30:00?)
TimePicker SET STEP("time1";?00:10:00?)
```

## 参照
[TimePicker SET DEFAULT STEP](TimePicker%20SET%20DEFAULT%20STEP.ja.md)
