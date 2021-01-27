//%attributes = {"invisible":true,"shared":true}

C_DATE:C307($1)  // Max date

C_TEXT:C284($ErrorText)

DatePicker__InitInter 

If (Count parameters:C259=1)
	
	
	If (Type:C295($1)=Is date:K8:7)
		
		If ($1><>DatePicker_DateMin) | (<>DatePicker_DateMin=!00-00-00!)
			<>DatePicker_DateMax:=$1
		End if 
		
	Else 
		  //pas une date 
		$ErrorText:=Get localized string:C991("Errors_DateParameter")
		$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
	
Else 
	  //incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
