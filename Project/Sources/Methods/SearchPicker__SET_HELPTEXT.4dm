//%attributes = {"invisible":true}
C_TEXT:C284($1)

C_TEXT:C284($CurrentHelp)
C_TEXT:C284($ErrorText)
C_TEXT:C284($SearchObjectName)

If (Type:C295($1)=Is text:K8:3) | (Type:C295($1)=Is alpha field:K8:1)
	
	SearchPicker__InitInter 
	
	$CurrentHelp:=$1
	
	If (Is Windows:C1573)
		$SearchObjectName:="SearchText_Win"
	Else   //macintosh
		$SearchObjectName:="SearchText_Mac"
	End if 
	
	OBJECT SET PLACEHOLDER:C1295(*;$SearchObjectName;$CurrentHelp)
	
Else 
	
	$ErrorText:=Get localized string:C991("Errors_TextParameter")
	$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 






