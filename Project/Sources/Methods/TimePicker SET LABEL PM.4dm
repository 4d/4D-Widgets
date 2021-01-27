//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)  //destination form 
C_TEXT:C284($2)  // label

C_TEXT:C284($Form)
C_TEXT:C284($Label)
C_TEXT:C284($ErrorText)

If (Count parameters:C259=2)
	If (Type:C295($1)=Is text:K8:3)
		$Form:=$1
		If (Type:C295($2)=Is text:K8:3)
			$Label:=$2
			
			TimePicker__InitInter 
			
			Tool_VarToObject (->$Label;"PMlabel";$Form)
			
			If ($Form#"")
				EXECUTE METHOD IN SUBFORM:C1085($Form;"TimePicker__BuildPopup")  //  If no popup in form does nothing
				EXECUTE METHOD IN SUBFORM:C1085($Form;"TimePicker__DisplayTimeInputs";*;False:C215)  //  if no HH MM SS entry zones does nothing
				EXECUTE METHOD IN SUBFORM:C1085($Form;"TimePicker__DisplayTimePopups";*;False:C215)  //  If no popup in form does nothing
			End if 
			
		Else 
			$ErrorText:=Get localized string:C991("Errors_TextParameter")
			$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
			ALERT:C41($ErrorText)
		End if 
	Else 
		$ErrorText:=Get localized string:C991("Errors_TextParameter")
		$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
Else 
	  //incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
	ALERT:C41($ErrorText)
End if 
