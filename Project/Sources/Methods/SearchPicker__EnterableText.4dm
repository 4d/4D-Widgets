//%attributes = {"invisible":true}
var $CurrentText : Text
var $scheme; $focus; $notFocus : Text


$scheme:=FORM Get color scheme:C1761
If ($scheme="dark")
	$focus:="silver"
	$notFocus:="grey"
Else 
	$focus:="grey"
	$notFocus:="silver"
End if 

Case of 
		
	: (Form event code:C388=On After Edit:K2:43)
		
		$CurrentText:=Get edited text:C655
		SearchPicker__SET_TEXT($CurrentText; "")
		
	: (Form event code:C388=On Getting Focus:K2:7)
		OBJECT SET RGB COLORS:C628(*; "BgndRing@"; $focus; Background color:K23:2)
		
	: (Form event code:C388=On Losing Focus:K2:8)
		OBJECT SET RGB COLORS:C628(*; "BgndRing@"; $notFocus; Background color:K23:2)
		
End case 

SearchPicker__SetInterface

