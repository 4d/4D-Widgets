//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

Use (Storage:C1525)
	
	Use (Storage:C1525.time)
		
		TimePicker SET MIN TIME($widget; Storage:C1525.time.minTime)
		TimePicker SET MAX TIME($widget; Storage:C1525.time.maxTime)
		TimePicker SET LABEL AM($widget; Storage:C1525.time.AM)
		TimePicker SET LABEL PM($widget; Storage:C1525.time.PM)
		TimePicker SET STEP($widget; Storage:C1525.time.step)
		
	End use 
End use 