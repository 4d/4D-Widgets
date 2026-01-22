//%attributes = {"invisible":true,"shared":true}
#DECLARE($form : Text; $Label : Text)

If (Count parameters:C259<2)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

TimePicker__InitInter

var $current : Text
Tool_ObjectToVar("PMlabel"; ->$current)

If ($current="<none>")
	
	return 
	
End if 

Tool_VarToObject(->$Label; "PMlabel"; $form)

If (Length:C16($form)#0)
	
	EXECUTE METHOD IN SUBFORM:C1085($form; Formula:C1597(TimePicker__BuildPopup))  // If no popup in form does nothing
	EXECUTE METHOD IN SUBFORM:C1085($form; Formula:C1597(TimePicker__DisplayTimeInputs); *; False:C215)  // If no HH MM SS entry zones does nothing
	EXECUTE METHOD IN SUBFORM:C1085($form; Formula:C1597(TimePicker__DisplayTimePopups); *; False:C215)  // If no popup in form does nothing
	
Else 
	
	TimePicker__BuildPopup
	TimePicker__DisplayTimeInputs(False:C215)
	TimePicker__DisplayTimePopups(False:C215)
	
End if 