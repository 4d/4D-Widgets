//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($2)  //destination parent form if provided

C_TEXT:C284($CurrentText)
C_TEXT:C284($Form)
C_TEXT:C284($ErrorText)
C_TEXT:C284($searchObjectName)

C_POINTER:C301($target)

If (Type:C295($1)=Is text:K8:3) | (Type:C295($1)=Is alpha field:K8:1)
	
	SearchPicker__InitInter
	
	$CurrentText:=$1
	
	If (Count parameters:C259>=2)  //for a specific parent subform object OR current form 
		$Form:=$2
		
		If (Is Windows:C1573)
			$searchObjectName:="SearchText_Win"
		Else   //macintosh
			$searchObjectName:="SearchText_Mac"
		End if 
		
		Tool_VarToObject(->$CurrentText; $searchObjectName; $Form)
		
		
		SearchPicker__SetTarget($CurrentText)
		
		//$target:=SearchPicker__GetTarget
		//If (Not(Is nil pointer($target)))
		//$target->:=$CurrentText
		//End if 
		
	Else 
		
	End if 
	
Else 
	
	$ErrorText:=Get localized string:C991("Errors_TextParameter")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 












