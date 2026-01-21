//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $Form : Text)

var $text : Text
Tool_ObjectToVar("AMlabel"; ->$text; $Form)

If (Length:C16($text)=0)
	
	$text:=<>TimePicker_LabelAM
	
End if 

$PtrTarget->:=$text