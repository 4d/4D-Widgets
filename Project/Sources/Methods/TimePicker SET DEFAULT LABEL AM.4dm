//%attributes = {"invisible":true,"shared":true}
#DECLARE($label : Text)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

<>TimePicker_LabelAM:=$label