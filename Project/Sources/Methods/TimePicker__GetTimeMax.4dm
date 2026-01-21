//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $Form : Text)

var $time : Time
Tool_ObjectToVar("MaxTime"; ->$time; $Form)

If ($time=?00:00:00?)
	
	$time:=<>TimePicker_TimeMax
	
End if 

$PtrTarget->:=$time