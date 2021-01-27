//%attributes = {"invisible":true}
C_LONGINT:C283($i)
C_POINTER:C301($ptr)

C_BLOB:C604(<>DatePicker_Blob)
SET BLOB SIZE:C606(<>DatePicker_Blob;0)


ARRAY TEXT:C222($_objectNames;0)

APPEND TO ARRAY:C911($_objectNames;"DisplayedMonth")
APPEND TO ARRAY:C911($_objectNames;"MinDate")
APPEND TO ARRAY:C911($_objectNames;"MaxDate")
APPEND TO ARRAY:C911($_objectNames;"_ListMonthes")
APPEND TO ARRAY:C911($_objectNames;"_ListDays")
APPEND TO ARRAY:C911($_objectNames;"_WeeklyDaysOff")
APPEND TO ARRAY:C911($_objectNames;"_DaysNames")
APPEND TO ARRAY:C911($_objectNames;"_MonthesNames")
APPEND TO ARRAY:C911($_objectNames;"_DaysOff1")
APPEND TO ARRAY:C911($_objectNames;"_DaysOff2")
APPEND TO ARRAY:C911($_objectNames;"FirstDisplayedDay")
APPEND TO ARRAY:C911($_objectNames;"FirstOfCurrentMonth")
APPEND TO ARRAY:C911($_objectNames;"FirstDayOfWeek")
APPEND TO ARRAY:C911($_objectNames;"SelectedDate")


For ($i;1;Size of array:C274($_objectNames))
	$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5;$_objectNames{$i})
	If (Not:C34(Is nil pointer:C315($Ptr)))
		VARIABLE TO BLOB:C532($Ptr->;<>DatePicker_Blob;*)
	End if 
End for 

