//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $Form : Text)

var $time : Time
Tool_ObjectToVar("Step"; ->$time; $Form)

If ($time=?00:00:00?)
	
	$time:=<>TimePicker_Step
	
End if 

$PtrTarget->:=$time