//%attributes = {"invisible":true,"shared":true}
#DECLARE($dayNo : Integer)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

If ($dayNo>=1) && ($dayNo<=7)
	
	<>DatePicker_FirstDayOfWeek:=$dayNo
	
End if 