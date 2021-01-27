//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($2)  //destination parent form if provided

C_TEXT:C284($CurrentText)
C_TEXT:C284($Form)
C_TEXT:C284($ErrorText)
C_TEXT:C284($SearchObjectName)

C_POINTER:C301($Target)

If (Type:C295($1)=Is text:K8:3) | (Type:C295($1)=Is alpha field:K8:1)
	
	SearchPicker__InitInter 
	
	$CurrentText:=$1
	
	If (Count parameters:C259>=2)  //for a specific parent subform object OR current form 
		$Form:=$2
		
		If (Is Windows:C1573)
			$SearchObjectName:="SearchText_Win"
		Else   //macintosh
			$SearchObjectName:="SearchText_Mac"
		End if 
		
		Tool_VarToObject (->$CurrentText;$SearchObjectName;$Form)
		
		$Target:=SearchPicker__GetTarget 
		If (Not:C34(Is nil pointer:C315($Target)))
			$Target->:=$CurrentText
		End if 
		
	Else 
		
	End if 
	
Else 
	
	$ErrorText:=Get localized string:C991("Errors_TextParameter")
	$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 












