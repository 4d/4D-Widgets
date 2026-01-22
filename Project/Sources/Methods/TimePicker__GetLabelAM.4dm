//%attributes = {"invisible":true}
#DECLARE($PtrTarget : Pointer; $form : Text)

var $text : Text
Tool_ObjectToVar("AMlabel"; ->$text; $form)

If (Length:C16($text)=0)
	
	$text:=<>TimePicker_LabelAM
	
End if 

$PtrTarget->:=$text