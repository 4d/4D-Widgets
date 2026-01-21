//%attributes = {"invisible":true}
var $1 : Integer
var $Event : Integer
var $Visible : Boolean

$Event:=$1

Case of 
	: ($Event=On Activate:K2:9)
		$Visible:=True:C214
		GOTO OBJECT:C206(*; "HoursEntry")
		
	: ($Event=On Deactivate:K2:10)
		$Visible:=False:C215
End case 

OBJECT SET VISIBLE:C603(*; "FocusRing@"; $Visible)
OBJECT SET VISIBLE:C603(*; "bUp@"; $Visible)
OBJECT SET VISIBLE:C603(*; "bDown@"; $Visible)
OBJECT SET VISIBLE:C603(*; "bUpDown"; $Visible)


