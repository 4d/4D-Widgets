//%attributes = {}
var $e:=FORM Event:C1606

//Try

Case of 
		
		//________________________________________________________________________________
	: ($e.code=On Load:K2:1)
		
		Form:C1466.Init()
		
		//________________________________________________________________________________
	: ($e.code=On Bound Variable Change:K2:52)
		
		Form:C1466.Update()
		
		//________________________________________________________________________________
End case 

//Catch

//ALERT(Last errors.extract("message").join("\r"))

//End try