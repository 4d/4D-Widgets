OBJECT SET VALUE:C1742("secondHand"; True:C214)
OBJECT SET VALUE:C1742("ampm"; True:C214)
OBJECT SET VALUE:C1742("seconds"; True:C214)

var $time : Time:=?08:08:58?
Form:C1466.timeEntry:=$time
Form:C1466.timeMeridien:=$time

Form:C1466.pickerOne:=?10:45:00?

TimePicker SET LABEL AM("timeEntryAmPm"; "am")
TimePicker SET LABEL PM("timeEntryAmPm"; "pm")
TimePicker SET MIN TIME("timeEntryAmPm"; ?00:00:00?)
TimePicker SET MAX TIME("timeEntryAmPm"; ?24:00:00?)