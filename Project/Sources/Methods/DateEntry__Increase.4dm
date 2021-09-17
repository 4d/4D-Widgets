//%attributes = {"invisible":true}
C_LONGINT:C283($1)  //+1 or -1

C_POINTER:C301($DayPtr; $MonthPtr; $YearPtr; $ObjectPtr)
C_TEXT:C284($DayZoneName; $MonthZoneName; $YearZoneName)

C_LONGINT:C283($Increment)
C_DATE:C307($SelectedDate)

$Increment:=$1

$DayZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "DayZoneName"))->
$MonthZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "MonthZoneName"))->
$YearZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "YearZoneName"))->

$DayPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $DayZoneName))
$MonthPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $MonthZoneName))
$YearPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $YearZoneName))


If (Num:C11($DayPtr->)=0) & (Num:C11($MonthPtr->)=0) & (Num:C11($YearPtr->)=0)
	
	// at the first clic on increment/decrement and if the date is null, then when set the 1st january 2000
	$SelectedDate:=!2000-01-01!
	
Else 
	
	
	$SelectedDate:=Add to date:C393(!00-00-00!; Num:C11($YearPtr->); Num:C11($MonthPtr->); Num:C11($DayPtr->))
	
	$ObjectPtr:=OBJECT Get pointer:C1124(Object with focus:K67:3)  //focus
	Case of 
			
		: ($ObjectPtr=$YearPtr)  //year
			$SelectedDate:=Add to date:C393($SelectedDate; $Increment; 0; 0)
			
		: ($ObjectPtr=$MonthPtr)  // month
			$SelectedDate:=Add to date:C393($SelectedDate; 0; $Increment; 0)
			
		: ($ObjectPtr=$DayPtr) | True:C214  // Day (in some cases, the focus ring is displayed without any entry zone focussed)
			$SelectedDate:=Add to date:C393($SelectedDate; 0; 0; $Increment)
			
	End case 
	
End if 

$SelectedDate:=DatePicker__SetSelectedDate($SelectedDate; "")
//DatePicker__CalculateFirstDay ($SelectedDate;"")

DateEntry__Redraw

$ObjectPtr:=OBJECT Get pointer:C1124(Object current:K67:2)
$ObjectPtr->:=0

