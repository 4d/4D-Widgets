//%attributes = {"invisible":true,"shared":true}
#DECLARE($time : Time)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

// MIN must me inferior or equal to timeMAX
Use (Storage:C1525)
	
	Use (Storage:C1525.time)
		
		If ($time<=Storage:C1525.time.maxTime)
			
			Storage:C1525.time.minTime:=$time
			
		End if 
	End use 
End use 