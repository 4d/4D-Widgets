  //up

C_DATE:C307($SelectedDate)
Tool_ObjectToVar ("SelectedDate";->$SelectedDate)

$SelectedDate:=Add to date:C393($SelectedDate;0;0;-7)

$SelectedDate:=DatePicker__SetSelectedDate ($SelectedDate;"")

DatePicker__CalculateFirstDay ($SelectedDate)
DatePicker__RedrawCalendar 
