# DatePicker SET DEFAULT MIN DATE

> DatePicker SET DEFAULT MIN DATE ( dateMin )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| dateMin | Date | ⬅️ | Limite inférieure de date saisissable |
## Description

The DatePicker SET DEFAULT MIN DATE command is used to set the minimum enterable day for all the calendars of the DatePicker component.

Note that this parameter is only taken into account for calendars created subsequently and does not apply to any existing calendars. If you want to apply it to existing calendars, you must use the [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md "DatePicker APPLY DEFAULT VALUES") command.

### Example  

Designation of minimum date to January 1, 2000:

```4d
 DatePicker SET DEFAULT MIN DATE(!01/01/2000!)
```

## See also

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md)  
[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.md)  
[DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.md)
