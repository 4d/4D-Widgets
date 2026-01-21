//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $Form : Text)

var $text : Text
Tool_ObjectToVar("PMlabel"; ->$text; $Form)

If (Length:C16($text)=0)
	
	$text:=<>TimePicker_LabelPM
	
End if 

$PtrTarget->:=$text