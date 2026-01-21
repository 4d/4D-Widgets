//%attributes = {"invisible":true}
var $1 : Text

var $CurrentHelp : Text
var $ErrorText : Text
var $searchObjectName : Text

If (Type:C295($1)=Is text:K8:3) | (Type:C295($1)=Is alpha field:K8:1)
	
	SearchPicker__InitInter
	
	$CurrentHelp:=$1
	
	If (Is Windows:C1573)
		$searchObjectName:="SearchText_Win"
	Else   //macintosh
		$searchObjectName:="SearchText_Mac"
	End if 
	
	OBJECT SET PLACEHOLDER:C1295(*; $searchObjectName; $CurrentHelp)
	
Else 
	
	$ErrorText:=Localized string:C991("Errors_TextParameter")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 






