# DatePicker RESET DEFAULT VALUES

> DatePicker RESET DEFAULT VALUES 

このコマンドは引数を必要としません

## 説明

`DatePicker RESET DEFAULT VALUES`コマンドはDatePickerコンポーネントのデフォルト値を初期値にリセットします。このコンポーネントメソッド実行後は以下のように設定されます:    

* 最小および最大入力可能日付は00/00/00 (制限なし)
* 最初の曜日は2 (月曜)
* 毎週の休日は土曜と日曜
* 毎年の休日と特別な休日はなし

このパラメタは後で作成されるカレンダに適用され、既存のカレンダには影響を与えない点に留意してください。既存のカレンダに適用したい場合は[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.ja.md)コマンドを使用します。

## 参照

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.ja.md)
