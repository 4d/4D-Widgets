//%attributes = {"invisible":true,"shared":true}

var $1 : Text  // form name
var $2 : Boolean  // true = display AMPM, false : do not display AMPM

var $subFormName : Text
var $ErrorText : Text
var $withAmPm : Boolean


If (Count parameters:C259>=2)
	
	$subFormName:=$1
	$withAmPm:=$2
	
	EXECUTE METHOD IN SUBFORM:C1085($subFormName; "TimePicker__LCD DISPLAY AMPM"; *; $withAmPm)
	
	
Else 
	//incorrect number of parameters
	$ErrorText:=Localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 




