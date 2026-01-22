//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $form : Text)

var $time : Time
Tool_ObjectToVar("SelectedTime"; ->$time; $form)

If ($time=?00:00:00?)
	
	$time:=<>TimePicker_SelectedTime
	
End if 

$PtrTarget->:=$time