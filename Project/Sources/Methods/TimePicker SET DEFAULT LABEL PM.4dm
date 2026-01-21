//%attributes = {"invisible":true,"shared":true}
var $1 : Text  // label

var $ErrorText : Text

If (Count parameters:C259=1)
	If (Type:C295($1)=Is text:K8:3)
		<>TimePicker_LabelPM:=$1
	Else 
		$ErrorText:=Localized string:C991("Errors_TextParameter")
		$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
Else 
	//incorrect number of parameters
	$ErrorText:=Localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
