# TimePicker SET STEP

> TimePicker SET STEP ( objectName ; step )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | ⬅️ | Name of subform object |
| step | Time | ⬅️ | Interval between two time values |
## Description

The TimePicker SET STEP command is used to set the step between time values available for the object designated by [objectName](# "Name of subform object"). This parameter only applies to TimePickers displayed as pop-up menus.

The [step](# "Interval between two time values") value must be included between 1 minute and 1 hour and must be shown as whole divisions of 60 minutes. In practice, only the values 1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30 and 60 min are possible. Any other value will automatically be rounded off in order to correspond to this principle.

### Example  

Configuration of the TimePicker in the form of a pop-up menu named "time1", limitation of enterable times from 8:30 to 16:30 with 10-minute steps:

```4d
 TimePicker SET MIN TIME("time1";?08:30:00?)  
 TimePicker SET MAX TIME("time1";?16:30:00?)  
 TimePicker SET STEP("time1";?00:10:00?)
```

![](https://doc.4d.com/4Dv19/picture/308616/pict308616.en.png)

## See also

[TimePicker SET DEFAULT STEP](TimePicker%20SET%20DEFAULT%20STEP.md)
