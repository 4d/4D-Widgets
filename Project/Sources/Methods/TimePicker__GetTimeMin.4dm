//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $form : Text)

var $time : Time
Tool_ObjectToVar("MinTime"; ->$time; $form)

$PtrTarget->:=$time