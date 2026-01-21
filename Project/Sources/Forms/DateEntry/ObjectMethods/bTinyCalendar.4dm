var $selectedDate : Date
var $DayZoneName; $monthZoneName; $YearZoneName : Text

var $DayPtr; $monthPtr; $YearPtr : Pointer


DatePicker__SetBlob  // Met dans un BLOB les contraintes définies par l'utilisateur (etc.)
<>DatePicker_GetBlob:=True:C214
$selectedDate:=DatePicker__GetTarget
$selectedDate:=DatePicker Display Dialog(-1; -1; $selectedDate)  //ACI0097346 //ACI0099621

If ($selectedDate#!00-00-00!)
	
	$DayZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "DayZoneName"))->
	$monthZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "MonthZoneName"))->
	$YearZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "YearZoneName"))->
	
	$DayPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $DayZoneName))
	$monthPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $monthZoneName))
	$YearPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $YearZoneName))
	
	
	$selectedDate:=DatePicker__SetSelectedDate($selectedDate; "")  //will also check Min and Max limits
	
	$DayPtr->:=String:C10(Day of:C23($selectedDate); "00")
	$monthPtr->:=String:C10(Month of:C24($selectedDate); "00")
	$YearPtr->:=String:C10(Year of:C25($selectedDate); "0000")
	
End if 
