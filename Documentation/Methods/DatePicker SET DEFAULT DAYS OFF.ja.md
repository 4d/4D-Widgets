# DatePicker SET DEFAULT DAYS OFF

> DatePicker SET DEFAULT DAYS OFF ( dayType ; ptrDaysOffArray )

| 引数 | 型 | 説明 |
| --------- | -------- | ----------- |
| dayType | 倍長整数 | 休日タイプ |
| ptrDaysOffArray | ポインター | 休日の日付またはブール配列へのポインタ |

## 説明

`DatePicker SET DEFAULT DAYS OFF`コマンドを使用してDatePickerコンポーネントのすべてのカレンダーに現れる休日を設定できます。これらの日付は太字および斜体で表示され、ユー ザーは選択が可能です。

この設定は、メソッド呼び出し後に表示されるカレンダーに対し有効で、すでに表示さたカレンダーには適用されません。既存のカレンダーに適用させたい場合は[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.ja.md)コマンドを使用します。

このコンポーネントメソッドでは毎週および毎年、さらには特別な休日も設定できます。`dayType`引数を使用して休日のタイプを指定します:

* 0 = 毎週の休み (デフォルトで土日)
* 1 = 毎年の休み (1月1日など)
* 2 = その年だけに設定する特別な休日

配列を作成して`ptrDaysOffArray`にポインタ渡しすることで休日を設定します。配列の型は`dayType`に渡す値に基づきます:

* `dayType`に0を渡す (毎週の休み) 場合、7要素を持つブール配列へのポインタを渡さなければなりません。Trueを渡された要素は毎週の休みに設定されます。
* `dayType`に1または2を渡す (毎年あるいは特別な休日) 場合、`ptrDaysOffArray`には日付配列へのポインタを渡します。この配列にはそれぞれの要素に休日を示す有効な日付が格納されていなければなりません。日付はシステムランゲージのデフォルトフォーマットで表現されていなければなりません。`dayType`に1を渡した場合、年は無視されます。有効な日付であれば、どんな値でも渡すことができます。

### 例題

毎年の休みを設定する (USAの例):

```4d
ARRAY DATE($arrdRepeatedDays;0)
  //年は無視されるので、 仮に2000を使用
APPEND TO ARRAY($arrdRepeatedDays;!2000/01/01!)
APPEND TO ARRAY($arrdRepeatedDays;!2000/02/02!)
APPEND TO ARRAY($arrdRepeatedDays;!2000/02/14!)
APPEND TO ARRAY($arrdRepeatedDays;!2000/03/17!)
APPEND TO ARRAY($arrdRepeatedDays;!2000/04/01!)
APPEND TO ARRAY($arrdRepeatedDays;!2000/10/31!)
APPEND TO ARRAY($arrdRepeatedDays;!2000/11/11!)
APPEND TO ARRAY($arrdRepeatedDays;!2000/12/25!)
DatePicker SET DEFAULT DAYS OFF(1;->$arrdRepeatedDays)
```

## 参照

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.ja.md)
[DatePicker SET DAYS OFF](DatePicker%20SET%20DAYS%20OFF.ja.md)
