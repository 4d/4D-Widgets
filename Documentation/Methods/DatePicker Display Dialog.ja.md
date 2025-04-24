# DatePicker Display Dialog

> DatePicker Display Dialog {( left ; top {; defaultDate})} -> 戻り値

| 引数 | 型 | 説明 |
| --------- | -------- | ----------- |
| left | 倍長整数 | ウィンドウの左位置 |
| top | 倍長整数 | ウィンドウの上位置 |
| defaultDate | 日付 | ダイアログ中デフォルトで選択する日付 |
| 戻り値 | 日付 | ユーザが選択した日付 |

## 説明

**DatePicker Display Dialog** コマンドはDatePickerカレンダをポップアップウィンドウに表示します (ポップアップタイプのウィンドウはユーザがウィンドウの外をクリックするか、**Enter**または**Esc**キーが押されると自動で閉じられます)。

![DatePicker Dialog](images/pict307838.en.png)

2つのオプションの引数`left`と`top`を使用して、ウィンドウを開く左上の座標を指定できます。これら2つの引数はペアで渡さなければなりません。一つしか渡されない場合、それは無視されます。 これらの引数が省略されると、ウィンドウはクリックされた場所で開かれます。

第三引数 `defaultDate` に日付を渡すと、DatePickerダイアログが表示される際にその日付がデフォルトで選択されます。

**DatePicker Display Dialog** は、ユーザがDatePickerカレンダ内で選択した日付を返します。日付が選択されずにウィンドウが閉じられたとき、コマンドは空の日付 (!00/00/00!) を返します (たとえ`defaultDate`が指定されていた場合でも)。

### 例題

この例題はボタンがクリックされるとDatePickerカレンダーを表示します:

```4d
OBJECT GET COORDINATES(*;"MyCalendarButton";$x1;$y1;$x2;$y2)
$MyLocalDate:=DatePicker Display Dialog($x1;$y1)
If($MyLocalDate #!00/00/00!)
    [Event]DateRV:=$MyLocalDate
End if
```
