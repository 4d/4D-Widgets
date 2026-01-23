//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text; $label : Text)

If (Count parameters:C259<2)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

TimePicker__InitInter

// Do not allow if the widget should not display the label
If (objectGetValue("PMlabel"; $widget)="<none>")
	
	return 
	
End if 

objectSetValue("PMlabel"; $label; $widget)

EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(TimePicker__BuildPopup))  // If no popup in form does nothing
EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(TimePicker__DisplayTimeInputs); *; False:C215)  // If no HH MM SS entry zones does nothing
EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(TimePicker__DisplayTimePopups); *; False:C215)  // If no popup in form does nothing