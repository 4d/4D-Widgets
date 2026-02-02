//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text; $time : Time)

If (Count parameters:C259<2)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

// Set the min time only if <= to maxtime
var $maxTime : Time
EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.maxTime); $maxTime)

If (($time<=$maxTime)\
 || ($maxTime=?00:00:00?))
	
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.minTime:=$1); *; $time)
	
	Try
		
		EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.buildPopup()))
		EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.display()))
		
	End try
End if 