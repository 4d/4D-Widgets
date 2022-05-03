//%attributes = {"invisible":true}
C_LONGINT:C283($1)  //+1 or -1

C_POINTER:C301($DayPtr; $monthPtr; $YearPtr; $ObjectPtr)
C_TEXT:C284($DayZoneName; $monthZoneName; $YearZoneName)

C_LONGINT:C283($Increment)
C_DATE:C307($selectedDate)

$Increment:=$1

$DayZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "DayZoneName"))->
$monthZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "MonthZoneName"))->
$YearZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "YearZoneName"))->

$DayPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $DayZoneName))
$monthPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $monthZoneName))
$YearPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $YearZoneName))


If (Num:C11($DayPtr->)=0) & (Num:C11($monthPtr->)=0) & (Num:C11($YearPtr->)=0)
	
	// at the first clic on increment/decrement and if the date is null, then when set the 1st january 2000
	$selectedDate:=!2000-01-01!
	
Else 
	
	
	$selectedDate:=Add to date:C393(!00-00-00!; Num:C11($YearPtr->); Num:C11($monthPtr->); Num:C11($DayPtr->))
	
	$ObjectPtr:=OBJECT Get pointer:C1124(Object with focus:K67:3)  //focus
	Case of 
			
		: ($ObjectPtr=$YearPtr)  //year
			$selectedDate:=Add to date:C393($selectedDate; $Increment; 0; 0)
			
		: ($ObjectPtr=$monthPtr)  // month
			$selectedDate:=Add to date:C393($selectedDate; 0; $Increment; 0)
			
		: ($ObjectPtr=$DayPtr) | True:C214  // Day (in some cases, the focus ring is displayed without any entry zone focussed)
			$selectedDate:=Add to date:C393($selectedDate; 0; 0; $Increment)
			
	End case 
	
End if 

$selectedDate:=DatePicker__SetSelectedDate($selectedDate; "")
//DatePicker__CalculateFirstDay ($selectedDate;"")

DateEntry__Redraw

$ObjectPtr:=OBJECT Get pointer:C1124(Object current:K67:2)
$ObjectPtr->:=0

