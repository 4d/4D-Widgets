C_DATE:C307($selectedDate)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  //usefull when the widget is not in page 1 of the main form
		
		DatePicker__InitInter
		DatePicker__InitForm
		
		// Common code On Load / On bound variable change
		
		$selectedDate:=DatePicker__GetTarget
		$selectedDate:=DatePicker__SetSelectedDate($selectedDate; "")
		
		DatePicker__CalculateFirstDay($selectedDate; "")
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		// Common code On Load / On bound variable change
		
		$selectedDate:=DatePicker__GetTarget
		$selectedDate:=DatePicker__SetSelectedDate($selectedDate; "")
		
		DatePicker__CalculateFirstDay($selectedDate; "")
		
End case 