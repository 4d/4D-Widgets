# DatePicker SET DAYS OFF

> DatePicker SET DAYS OFF ( objectName {; dayType ; ptrDaysOffArray} )

| 引数 | 型 | 説明 |
| --------- | -------- | ----------- |
| objectName | テキスト | サブフォームオブジェクト名 |
| dayType | 倍長整数 | 休日タイプ |
| ptrDaysOffArray | ポインター | 休日の日付またはブールタイプ配列へのポインタ |

## 説明

`DatePicker SET DAYS OFF`コマンドを使用してDatePickerカレンダに表示する休日を設定できます。これらの日付はボールドおよびイタリックで表示され、ユーザは依然選択が可能です。

`objectName`引数では、コマンドを適用するサブフォームのインスタンスを指定します。この引数にはカレントフォーム中に表示されるサブフォームの名前を渡さなければなりません。

このコマンドでは毎週や毎年の休日や、特別な休日を設定できます。`dayType`引数を使用して休日タイプを指定します: 

* 0 = 毎週の休日 (デフォルトで土曜と日曜)
* 1 = 毎年の休日 (1月1日など)
* 2 = 特別な休日でその年のみに設定

配列を作成して、`ptrDaysOffArray`引数にその配列へのポインタを渡すことで、休日を設定します。配列のタイプは`dayType`に渡す値により異なります:

* `dayType`に0 (毎週の休日) を渡した場合、`ptrDaysOffArray`には7要素のブール配列へのポインタを渡します。Trueはその曜日が休日であることを示します。
* `dayType`に1 (毎年の休日) または2 (特別な休日) を渡した場合、`ptrDaysOffArray`には日付配列へのポインタを渡します。この配列では、それぞれの要素に休日を示す有効な日付が格納されていなければなりません。日付ははシステム言語に基づくデフォルトフォーマットで表現されなければなりません。1 (毎年の休日) を`dayType`に渡した場合、年は無視されます。有効な日付であればどんな値でも使用できます。

### 例題 1

デフォルトの土曜日と日曜日に代えて金曜日を毎週の休みに設定する:

```4d
ARRAY BOOLEAN($arrbDaysOff;7)
  //デフォルトですべてのブール配列要素はFalseです。なので初期化コードを追加する必要はありません。
$arrbDaysOff{Friday}:=True
DatePicker SET DAYS OFF("mycalendar";0;->$arrbDaysOff)
```

![休日設定例](images/pict308188.en.png)

### 例題 2

特別な休日を設定:

```4d
ARRAY DATE($arrdUniqueDays;0)
  //年も設定される
APPEND TO ARRAY($arrdUniqueDays;!02/15/2008!)
APPEND TO ARRAY($arrdUniqueDays;!02/12/2009!)
APPEND TO ARRAY($arrdUniqueDays;!02/17/2010!)
DatePicker SET DAYS OFF(1;->$arrdUniqueDays)
```

## 参照

[DatePicker SET DEFAULT DAYS OFF](DatePicker%20SET%20DEFAULT%20DAYS%20OFF.ja.md)
[DatePicker SET WEEK FIRST DAY](DatePicker%20SET%20WEEK%20FIRST%20DAY.ja.md)
