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

Tool_ObjectToVar ("AMlabel";->$Text;$Form)
If ($Text="")
	$Text:=<>TimePicker_LabelAM
End if 

$PtrTarget->:=$Text
