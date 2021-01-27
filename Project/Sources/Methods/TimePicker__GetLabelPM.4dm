//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_POINTER:C301($PtrTarget)

C_TEXT:C284($2)
C_TEXT:C284($Form)

C_TEXT:C284($Text)

$PtrTarget:=$1

If (Count parameters:C259>=2)
	$Form:=$2
Else 
	$Form:=""
End if 

Tool_ObjectToVar ("PMlabel";->$Text;$Form)
If ($Text="")
	$Text:=<>TimePicker_LabelPM
End if 

$PtrTarget->:=$Text
