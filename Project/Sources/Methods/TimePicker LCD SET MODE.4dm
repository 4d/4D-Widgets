//%attributes = {"invisible":true,"shared":true}
var $1 : Text  // form name
var $2 : Integer  // mode 12 ou 24

var $subFormName : Text
var $ErrorText : Text
var $mode : Integer

If (Count parameters:C259>=2)
	
	$subFormName:=$1
	$mode:=$2
	
	EXECUTE METHOD IN SUBFORM:C1085($subFormName; "TimePicker__LCD SET MODE"; *; $mode)
	
Else 
	//incorrect number of parameters
	$ErrorText:=Localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
End if 





