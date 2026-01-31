//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text; $step : Time)

If (Count parameters:C259<2)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

Case of 
		
		// ________________________________________________________________________________
	: ($step<?00:01:00?)
		
		$step:=?00:01:00?
		
		// ________________________________________________________________________________
	: ($step>?01:00:00?)
		
		$step:=?01:00:00?
		
		// ________________________________________________________________________________
	Else 
		
		$step:=3600/Round:C94(3600/$step; 0)
		
		// ________________________________________________________________________________
End case 

EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.step:=$1); *; $step)

Try
	
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.buildPopup()))
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.Display()))
	
End try