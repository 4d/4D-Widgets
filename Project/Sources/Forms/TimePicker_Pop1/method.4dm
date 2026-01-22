Case of 
		
		//________________________________________________________________________________
	: (Form event code:C388=On Load:K2:1)
		
		TimePicker__InitInter
		TimePicker__InitForm
		
		OBJECT SET VALUE:C1742("AMlabel"; "<none>")
		OBJECT SET VALUE:C1742("PMlabel"; "<none>")
		TimePicker__BuildPopup
		
		TimePicker SET LABEL AM(""; "toto")
		
		// Common code
		var $CurrentTime : Time:=TimePicker__GetTarget
		$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime; "")
		TimePicker__DisplayTimePopups(False:C215)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  // Usefull when the widget is not in page 1 of the main form
		
		//________________________________________________________________________________
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		// Common code
		$CurrentTime:=TimePicker__GetTarget
		$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime; "")
		TimePicker__DisplayTimePopups(False:C215)
		
		//________________________________________________________________________________
End case 