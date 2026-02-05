OBJECT SET VALUE:C1742("secondHand"; True:C214)
OBJECT SET VALUE:C1742("ampm"; True:C214)
OBJECT SET VALUE:C1742("seconds"; True:C214)

var $time : Time:=?08:08:58?
Form:C1466.timeEntry:=$time

Form:C1466.timeMeridien:=$time+?12:00:00?

Form:C1466.pickerOne:=?12:15:00?

TimePicker SET MIN TIME("timeEntryAmPm"; ?00:00:00?)
TimePicker SET MAX TIME("timeEntryAmPm"; ?24:00:00?)

Form:C1466.dateEntry:=!1958-08-08!
Form:C1466.date:=Current date:C33