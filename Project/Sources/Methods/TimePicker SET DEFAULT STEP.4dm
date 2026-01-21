//%attributes = {"invisible":true,"shared":true}
#DECLARE($time : Time)

If (Count parameters:C259=1)
	
	Case of 
			
			//________________________________________________________________________________
		: ($time<?00:01:00?)
			
			$time:=?00:01:00?
			
			//________________________________________________________________________________
		: ($time>?01:00:00?)
			
			$time:=?01:00:00?
			
			//________________________________________________________________________________
		Else 
			
			$time:=3600/Round:C94(3600/$time; 0)
			
			//________________________________________________________________________________
	End case 
	
	<>TimePicker_Step:=$time
	
Else 
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
End if 