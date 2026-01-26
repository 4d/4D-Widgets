//TimePickerSingle AM

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		// declare the variable here or anywhere else in your own code
		
		// then if needed, customize the time picker
		// default values are Min = 8:00 Max = 20:00  Step = 0:15 
		//  All exemples below are inactivated (if false)
		var $Customise:=False:C215
		
		If ($Customise)
			//use current object (if you don't the methods will change default values of time pickers)
			
			var $ObjectName:=OBJECT Get name:C1087(Object current:K67:2)
			
			TimePicker SET MIN TIME($ObjectName; ?10:00:00?)
			TimePicker SET MAX TIME($ObjectName; ?16:00:00?)
			
		End if 
		
End case 
