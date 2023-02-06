# DatePicker SET MIN DATE

> DatePicker SET MIN DATE ( objectName ; dateMin )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | ⬅️ | Name of subform object |
| dateMin | Date | ⬅️ | Lower limit of enterable date |
## Description

The DatePicker SET MIN DATE command is used to set the minimum enterable date in a DatePicker calendar (the days located before this minimum date appear grayed out in the calendar).

The [objectName](# "Name of subform object") parameter specifies the instance of the subform to which the command must be applied. In this parameter, you must pass the name of a subform object displayed in the current form.

The minDate date must be expressed in the default entry format corresponding to the system language. If you pass a blank date (!00/00/00!), all the dates preceding the current date will be enterable.

If the minimum enterable date is later than the maximum enterable date (see [DatePicker SET MAX DATE](DatePicker%20SET%20MAX%20DATE.md "DatePicker SET MAX DATE")), no date will be enterable.

### Example  

The current form contains two DatePicker calendars located in two subform objects named "DP1" and "DP2".

```4d
  //Disabling all dates before January 1, 2009 in the first calendar  
 DatePicker SET MIN DATE("DP1";!01/01/2009!)  
  //Disabling all dates before March 1st, 2009 in the second calendar  
 DatePicker SET MIN DATE("DP2";!03/01/2009!)
```

## See also

[DatePicker SET DEFAULT MIN DATE](DatePicker%20SET%20DEFAULT%20MIN%20DATE.md)  
[DatePicker SET MAX DATE](DatePicker%20SET%20MAX%20DATE.md)
