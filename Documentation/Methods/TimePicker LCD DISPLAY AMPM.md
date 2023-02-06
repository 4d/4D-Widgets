# TimePicker LCD DISPLAY AMPM

> TimePicker LCD DISPLAY AMPM ( objectName ; amPm )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | ⬅️ | Name of subform object |
| amPm | Boolean | ⬅️ | True = display AM/PM, False = do not display |
## Description

The **TimePicker LCD DISPLAY AMPM** displays or hides the AM/PM placed to the right of the [objectName](# "Name of subform object") subform object (digital clock only).

These letters are used to distinguish between the morning and afternoon when the clock is used in 12-hour mode (see [TimePicker LCD SET MODE](TimePicker%20LCD%20SET%20MODE.md)).

By default, these letters are displayed. You can pass **False** in [amPm](# "True = display AM/PM, False = do not display
") to hide them.

### Example  

We want to hide the AM/PM:

```4d
 TimePicker LCD DISPLAY AMPM("Subform1";False)
```

![](https://doc.4d.com/4Dv19/picture/1239891/pict1239891.fr.png)

## See also

[TimePicker LCD SET MODE](TimePicker%20LCD%20SET%20MODE.md)
