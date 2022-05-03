//%attributes = {"invisible":true,"shared":true}

C_TEXT:C284($1)  //destination form 
C_TIME:C306($2)  // Step

C_TEXT:C284($Form)
C_TEXT:C284($ErrorText)

C_TIME:C306($time)

If (Count parameters:C259=2)
	If (Type:C295($1)=Is text:K8:3)
		$Form:=$1
		If (Type:C295($2)=Is time:K8:8)
			$time:=$2
			
			TimePicker__InitInter
			
			Case of 
				: ($time<?00:01:00?)
					$time:=?00:01:00?
				: ($time>?01:00:00?)
					$time:=?01:00:00?
				Else 
					$time:=3600/Round:C94(3600/$time; 0)
			End case 
			
			Tool_VarToObject(->$time; "Step"; $Form)
			
			If ($Form#"")
				
				EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__BuildPopup")
				EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__DisplayTimePopups"; *; False:C215)  //  If no popup in form does nothing
				EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__DisplayTimeInputs"; *; False:C215)  //  if no HH MM SS entry zones does nothing
				
			End if 
			
		Else 
			$ErrorText:=Get localized string:C991("Errors_TimeParameter")
			$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
			ALERT:C41($ErrorText)
		End if 
	Else 
		$ErrorText:=Get localized string:C991("Errors_TextParameter")
		$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
Else 
	//incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
End if 
