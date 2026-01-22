//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $form : Text)

var $time : Time
Tool_ObjectToVar("Step"; ->$time; $form)

If ($time=?00:00:00?)
	
	$time:=<>TimePicker_Step
	
End if 

$PtrTarget->:=$time