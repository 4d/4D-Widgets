# DatePicker SET WEEK FIRST DAY

> DatePicker SET WEEK FIRST DAY ( objectName ; dayNum )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | ⬅️ | Name of subform object |
| dayNum | Longint | ⬅️ | Number of first day to display |
## Description

The DatePicker SET WEEK FIRST DAY command is used to set the first day of the week to display in the left part of a DatePicker calendar. By default, the first day is Monday.

The [objectName](# "Name of subform object") parameter specifies the instance of the subform to which the command must be applied. In this parameter, you must pass the name of a subform object displayed in the current form.

Pass a 4D constant from the `Days and Months` theme in the [dayNum](# "Number of first day to display") parameter:

| Constant | Type | Value |
| --- | --- | --- |
| Sunday | Longint | 1   |
| Monday | Longint | 2   |
| Tuesday | Longint | 3   |
| Wednesday | Longint | 4   |
| Thursday | Longint | 5   |
| Friday | Longint | 6   |
| Saturday | Longint | 7   |
### Example 1  

 Setting first day to Sunday:

```4d
 DatePicker SET WEEK FIRST DAY("mycalendar";Sunday)
```

![](https://doc.4d.com/4Dv19/picture/308112/pict308112.en.png)

### Example 2  

Setting first day to Thursday:

```4d
 DatePicker SET WEEK FIRST DAY("mycalendar";Thursday)
```

![](https://doc.4d.com/4Dv19/picture/308150/pict308150.en.png)

## See also

[DatePicker SET DAYS OFF](DatePicker%20SET%20DAYS%20OFF.md)  
[DatePicker SET DEFAULT 1ST DAY](DatePicker%20SET%20DEFAULT%201ST%20DAY.md)
