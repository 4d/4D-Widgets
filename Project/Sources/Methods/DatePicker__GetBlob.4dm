//%attributes = {"invisible":true}
var $i : Integer
var $Ptr : Pointer
var $Offset : Integer

ARRAY TEXT:C222($_objectNames; 0)

APPEND TO ARRAY:C911($_objectNames; "DisplayedMonth")
APPEND TO ARRAY:C911($_objectNames; "MinDate")
APPEND TO ARRAY:C911($_objectNames; "MaxDate")
APPEND TO ARRAY:C911($_objectNames; "_ListMonthes")
APPEND TO ARRAY:C911($_objectNames; "_ListDays")
APPEND TO ARRAY:C911($_objectNames; "_WeeklyDaysOff")
APPEND TO ARRAY:C911($_objectNames; "_DaysNames")
APPEND TO ARRAY:C911($_objectNames; "_MonthesNames")
APPEND TO ARRAY:C911($_objectNames; "_DaysOff1")
APPEND TO ARRAY:C911($_objectNames; "_DaysOff2")
APPEND TO ARRAY:C911($_objectNames; "FirstDisplayedDay")
APPEND TO ARRAY:C911($_objectNames; "FirstOfCurrentMonth")
APPEND TO ARRAY:C911($_objectNames; "FirstDayOfWeek")
APPEND TO ARRAY:C911($_objectNames; "SelectedDate")

$Offset:=0
For ($i; 1; Size of array:C274($_objectNames))
	$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5; $_objectNames{$i})
	If (Not:C34(Is nil pointer:C315($Ptr)))
		BLOB TO VARIABLE:C533(<>DatePicker_Blob; $Ptr->; $Offset)
	End if 
End for 

var <>DatePicker_Blob : Blob
SET BLOB SIZE:C606(<>DatePicker_Blob; 0)