Case of 
		//: (Form event code=On Getting Focus)
		//OBJECT SET RGB COLORS(*; "FocusRingBackGround"; "grey"; Background color)
		
		//: (Form event code=On Losing Focus)
		//OBJECT SET RGB COLORS(*; "FocusRingBackGround"; "silver"; Background color)
		
		
	: (Form event code:C388=On Data Change:K2:15)
		TimePicker__DisplayTimeInputs(True:C214)
End case 

