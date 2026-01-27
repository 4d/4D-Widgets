//%attributes = {"invisible":true}
var $e:=FORM Event:C1606

Try
	Case of 
			
			//________________________________________________________________________________
		: ($e.code=On Load:K2:1)
			
			Form:C1466.Init()
			
			//________________________________________________________________________________
		: ($e.code=On Bound Variable Change:K2:52)
			
			Form:C1466.Update()
			
			//________________________________________________________________________________
		: ($e.code=On Activate:K2:9)\
			 || ($e.code=On Deactivate:K2:10)
			
			Form:C1466.ManageFocus($e)
			
			//________________________________________________________________________________
	End case 
	
Catch
	
	ALERT:C41(".The type of the time selector must be numeric, time, or undefined.")
	OBJECT SET VISIBLE:C603(*; "@"; False:C215)
	
End try