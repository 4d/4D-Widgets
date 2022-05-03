//%attributes = {"invisible":true}
C_POINTER:C301($1)
C_POINTER:C301($PtrTarget)

C_TEXT:C284($2)
C_TEXT:C284($Form)

C_DATE:C307($date)

$PtrTarget:=$1



If (Count parameters:C259>=2)
	$Form:=$2
Else 
	$Form:=""
End if 


Tool_ObjectToVar("MaxDate"; ->$date; $Form)
If ($date=!00-00-00!)
	$date:=<>DatePicker_DateMax
End if 

$PtrTarget->:=$date


