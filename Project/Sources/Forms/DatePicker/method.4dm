C_DATE:C307($DisplayedDate)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  //usefull when the widget is not in page 1 of the main form
		
		//only On Load
		DatePicker__InitInter
		DatePicker__InitForm
		
		If (<>DatePicker_ActivateArrows)
			DatePicker__ManageFocus(On Activate:K2:9)
		Else 
			DatePicker__ManageFocus(On Deactivate:K2:10)
		End if 
		
		
		If (<>DatePicker_GetBlob)  // called from subform button
			
			<>DatePicker_GetBlob:=False:C215
			DatePicker__GetBlob
			
			//If (Form#Null)
			//$DisplayedDate:=Form.displayDate  // 
			//Else 
			//$DisplayedDate:=!2000-01-01!  // just in case, to avoid errors (should NEVER happend)
			//End if 
			
		Else   // called from method DatePicker Display Dialog
			
			
			//  //Common code On Load / On bound variable change
			//$datePicker_Target:=DatePicker__GetTarget 
			//  // TM 2019-05-24 - don't use process variables to allow two instances.
			//$DisplayedDate:=$datePicker_Target->
			
		End if 
		
		If (Form:C1466#Null:C1517)  // called from "DateEntry" widget
			$DisplayedDate:=Form:C1466.displayDate  // 
		Else 
			$DisplayedDate:=DatePicker__GetTarget
		End if 
		
		$DisplayedDate:=DatePicker__SetSelectedDate($DisplayedDate; "")
		DatePicker__CalculateFirstDay($DisplayedDate; "")
		
		DatePicker__RedrawCalendar
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		//Common code On Load / On bound variable change
		
		$DisplayedDate:=DatePicker__GetTarget
		$DisplayedDate:=DatePicker__SetSelectedDate($DisplayedDate; "")
		DatePicker__CalculateFirstDay($DisplayedDate; "")
		DatePicker__RedrawCalendar
		
	: ((Form event code:C388=On Activate:K2:9) | (Form event code:C388=On Deactivate:K2:10))
		
		DatePicker__ManageFocus(Form event code:C388)
		
End case 
