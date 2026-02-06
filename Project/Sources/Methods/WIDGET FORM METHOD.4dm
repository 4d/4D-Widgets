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
				
				OBJECT SET TITLE:C194(*; "error"; "Bad container type")
				
				// ______________________________________________________
			: ($t="DateEntry@")
				
				OBJECT SET TITLE:C194(*; "error"; "Bad container type")
				
				// ______________________________________________________
			: ($t="DatePicker@")
				
				OBJECT SET TITLE:C194(*; "error"; Replace string:C233(Localized string:C991("dateInvalidContainerType"); "{name}"; $t))
				
				// ______________________________________________________
			Else 
				
				ALERT:C41(Last errors:C1799.extract("message").join("\r"))
				
				// ______________________________________________________
		End case 
		
		// Hide all objects
		OBJECT SET VISIBLE:C603(*; "@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "error"; True:C214)
		
	End try
	
Else 
	
	Try(Form:C1466.handleEvents($e))
	
End if 
