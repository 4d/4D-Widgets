//%attributes = {"invisible":true}
#DECLARE($eventCode : Integer)

Case of 
		
		//________________________________________________________________________________
	: ($eventCode=On Activate:K2:9)
		
		var $Visible:=True:C214
		GOTO OBJECT:C206(*; "hours")
		
		//________________________________________________________________________________
	: ($eventCode=On Deactivate:K2:10)
		
		$Visible:=False:C215
		
		//________________________________________________________________________________
End case 

OBJECT SET VISIBLE:C603(*; "FocusRing@"; $Visible)
OBJECT SET VISIBLE:C603(*; "up"; $Visible)
OBJECT SET VISIBLE:C603(*; "down"; $Visible)
OBJECT SET VISIBLE:C603(*; "stepper"; $Visible)