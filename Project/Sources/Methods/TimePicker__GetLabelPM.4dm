//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_POINTER:C301($PtrTarget)

C_TEXT:C284($2)
C_TEXT:C284($Form)

C_TEXT:C284($text)

$PtrTarget:=$1

If (Count parameters:C259>=2)
	$Form:=$2
Else 
	$Form:=""
End if 

Tool_ObjectToVar("PMlabel"; ->$text; $Form)
If ($text="")
	$text:=<>TimePicker_LabelPM
End if 

$PtrTarget->:=$text
