//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text; $on : Boolean)

If (Count parameters:C259<1)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

If ($on)
	
	var $mode : Integer
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(OBJECT Get value:C1743("mode")); $mode)
	
	$on:=$mode=12
	
End if 

EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(OBJECT SET VALUE:C1742("withAMPM"; $on)))
EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(OBJECT SET VALUE:C1742("redraw"; True:C214)))
EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(SET TIMER:C645(-1)))