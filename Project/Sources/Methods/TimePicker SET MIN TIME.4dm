//%attributes = {"invisible":true,"shared":true}
#DECLARE($Form : Text; $minTime : Time)

If (Count parameters:C259<2)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

TimePicker__InitInter

// Get the max time of the form
var $maxTime : Time
Tool_ObjectToVar("MaxTime"; ->$maxTime; $Form)

// Then set the min time only if <= to maxtime
If (($minTime<=$maxTime)\
 | ($maxTime=?00:00:00?))
	
	Tool_VarToObject(->$minTime; "MinTime"; $Form)
	
	If (Length:C16($Form)#0)
		
		EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__BuildPopup")  // If no popup in form does nothing
		EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__DisplayTimeInputs"; *; False:C215)  // If no HH MM SS entry zones does nothing
		EXECUTE METHOD IN SUBFORM:C1085($Form; "TimePicker__DisplayTimePopups"; *; False:C215)  // If no popup in form does nothing
		
	End if 
End if 