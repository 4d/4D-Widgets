// ----------------------------------------------------
// Form method : clock
// Created 26/09/08 by vdl
// ----------------------------------------------------
// Modified #06-5-2013 by Roland Lannuzel
// Variables renames
// Test of bound variable type
// Added to widgets and picture library
// ----------------------------------------------------
// Modified 22-01-2025 by vdl
// Code modernization
// ----------------------------------------------------
var $e:=FORM Event:C1606

Case of 
		
		// __________________________________________________________________________________
	: ($e.code=On Load:K2:1)
		
		OBJECT SET VALUE:C1742("gClock"; Form:C1466.getClock())
		
		CALL SUBFORM CONTAINER:C1086((-1)*On Load:K2:1)
		SET TIMER:C645(-1)
		
		// __________________________________________________________________________________
	: ($e.code=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-1)
		
		// __________________________________________________________________________________
	: ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		Form:C1466.update()
		
		// __________________________________________________________________________________
End case 