# TimePicker APPLY DEFAULT VALUES

> TimePicker APPLY DEFAULT VALUES ( objectName )

| 引数 | 型 |     | 説明 |
| --- | --- | --- | --- |
| objectName | テキスト | → | サブフォームオブジェクト名 |

## 説明

`TimePicker APPLY DEFAULT VALUES`コマンドを使用して、`objectName`サブフォームオブジェクトのすべてのTimePickerパラメタを現在のデフォルト値に再設定できます。

これらのデフォルト値は初期値またはコンポーネントのSET DEFAULTコマンドで設定された値です。  
このコマンドは即座に効果を及ぼします。`objectName`のデフォルト値は即座に更新されます。オブジェクトに割り当てられた変数は、新しい値を有効にするために更新されるかもしれないことに留意してください。例えば新しい最小時間のデフォルト値が07:00:00に設定され、`objectName`に割り当てられた変数が06:00:00のとき、その値は自動で07:00:00に変更されます。

TimePickerパラメタには以下があります:

* 入力可能時間の下限と上限
* AMおよびPMラベル
* 分単位のステップ

## 参照

[TimePicker RESET DEFAULT VALUES](TimePicker%20RESET%20DEFAULT%20VALUES.ja.md)  
[TimePicker SET DEFAULT LABEL AM](TimePicker%20SET%20DEFAULT%20LABEL%20AM.ja.md)  
[TimePicker SET DEFAULT LABEL PM](TimePicker%20SET%20DEFAULT%20LABEL%20PM.ja.md)  
[TimePicker SET DEFAULT MAX TIME](TimePicker%20SET%20DEFAULT%20MAX%20TIME.ja.md)  
[TimePicker SET DEFAULT MIN TIME](TimePicker%20SET%20DEFAULT%20MIN%20TIME.ja.md)  
[TimePicker SET DEFAULT STEP](TimePicker%20SET%20DEFAULT%20STEP.ja.md)
