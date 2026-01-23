//%attributes = {"invisible":true,"shared":true}
#DECLARE($time : Time)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

If ($time<=<>TimePicker_TimeMax)  // MIN must me inferior or equal to timeMAX
	
	<>TimePicker_TimeMin:=$time
	
End if 