//%attributes = {"invisible":true}

C_DATE:C307($minDate)
C_DATE:C307($maxDate)
C_DATE:C307($selectedDate)

C_POINTER:C301($DayPtr; $monthPtr; $YearPtr)
C_POINTER:C301($DayZoneNamePtr; $monthZoneNamePtr; $YearZoneNamePtr)

C_TEXT:C284($Form)
C_TEXT:C284($DayZoneName; $monthZoneName; $YearZoneName)

$DayZoneNamePtr:=OBJECT Get pointer:C1124(Object named:K67:5; "DayZoneName")
$monthZoneNamePtr:=OBJECT Get pointer:C1124(Object named:K67:5; "MonthZoneName")
$YearZoneNamePtr:=OBJECT Get pointer:C1124(Object named:K67:5; "YearZoneName")

If ((Not:C34(Is nil pointer:C315($DayZoneNamePtr))) & (Not:C34(Is nil pointer:C315($monthZoneNamePtr))) & (Not:C34(Is nil pointer:C315($YearZoneNamePtr))))
	
	$DayZoneName:=$DayZoneNamePtr->
	$monthZoneName:=$monthZoneNamePtr->
	$YearZoneName:=$YearZoneNamePtr->
	
	$DayPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $DayZoneName))
	$monthPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $monthZoneName))
	$YearPtr:=(OBJECT Get pointer:C1124(Object named:K67:5; $YearZoneName))
	
	If ((Not:C34(Is nil pointer:C315($DayPtr))) & (Not:C34(Is nil pointer:C315($monthPtr))) & (Not:C34(Is nil pointer:C315($YearPtr))))
		
		Tool_ObjectToVar("MinDate"; ->$minDate; $Form)
		Tool_ObjectToVar("MaxDate"; ->$maxDate; $Form)
		
		DatePicker__GetSelectedDate(->$selectedDate)
		If ($selectedDate<$minDate) & ($minDate#!00-00-00!)
			$selectedDate:=$minDate
		End if 
		If ($selectedDate>$maxDate) & ($maxDate#!00-00-00!)
			$selectedDate:=$maxDate
		End if 
		DatePicker__SetSelectedDate($selectedDate)
		
		$DayPtr->:=String:C10(Day of:C23($selectedDate); "00")
		$monthPtr->:=String:C10(Month of:C24($selectedDate); "00")
		$YearPtr->:=String:C10(Year of:C25($selectedDate); "0000")
		
	End if 
	
End if 