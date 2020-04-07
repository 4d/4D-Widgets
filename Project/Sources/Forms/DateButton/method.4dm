C_DATE:C307($SelectedDate)
C_POINTER:C301($datePicker_Target)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  //usefull when the widget is not in page 1 of the main form
		
		DatePicker__InitInter 
		DatePicker__InitForm 
		
		  // Common code On Load / On bound variable change
		
		$datePicker_Target:=DatePicker__GetTarget 
		  // TM 2019-05-24 - don't use process variables to allow two instances.
		$SelectedDate:=$datePicker_Target->
		$SelectedDate:=DatePicker__SetSelectedDate ($SelectedDate;"")
		
		DatePicker__CalculateFirstDay ($SelectedDate;"")
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		  // Common code On Load / On bound variable change
		
		$datePicker_Target:=DatePicker__GetTarget 
		$SelectedDate:=$datePicker_Target->
		$SelectedDate:=DatePicker__SetSelectedDate ($SelectedDate;"")
		
		DatePicker__CalculateFirstDay ($SelectedDate;"")
		
End case 