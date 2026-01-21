//%attributes = {"invisible":true,"shared":true}


var $1 : Text  //destination form (MUST be provided)

var $Form : Text
var $ErrorText : Text

If (Count parameters:C259=1)
	
	If (Type:C295($1)=Is text:K8:3)
		$Form:=$1
		
		TimePicker__InitInter  //just in case a "DISPOSE had been called before
		
		TimePicker SET MIN TIME($Form; <>TimePicker_TimeMin)
		TimePicker SET MAX TIME($Form; <>TimePicker_TimeMax)
		TimePicker SET LABEL AM($Form; <>TimePicker_LabelAM)
		TimePicker SET LABEL PM($Form; <>TimePicker_LabelPM)
		TimePicker SET STEP($Form; <>TimePicker_Step)
		
		
		If ($Form#"")
			EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__DisplayTimeInputs"; *; False:C215)  //  if no HH MM SS entry zones does nothing
			EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__DisplayTimePopups"; *; False:C215)  //  If no popup in form does nothing
		End if 
		
	Else 
		//not a text
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


