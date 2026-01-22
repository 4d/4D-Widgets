//%attributes = {"invisible":true,"shared":true}

var $1 : Text  //destination form 
var $2 : Text  // label

var $form : Text
var $CurrentHelp : Text
var $ErrorText : Text

If (Count parameters:C259=2)
	If (Type:C295($1)=Is text:K8:3)
		$form:=$1
		If (Type:C295($2)=Is text:K8:3)
			$CurrentHelp:=$2
			
			EXECUTE METHOD IN SUBFORM:C1085($form; "SearchPicker__SET_HELPTEXT"; *; $CurrentHelp)
			
		Else 
			$ErrorText:=Localized string:C991("Errors_TextParameter")
			$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
			ALERT:C41($ErrorText)
		End if 
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
