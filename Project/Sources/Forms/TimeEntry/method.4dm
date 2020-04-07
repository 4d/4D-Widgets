C_POINTER:C301($Target)
C_TIME:C306($CurrentTime)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  //usefull when the widget is not in page 1 of the main form
		
		TimePicker__InitInter 
		TimePicker__InitForm 
		
		$Target:=TimePicker__GetTarget 
		$CurrentTime:=$Target->
		$CurrentTime:=TimePicker__SetSelectedTime ($CurrentTime;"")
		TimePicker__DisplayTimeInputs (False:C215)
		
		
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		$Target:=TimePicker__GetTarget 
		$CurrentTime:=$Target->
		$CurrentTime:=TimePicker__SetSelectedTime ($CurrentTime;"")
		TimePicker__DisplayTimeInputs (False:C215)
		
	: (Form event code:C388=On Activate:K2:9) | (Form event code:C388=On Deactivate:K2:10)
		
		TimeEntry__ManageFocus (Form event code:C388)
		
		
End case 

