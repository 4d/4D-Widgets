# DatePicker SET MAX DATE

> DatePicker SET MAX DATE ( objectName ; maxDate )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | ⬅️ | Name of subform object |
| maxDate | Date | ⬅️ | Upper limit of enterable date |
## Description

The DatePicker SET MAX DATE command is used to specify the maximum enterable date in the DatePicker calendar (the days located after this maximum date appear grayed out in the calendar).

The [objectName](# "Name of subform object") specifies the instance of the subform to which the command must be applied. In this parameter, you must pass the name of a subform object displayed in the current form.

The [maxDate](# "Upper limit of enterable date") date must be expressed in the default entry format corresponding to the system language. If you pass a blank date (!00/00/00!), all the dates that follow the current date are enterable.

If the maximum enterable date is earlier than the minimum enterable date (see [DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.md "DatePicker SET MIN DATE")), no date will be enterable.

### Example  

Disabling all dates after December 31, 2009 in the object named "ReturnDate":

```4d
 DatePicker SET MAX DATE("ReturnDate";!12/31/2009!)
```

## See also

[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.md)  
[DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.md)
