//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $form : Text)

var $time : Time
Tool_ObjectToVar("MaxTime"; ->$time; $form)

If ($time=?00:00:00?)
	
	$time:=<>TimePicker_TimeMax
	
End if 

$PtrTarget->:=$time