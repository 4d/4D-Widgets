//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $Form : Text)

var $time : Time
Tool_ObjectToVar("SelectedTime"; ->$time; $Form)

If ($time=?00:00:00?)
	
	$time:=<>TimePicker_SelectedTime
	
End if 

$PtrTarget->:=$time