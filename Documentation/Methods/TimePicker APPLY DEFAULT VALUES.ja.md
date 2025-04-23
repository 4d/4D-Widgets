# TimePicker APPLY DEFAULT VALUES

> TimePicker APPLY DEFAULT VALUES ( objectName )

| Parameter | Type |     | Description |
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

Documentation/Methods/TimePicker APPLY DEFAULT VALUES.ja.md

@@ -4,26 +4,26 @@

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | → | Name of subform object |

## Description

The `TimePicker APPLY DEFAULT VALUES` command is used to reset all the TimePicker parameters to their current default values for the `objectName` subform object.

These default values may be the factory settings but may also have been modified via the SET DEFAULT commands of the component.  
The action of this command is immediate: the default values of `objectName` are instantly modified. Note that the bound variable of the object could also be modified in order to take the new values into account. For example, if the new default values set the minimum time to 07:00:00 and the value of the variable bound with `objectName` was 06:00:00, its value is automatically returned to 07:00:00.

The TimePicker parameters include:

* minimum or maximum enterable times,
* the AM and PM labels,
* the steps in minutes.

## See also

[TimePicker RESET DEFAULT VALUES](TimePicker%20RESET%20DEFAULT%20VALUES.md)  
[TimePicker SET DEFAULT LABEL AM](TimePicker%20SET%20DEFAULT%20LABEL%20AM.md)  
[TimePicker SET DEFAULT LABEL PM](TimePicker%20SET%20DEFAULT%20LABEL%20PM.md)  
[TimePicker SET DEFAULT MAX TIME](TimePicker%20SET%20DEFAULT%20MAX%20TIME.md)  
[TimePicker SET DEFAULT MIN TIME](TimePicker%20SET%20DEFAULT%20MIN%20TIME.md)  
[TimePicker SET DEFAULT STEP](TimePicker%20SET%20DEFAULT%20STEP.md)
