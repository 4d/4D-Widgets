# TimePicker RESET DEFAULT VALUES

> TimePicker RESET DEFAULT VALUES

このコマンドは引数を必要としません

## 説明

**TimePicker RESET DEFAULT VALUES** コマンドはTimePickerコンポーネントのパラメタを初期値にリセットします。このコマンド実行後は以下のように設定されます:

* 入力可能な時間の下限は08:00:00
* 入力可能な時間の上限は20:00:00
* AMとPMラベルはシステムラベル
* 分単位のステップは 00:15:00

この設定は後で作成されるオブジェクトに適用され、既存のオブジェクトには影響を与えない点に留意してください。既存のオブジェクトに適用したい場合は[TimePicker APPLY DEFAULT VALUES](TimePicker%20APPLY%20DEFAULT%20VALUES.ja.md)コマンドを使用します。

## 参照

[TimePicker APPLY DEFAULT VALUES](TimePicker%20APPLY%20DEFAULT%20VALUES.ja.md)
