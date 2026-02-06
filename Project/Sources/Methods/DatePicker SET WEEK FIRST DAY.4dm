//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text; $firstDay : Integer)

If (Count parameters:C259<1)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

Try
	
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.setFirstDayOffWeek($1)); *; $firstDay)
	
End try