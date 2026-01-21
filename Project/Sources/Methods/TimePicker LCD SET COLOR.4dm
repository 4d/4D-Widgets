//%attributes = {"invisible":true,"shared":true}
var $1 : Text  // form name
var $2 : Integer  // color (RGB or R)
var $3 : Integer  // {color G}
var $4 : Integer  // {color B}

var $subFormName : Text
var $ErrorText : Text
var $rgb : Text

var $red; $blue; $green : Integer

If (Count parameters:C259>=2)
	
	$subFormName:=$1
	
	If (Count parameters:C259>=4)
		$red:=$2
		$green:=$3
		$blue:=$4
	Else 
		$red:=($2 & 0x00FF0000) >> 16
		$green:=($2 & 0xFF00) >> 8
		$blue:=($2 & 0x00FF) >> 0
	End if 
	
	$rgb:="rgb("+String:C10($red)+","+String:C10($green)+","+String:C10($blue)+")"
	EXECUTE METHOD IN SUBFORM:C1085($subFormName; "TimePicker__LCD SET COLOR"; *; $rgb)
	
Else 
	//incorrect number of parameters
	$ErrorText:=Localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
End if 





