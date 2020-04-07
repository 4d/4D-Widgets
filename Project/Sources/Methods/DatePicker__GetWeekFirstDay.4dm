//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_POINTER:C301($PtrTarget)

C_TEXT:C284($2)
C_TEXT:C284($Form)

C_REAL:C285($FirstDayOfWeek)

If (Count parameters:C259>=2)
	$Form:=$2
Else 
	$Form:=""
End if 

$PtrTarget:=$1

Tool_ObjectToVar ("FirstDayOfWeek";->$FirstDayOfWeek;$Form)
If ($FirstDayOfWeek=0)
	$FirstDayOfWeek:=<>DatePicker_FirstDayOfWeek
End if 

$PtrTarget->:=$FirstDayOfWeek
