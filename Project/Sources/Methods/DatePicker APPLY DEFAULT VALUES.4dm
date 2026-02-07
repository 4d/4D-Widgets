//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

Try
	
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.applyDefaultValues()))
	
End try
