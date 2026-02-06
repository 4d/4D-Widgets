//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text; $type : Integer; $values : Pointer)

// Name of the widget
// Type of days off (0 = repeated each week, 1 = repeated earch year , 2 = only once)
// Pointer on booelan or date array

If (Count parameters:C259<3)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

Try
	
	var $c:=[]
	ARRAY TO COLLECTION:C1563($c; $values->)
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.setDaysOff($1; $2)); *; $type; $c)
	
End try