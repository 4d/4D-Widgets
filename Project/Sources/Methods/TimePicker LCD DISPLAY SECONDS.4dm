//%attributes = {"invisible":true,"shared":true}

var $1 : Text  // form name
var $2 : Boolean  // true = display seconds, false : do not display seconds

var $subFormName : Text
var $ErrorText : Text
var $withSeconds : Boolean


If (Count parameters:C259>=2)
	
	$subFormName:=$1
	$withSeconds:=$2
	
	EXECUTE METHOD IN SUBFORM:C1085($subFormName; "TimePicker__LCD DISPLAY SECONDS"; *; $withSeconds)
	
Else 
	//incorrect number of parameters
	$ErrorText:=Localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
End if 




