//%attributes = {"invisible":true}

C_DATE:C307($MinDate)
C_DATE:C307($MaxDate)
C_DATE:C307($SelectedDate)

C_POINTER:C301($DayPtr;$MonthPtr;$YearPtr)
C_POINTER:C301($DayZoneNamePtr;$MonthZoneNamePtr;$YearZoneNamePtr)

C_TEXT:C284($Form)
C_TEXT:C284($DayZoneName;$MonthZoneName;$YearZoneName)

$DayZoneNamePtr:=OBJECT Get pointer:C1124(Object named:K67:5;"DayZoneName")
$MonthZoneNamePtr:=OBJECT Get pointer:C1124(Object named:K67:5;"MonthZoneName")
$YearZoneNamePtr:=OBJECT Get pointer:C1124(Object named:K67:5;"YearZoneName")

If ((Not:C34(Is nil pointer:C315($DayZoneNamePtr))) & (Not:C34(Is nil pointer:C315($MonthZoneNamePtr))) & (Not:C34(Is nil pointer:C315($YearZoneNamePtr))))
	
	$DayZoneName:=$DayZoneNamePtr->
	$MonthZoneName:=$MonthZoneNamePtr->
	$YearZoneName:=$YearZoneNamePtr->
	
	$DayPtr:=(OBJECT Get pointer:C1124(Object named:K67:5;$DayZoneName))
	$MonthPtr:=(OBJECT Get pointer:C1124(Object named:K67:5;$MonthZoneName))
	$YearPtr:=(OBJECT Get pointer:C1124(Object named:K67:5;$YearZoneName))
	
	If ((Not:C34(Is nil pointer:C315($DayPtr))) & (Not:C34(Is nil pointer:C315($MonthPtr))) & (Not:C34(Is nil pointer:C315($YearPtr))))
		
		Tool_ObjectToVar ("MinDate";->$MinDate;$Form)
		Tool_ObjectToVar ("MaxDate";->$MaxDate;$Form)
		
		DatePicker__GetSelectedDate (->$SelectedDate)
		If ($SelectedDate<$MinDate) & ($MinDate#!00-00-00!)
			$SelectedDate:=$MinDate
		End if 
		If ($SelectedDate>$MaxDate) & ($MaxDate#!00-00-00!)
			$SelectedDate:=$MaxDate
		End if 
		DatePicker__SetSelectedDate ($SelectedDate)
		
		$DayPtr->:=String:C10(Day of:C23($SelectedDate);"00")
		$MonthPtr->:=String:C10(Month of:C24($SelectedDate);"00")
		$YearPtr->:=String:C10(Year of:C25($SelectedDate);"0000")
		
	End if 
	
End if 