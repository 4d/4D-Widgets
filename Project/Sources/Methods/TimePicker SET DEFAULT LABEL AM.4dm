//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)  // label

C_TEXT:C284($ErrorText)
If (Count parameters:C259=1)
	If (Type:C295($1)=Is text:K8:3)
		<>TimePicker_LabelAM:=$1
	Else 
		$ErrorText:=Get localized string:C991("Errors_TextParameter")
		$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
Else 
	  //incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
