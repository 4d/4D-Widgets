// right
C_DATE:C307($selectedDate)
Tool_ObjectToVar("SelectedDate"; ->$selectedDate)

$selectedDate:=Add to date:C393($selectedDate; 0; 0; 1)

$selectedDate:=DatePicker__SetSelectedDate($selectedDate; "")

DatePicker__CalculateFirstDay($selectedDate)
DatePicker__RedrawCalendar
