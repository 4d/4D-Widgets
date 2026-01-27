//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text; $label : Text)

If (Count parameters:C259<2)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

// Do not allow if the widget should not display the label
var $current : Text
EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.PM); $current)

If (Length:C16($current)=0)\
 || ($current="<none>")
	
	return 
	
End if 

EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.PM:=$1); *; $label)
EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(Form:C1466.Display()))

If (False:C215)
	
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(TimePicker__BuildPopup))  // If no popup in form does nothing
	//EXECUTE METHOD IN SUBFORM($widget; Formula(TimePicker__DisplayTimePopups); *; False)  // If no popup in form does nothing
	
End if 