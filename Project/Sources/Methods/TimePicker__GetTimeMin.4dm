//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $Form : Text)

var $time : Time
Tool_ObjectToVar("MinTime"; ->$time; $Form)

$PtrTarget->:=$time