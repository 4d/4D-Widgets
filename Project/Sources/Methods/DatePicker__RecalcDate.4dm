//%attributes = {"invisible":true}
C_BOOLEAN:C305($1)
C_BOOLEAN:C305($RecalcDate)

C_DATE:C307($DisplayedDate;$SelectedDate)
C_POINTER:C301($DayPtr;$MonthPtr;$YearPtr;$CurrentPtr)

C_TEXT:C284($DayZoneName;$MonthZoneName;$YearZoneName)

If (Count parameters:C259=1)
	$RecalcDate:=$1
Else 
	$RecalcDate:=True:C214
End if 

If ($RecalcDate)
	
	$DayZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5;"DayZoneName"))->
	$MonthZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5;"MonthZoneName"))->
	$YearZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5;"YearZoneName"))->
	
	$DayPtr:=(OBJECT Get pointer:C1124(Object named:K67:5;$DayZoneName))
	$MonthPtr:=(OBJECT Get pointer:C1124(Object named:K67:5;$MonthZoneName))
	$YearPtr:=(OBJECT Get pointer:C1124(Object named:K67:5;$YearZoneName))
	
	
	$CurrentPtr:=OBJECT Get pointer:C1124(Object current:K67:2)
	If (Num:C11($CurrentPtr->)=0)
		
		$DayPtr->:="00"
		$MonthPtr->:="00"
		$YearPtr->:="0000"
		
	Else 
		
		If (Num:C11($DayPtr->)=0)
			$DayPtr->:="01"
		End if 
		If (Num:C11($MonthPtr->)=0)
			$MonthPtr->:="01"
		End if 
		If (Num:C11($YearPtr->)<100)
			If (Num:C11($YearPtr->)<50)
				$YearPtr->:=String:C10(2000+Num:C11($YearPtr->);"0000")
			Else 
				$YearPtr->:=String:C10(1900+Num:C11($YearPtr->);"0000")
			End if 
		End if 
		
	End if 
	
	$DisplayedDate:=Add to date:C393(!00-00-00!;Num:C11($YearPtr->);Num:C11($MonthPtr->);Num:C11($DayPtr->))
	
	$SelectedDate:=DatePicker__SetSelectedDate ($DisplayedDate;"")  //verifiera les bornes Min et Max
	
Else 
	DatePicker__GetSelectedDate (->$SelectedDate;"")
End if 

DatePicker__CalculateFirstDay ($DisplayedDate;"")  // in order to use the tiny popup properly

$DayPtr->:=String:C10(Day of:C23($SelectedDate);"00")
$MonthPtr->:=String:C10(Month of:C24($SelectedDate);"00")
$YearPtr->:=String:C10(Year of:C25($SelectedDate);"0000")

