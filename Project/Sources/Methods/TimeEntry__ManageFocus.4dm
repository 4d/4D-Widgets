//%attributes = {"invisible":true}
#DECLARE($Event : Integer)

Case of 
		
		//________________________________________________________________________________
	: ($Event=On Activate:K2:9)
		
		var $Visible:=True:C214
		GOTO OBJECT:C206(*; "HoursEntry")
		
		//________________________________________________________________________________
	: ($Event=On Deactivate:K2:10)
		
		$Visible:=False:C215
		
		//________________________________________________________________________________
End case 

OBJECT SET VISIBLE:C603(*; "FocusRing@"; $Visible)
OBJECT SET VISIBLE:C603(*; "bUp@"; $Visible)
OBJECT SET VISIBLE:C603(*; "bDown@"; $Visible)
OBJECT SET VISIBLE:C603(*; "bUpDown"; $Visible)