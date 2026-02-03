Case of 
		
		// ________________________________________________________________________________
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  // Usefull when the widget is not in page 1 of the main form
		
		// Only On Load
		DatePicker__InitInter
		DatePicker__InitForm
		
		If (Bool:C1537(Form:C1466.useArrows))
			
			OBJECT SET SHORTCUT:C1185(*; "cancel"; Shortcut with Escape:K75:20)
			
			DatePicker__ManageFocus(On Activate:K2:9)
			
		Else 
			
			DatePicker__ManageFocus(On Deactivate:K2:10)
			
		End if 
		
		If (<>DatePicker_GetBlob)  // Called from subform button
			
			<>DatePicker_GetBlob:=False:C215
			DatePicker__GetBlob
			
		Else 
			
			// Called from method DatePicker Display Dialog
			
		End if 
		
		If (Form:C1466#Null:C1517)  // Called from "DateEntry" widget
			
			var $DisplayedDate : Date:=Form:C1466.displayDate  // 
			
		Else 
			
			$DisplayedDate:=DatePicker__GetTarget
			
		End if 
		
		$DisplayedDate:=DatePicker__SetSelectedDate($DisplayedDate; "")
		DatePicker__CalculateFirstDay($DisplayedDate; "")
		
		DatePicker__RedrawCalendar
		
		// ________________________________________________________________________________
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		// Common code On Load / On bound variable change
		$DisplayedDate:=DatePicker__GetTarget
		$DisplayedDate:=DatePicker__SetSelectedDate($DisplayedDate; "")
		DatePicker__CalculateFirstDay($DisplayedDate; "")
		DatePicker__RedrawCalendar
		
		// ________________________________________________________________________________
	: ((Form event code:C388=On Activate:K2:9)\
		 | (Form event code:C388=On Deactivate:K2:10))
		
		DatePicker__ManageFocus(Form event code:C388)
		
		// ________________________________________________________________________________
End case 