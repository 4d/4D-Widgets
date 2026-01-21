//%attributes = {"invisible":true}
var $1 : Boolean
var $recalcDate : Boolean

var $DisplayedDate; $selectedDate : Date
var $DayPtr; $monthPtr; $YearPtr; $CurrentPtr : Pointer

var $DayZoneName; $monthZoneName; $YearZoneName : Text

If (Count parameters:C259=1)
	$recalcDate:=$1
Else 
	$recalcDate:=True:C214
End if 

If ($recalcDate)
	
	$DayZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "DayZoneName"))->
	$monthZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "MonthZoneName"))->
	$YearZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "YearZoneName"))->
	
	$DayPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $DayZoneName))
	$monthPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $monthZoneName))
	$YearPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $YearZoneName))
	
	
	$CurrentPtr:=OBJECT Get pointer:C1124(Object current:K67:2)
	If (Num:C11($CurrentPtr->)=0)
		
		$DayPtr->:="00"
		$monthPtr->:="00"
		$YearPtr->:="0000"
		
	Else 
		
		If (Num:C11($DayPtr->)=0)
			$DayPtr->:="01"
		End if 
		If (Num:C11($monthPtr->)=0)
			$monthPtr->:="01"
		End if 
		If (Num:C11($YearPtr->)<100)
			If (Num:C11($YearPtr->)<50)
				$YearPtr->:=String:C10(2000+Num:C11($YearPtr->); "0000")
			Else 
				$YearPtr->:=String:C10(1900+Num:C11($YearPtr->); "0000")
			End if 
		End if 
		
	End if 
	
	$DisplayedDate:=Add to date:C393(!00-00-00!; Num:C11($YearPtr->); Num:C11($monthPtr->); Num:C11($DayPtr->))
	
	$selectedDate:=DatePicker__SetSelectedDate($DisplayedDate; "")  //verifiera les bornes Min et Max
	
Else 
	DatePicker__GetSelectedDate(->$selectedDate; "")
End if 

DatePicker__CalculateFirstDay($DisplayedDate; "")  // in order to use the tiny popup properly

$DayPtr->:=String:C10(Day of:C23($selectedDate); "00")
$monthPtr->:=String:C10(Month of:C24($selectedDate); "00")
$YearPtr->:=String:C10(Year of:C25($selectedDate); "0000")

