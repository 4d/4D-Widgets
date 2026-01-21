//%attributes = {"invisible":true,"shared":true}
#DECLARE($label : Text)

If (Count parameters:C259=1)
	
	<>TimePicker_LabelPM:=$label
	
Else 
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
End if 