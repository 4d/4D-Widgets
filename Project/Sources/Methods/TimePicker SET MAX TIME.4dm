//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text; $time : Time)

If (Count parameters:C259<2)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

TimePicker__InitInter

// Get the min time of the form
var $minTime : Time:=objectGetValue("MinTime"; $widget)

// Then set the min time only if <= to maxtime
If (($time>=$minTime)\
 || ($minTime=?00:00:00?))
	
	objectSetValue("MaxTime"; $time; $widget)
	
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(TimePicker__BuildPopup))  // If no popup in form does nothing
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(TimePicker__DisplayTimeInputs); *; False:C215)  // If no HH MM SS entry zones does nothing
	EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(TimePicker__DisplayTimePopups); *; False:C215)  // If no popup in form does nothing
	
End if 