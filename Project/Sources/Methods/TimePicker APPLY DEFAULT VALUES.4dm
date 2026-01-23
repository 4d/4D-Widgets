//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

TimePicker__InitInter

TimePicker SET MIN TIME($widget; <>TimePicker_TimeMin)
TimePicker SET MAX TIME($widget; <>TimePicker_TimeMax)
TimePicker SET LABEL AM($widget; <>TimePicker_LabelAM)
TimePicker SET LABEL PM($widget; <>TimePicker_LabelPM)
TimePicker SET STEP($widget; <>TimePicker_Step)

EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(TimePicker__DisplayTimeInputs); *; False:C215)  // If no HH MM SS entry zones does nothing
EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(TimePicker__DisplayTimePopups); *; False:C215)  // If no popup in form does nothing