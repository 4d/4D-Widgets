C_DATE:C307($SelectedDate)
C_TEXT:C284($DayZoneName;$MonthZoneName;$YearZoneName)

C_POINTER:C301($DayPtr;$MonthPtr;$YearPtr)
C_POINTER:C301($datePicker_Target)

DatePicker__SetBlob   // Met dans un BLOB les contraintes définies par l'utilisateur (etc.)
$datePicker_Target:=DatePicker__GetTarget 
  // TM 2019-05-24 - don't use process variables to allow two instances.
<>DatePicker_GetBlob:=True:C214
$SelectedDate:=DatePicker Display Dialog (-1;-1;$datePicker_Target->)  //ACI0097346 //ACI0099621

If ($SelectedDate#!00-00-00!)
	
	$DayZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5;"DayZoneName"))->
	$MonthZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5;"MonthZoneName"))->
	$YearZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5;"YearZoneName"))->
	
	$DayPtr:=(OBJECT Get pointer:C1124(Object named:K67:5;$DayZoneName))
	$MonthPtr:=(OBJECT Get pointer:C1124(Object named:K67:5;$MonthZoneName))
	$YearPtr:=(OBJECT Get pointer:C1124(Object named:K67:5;$YearZoneName))
	
	
	$SelectedDate:=DatePicker__SetSelectedDate ($SelectedDate;"")  //will also check Min and Max limits
	
	$DayPtr->:=String:C10(Day of:C23($SelectedDate);"00")
	$MonthPtr->:=String:C10(Month of:C24($SelectedDate);"00")
	$YearPtr->:=String:C10(Year of:C25($SelectedDate);"0000")
	
End if 
