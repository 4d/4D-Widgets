//%attributes = {"invisible":true,"shared":true}
#DECLARE($form : Text; $time : Time)

If (Count parameters:C259<2)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

TimePicker__InitInter

Case of 
		
		//________________________________________________________________________________
	: ($time<?00:01:00?)
		
		$time:=?00:01:00?
		
		//________________________________________________________________________________
	: ($time>?01:00:00?)
		
		$time:=?01:00:00?
		
		//________________________________________________________________________________
	Else 
		
		$time:=3600/Round:C94(3600/$time; 0)
		
		//________________________________________________________________________________
End case 

Tool_VarToObject(->$time; "Step"; $form)

If (Length:C16($form)#0)
	
	EXECUTE METHOD IN SUBFORM:C1085($form; Formula:C1597(TimePicker__BuildPopup))
	EXECUTE METHOD IN SUBFORM:C1085($form; Formula:C1597(TimePicker__DisplayTimePopups); *; False:C215)  // If no popup in form does nothing
	EXECUTE METHOD IN SUBFORM:C1085($form; Formula:C1597(TimePicker__DisplayTimeInputs); *; False:C215)  // If no HH MM SS entry zones does nothing
	
End if 