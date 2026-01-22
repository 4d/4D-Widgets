//%attributes = {"invisible":true,"shared":true}
#DECLARE($form : Text)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	return 
	
End if 

TimePicker__InitInter

TimePicker SET MIN TIME($form; <>TimePicker_TimeMin)
TimePicker SET MAX TIME($form; <>TimePicker_TimeMax)
TimePicker SET LABEL AM($form; <>TimePicker_LabelAM)
TimePicker SET LABEL PM($form; <>TimePicker_LabelPM)
TimePicker SET STEP($form; <>TimePicker_Step)

If (Length:C16($form)#0)
	
	EXECUTE METHOD IN SUBFORM:C1085($form; Formula:C1597(TimePicker__DisplayTimeInputs); *; False:C215)  // If no HH MM SS entry zones does nothing
	EXECUTE METHOD IN SUBFORM:C1085($form; Formula:C1597(TimePicker__DisplayTimePopups); *; False:C215)  // If no popup in form does nothing
	
End if 