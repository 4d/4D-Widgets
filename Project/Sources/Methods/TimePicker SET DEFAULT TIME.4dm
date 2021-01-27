//%attributes = {"invisible":true}
C_TIME:C306($1)

C_TEXT:C284($ErrorText)

If (Count parameters:C259=1)
	
	If (Type:C295($1)=Is time:K8:8)
		
		<>TimePicker_SelectedTime:=$1
		
	Else 
		  //pas une heure 
		$ErrorText:=Get localized string:C991("Errors_TimeParameter")
		$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
Else 
	  //incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
	ALERT:C41($ErrorText)
End if 
