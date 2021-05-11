//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_LONGINT:C283($Event)
C_BOOLEAN:C305($Visible)

$Event:=$1

Case of 
	: ($Event=On Activate:K2:9)
		$Visible:=True:C214
		
	: ($Event=On Deactivate:K2:10)
		$Visible:=False:C215
End case 


OBJECT SET VISIBLE:C603(*; "FocusRing@"; $Visible)
OBJECT SET VISIBLE:C603(*; "bRuler@"; $Visible)
OBJECT SET VISIBLE:C603(*; "bTinyCalendar@"; $Visible)
OBJECT SET VISIBLE:C603(*; "bUp@"; $Visible)
OBJECT SET VISIBLE:C603(*; "bDown@"; $Visible)


