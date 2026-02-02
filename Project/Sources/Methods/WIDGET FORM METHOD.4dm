//%attributes = {"invisible":true}
var $e:=FORM Event:C1606

If (Structure file:C489=Structure file:C489(*))  // DEV
	
	Form:C1466.handleEvents($e)
	
	return 
	
End if 

If ($e.code=On Load:K2:1)
	
	Try
		
		Form:C1466.handleEvents($e)
		
	Catch
		
		var $t:=Current form name:C1298
		
		Case of 
				
				// ______________________________________________________
			: ($t="TimeEntry@")\
				 || ($t="TimePicker@")
				
				ALERT:C41("The type of the "+$t+" widget container must be numeric, time, or undefined.")
				
				// ______________________________________________________
			: ($t="DateEntry@")\
				 || ($t="DatePicker@")
				
				ALERT:C41("The type of the "+$t+" widget container must be numeric, date, or undefined.")
				
				// ______________________________________________________
			Else 
				
				ALERT:C41(Last errors:C1799.extract("message").join("\r"))
				
				// ______________________________________________________
		End case 
		
		// Hide all objects
		OBJECT SET VISIBLE:C603(*; "@"; False:C215)
		
	End try
	
Else 
	
	Try(Form:C1466.handleEvents($e))
	
End if 
