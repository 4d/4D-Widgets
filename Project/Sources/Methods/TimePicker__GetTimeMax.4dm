//%attributes = {"invisible":true}

C_POINTER:C301($1)
C_POINTER:C301($PtrTarget)

C_TEXT:C284($2)
C_TEXT:C284($Form)

C_TIME:C306($time)

$PtrTarget:=$1

If (Count parameters:C259>=2)
	$Form:=$2
Else 
	$Form:=""
End if 

Tool_ObjectToVar("MaxTime"; ->$time; $Form)
If ($time=?00:00:00?)
	$time:=<>TimePicker_TimeMax
End if 

$PtrTarget->:=$time