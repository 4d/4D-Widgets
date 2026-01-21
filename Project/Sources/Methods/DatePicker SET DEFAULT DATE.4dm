//%attributes = {"invisible":true}

var $1 : Date  // Max date
var $ErrorText : Text

DatePicker__InitInter

If (Count parameters:C259=1)
	
	
	If (Type:C295($1)=Is date:K8:7)
		
		<>DatePicker_DefaultDate:=$1
		
	Else 
		//not a date date 
		$ErrorText:=Localized string:C991("Errors_DateParameter")
		$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
	
Else 
	//incorrect number of parameters
	$ErrorText:=Localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
