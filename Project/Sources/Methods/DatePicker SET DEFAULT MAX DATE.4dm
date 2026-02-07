//%attributes = {"invisible":true,"shared":true}
#DECLARE($date : Date)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

If ($date><>DatePicker_DateMin)\
 | (<>DatePicker_DateMin=!00-00-00!)
	
	<>DatePicker_DateMax:=$date
	
End if 