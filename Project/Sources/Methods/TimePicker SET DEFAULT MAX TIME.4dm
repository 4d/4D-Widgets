//%attributes = {"invisible":true,"shared":true}
#DECLARE($time : Time)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

If ($time>=<>TimePicker_TimeMin)  // MAX must me superior or equal to timeMIN
	
	<>TimePicker_TimeMax:=$time
	
End if 