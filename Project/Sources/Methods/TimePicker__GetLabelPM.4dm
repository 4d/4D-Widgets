//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $form : Text)

var $text : Text
Tool_ObjectToVar("PMlabel"; ->$text; $form)

If (Length:C16($text)=0)
	
	$text:=<>TimePicker_LabelPM
	
End if 

$PtrTarget->:=$text