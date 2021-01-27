//%attributes = {"invisible":true}
C_TEXT:C284($CurrentText;$FocusRing)

C_LONGINT:C283($Event)


$Event:=Form event code:C388

If (Is Windows:C1573)
	$FocusRing:=""
Else 
	$FocusRing:="FocusRing@"  //focus ring (visible or not depending on the focus)
End if 

Case of 
		
	: ($event=On After Edit:K2:43)
		
		$CurrentText:=Get edited text:C655
		SearchPicker__SET_TEXT ($CurrentText;"")
		
	: ($event=On Getting Focus:K2:7)
		
		OBJECT SET VISIBLE:C603(*;$FocusRing;True:C214)
		
	: ($event=On Losing Focus:K2:8)
		
		OBJECT SET VISIBLE:C603(*;$FocusRing;False:C215)
		
End case 

SearchPicker__SetInterface 

