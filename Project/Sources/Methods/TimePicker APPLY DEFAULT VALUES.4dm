//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

TimePicker SET MIN TIME($widget; <>TimePicker_TimeMin)
TimePicker SET MAX TIME($widget; <>TimePicker_TimeMax)
TimePicker SET LABEL AM($widget; <>TimePicker_LabelAM)
TimePicker SET LABEL PM($widget; <>TimePicker_LabelPM)
TimePicker SET STEP($widget; <>TimePicker_Step)