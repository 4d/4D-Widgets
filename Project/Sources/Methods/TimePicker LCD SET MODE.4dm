//%attributes = {"invisible":true,"shared":true}
#DECLARE($subFormName : Text; $mode : Integer)

If (Count parameters:C259>=2)
	
	EXECUTE METHOD IN SUBFORM:C1085($subFormName; Formula:C1597(TimePicker__LCD SET MODE).source; *; $mode)
	
Else 
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
End if 