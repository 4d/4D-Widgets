//%attributes = {"invisible":true,"shared":true}

C_TEXT:C284($1)  //destination form 
C_BOOLEAN:C305($2)  //true or false

C_TEXT:C284($Form)
C_TEXT:C284($ErrorText)
C_TEXT:C284($searchObjectName)

C_BOOLEAN:C305($Enterable)

If (Count parameters:C259=2)
	If (Type:C295($1)=Is text:K8:3)
		$Form:=$1
		If (Type:C295($2)=Is boolean:K8:9)
			$Enterable:=$2
			
			If (Is Windows:C1573)
				$searchObjectName:="SearchText_Win"
			Else   //macintosh
				$searchObjectName:="SearchText_Mac"
			End if 
			
			EXECUTE METHOD IN SUBFORM:C1085($Form; "SearchPicker__SET_ENTERABLE"; *; $searchObjectName; $Enterable)
			
		Else 
			$ErrorText:=Get localized string:C991("Errors_TextParameter")
			$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
			ALERT:C41($ErrorText)
		End if 
	Else 
		$ErrorText:=Get localized string:C991("Errors_BooleanParameter")
		$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
Else 
	//incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
