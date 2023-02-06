# DatePicker Display Dialog

> DatePicker Display Dialog {( left ; top {; defaultDate})} -> Function result

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| left | Longint | ⬅️ | Location for left side of window |
| top | Longint | ⬅️ | Location for top of window |
| defaultDate | Date | ⬅️ | Date to select by default in the dialog |
| Function result | Date | ➡️ | Date selected by user |
## Description

The DatePicker Display Dialog command opens a DatePicker calendar in a pop-up window (a pop-up type window is automatically closed when the user clicks outside the window or hits the **Enter** or **Esc** key).

![](https://doc.4d.com/4Dv19/picture/307838/pict307838.en.png)

The two optional [left](# "Location for left side of window") and [top](# "Location for top of window") parameters are used to specify the location of the top left corner of the window to be opened. These two parameters must be passed together; if only one is passed, it is ignored. If these parameters are omitted, the window is opened at the location of the click.

You can pass a [defaultDate](# "Date to select by default in the dialog") date as third parameter in order to set the DatePicker dialog have an associated date pre-selected when displayed to the user.

DatePicker Display Dialog returns the date selected by the user in the DatePicker calendar. If the window is closed without a date being selected by the user, the command returns a blank date (!00/00/00!), even if a [defaultDate](# "Date to select by default in the dialog") date was passed.

### Example  

This example displays a DatePicker calendar when a button is clicked:

```4d
 OBJECT GET COORDINATES(*;"MyCalendarButton";$x1;$y1;$x2;$y2)  
 $MyLocalDate:=DatePicker Display Dialog($x1;$y1)  
 If($MyLocalDate #!00/00/00!)  
    [Event]DateRV:=$MyLocalDate  
 End if
```
