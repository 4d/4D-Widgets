//%attributes = {"invisible":true,"shared":true}
#DECLARE($Form : Text; $maxTime : Time)

If (Count parameters:C259<2)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

TimePicker__InitInter

// Get the min time of the form
var $minTime : Time
Tool_ObjectToVar("MinTime"; ->$minTime; $Form)

// Then set the min time only if <= to maxtime
If (($maxTime>=$minTime)\
 | ($minTime=?00:00:00?))
	
	Tool_VarToObject(->$maxTime; "MaxTime"; $Form)
	
	If (Length:C16($Form)#0)
		
		EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__BuildPopup")  // If no popup in form does nothing
		EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__DisplayTimeInputs"; *; False:C215)  // If no HH MM SS entry zones does nothing
		EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__DisplayTimePopups"; *; False:C215)  // If no popup in form does nothing
		
	End if 
End if 