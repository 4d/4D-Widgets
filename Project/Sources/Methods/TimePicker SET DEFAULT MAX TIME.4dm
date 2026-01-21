//%attributes = {"invisible":true,"shared":true}
var $1 : Time
var $ErrorText : Text

If (Count parameters:C259=1)
	If (Type:C295($1)=Is time:K8:8)
		If ($1>=<>TimePicker_TimeMin)  //MAX must me superior or equal to timeMIN
			<>TimePicker_TimeMax:=$1
		End if 
	Else 
		$ErrorText:=Localized string:C991("Errors_TimeParameter")
		$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
Else 
	//incorrect number of parameters
	$ErrorText:=Localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
