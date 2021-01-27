//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_LONGINT:C283($Event)

$Event:=$1

Case of 
	: ($Event=On Activate:K2:9)
		OBJECT SET VISIBLE:C603(*;"DummyBtn@";True:C214)
		OBJECT SET ENABLED:C1123(*;"DummyBtn@";True:C214)
		
	: ($Event=On Deactivate:K2:10)
		OBJECT SET VISIBLE:C603(*;"DummyBtn@";False:C215)
		OBJECT SET ENABLED:C1123(*;"DummyBtn@";False:C215)
		
End case 
