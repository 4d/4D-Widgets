//%attributes = {"invisible":true,"shared":true}
var $1 : Time
var $time : Time

var $ErrorText : Text

If (Count parameters:C259=1)
	If (Type:C295($1)=Is time:K8:8)
		
		$time:=$1
		Case of 
			: ($time<?00:01:00?)
				$time:=?00:01:00?
			: ($time>?01:00:00?)
				$time:=?01:00:00?
			Else 
				$time:=3600/Round:C94(3600/$time; 0)
		End case 
		
		
		<>TimePicker_Step:=$time
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
