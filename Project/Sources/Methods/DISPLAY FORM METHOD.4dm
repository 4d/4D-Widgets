//%attributes = {"invisible":true}
// ----------------------------------------------------
// Form method : clock
// Created 26/09/08 by vdl
// ----------------------------------------------------
// Modified 06-5-2013 by Roland Lannuzel
// variables renamed
// test of bound variable type
// added to widgets and picture library
// ----------------------------------------------------
// Modified 22-01-2025 by vdl
// Code modernization
// ----------------------------------------------------
var $e:=FORM Event:C1606

Try
	
	Case of 
			
			// __________________________________________________________________________________
		: ($e.code=On Load:K2:1)
			
			OBJECT SET VALUE:C1742("gClock"; Form:C1466.getClock())
			
			Form:C1466.callParent()
			
			// __________________________________________________________________________________
		: ($e.code=On Bound Variable Change:K2:52)
			
			SET TIMER:C645(-1)
			
			// __________________________________________________________________________________
		: ($e.code=On Timer:K2:25)
			
			SET TIMER:C645(0)
			
			Form:C1466.Update()
			
			// __________________________________________________________________________________
	End case 
	
Catch
	
	ALERT:C41(Last errors:C1799.extract("message").join("\r"))
	
End try