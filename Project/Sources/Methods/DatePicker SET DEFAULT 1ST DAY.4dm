//%attributes = {"invisible":true,"shared":true}

C_LONGINT:C283($1)  //number of the day (as contant like monday)

C_LONGINT:C283($FirstDayOfWeek)
C_TEXT:C284($ErrorText)

DatePicker__InitInter 


If (Count parameters:C259=1)
	
	If (Type:C295($1)=Is longint:K8:6)
		$FirstDayOfWeek:=$1
		
		If ($FirstDayOfWeek>=1) & ($FirstDayOfWeek<=7)
			
			<>DatePicker_FirstDayOfWeek:=$FirstDayOfWeek
		Else 
			  //invalid parameter
		End if 
		
	Else 
		$ErrorText:=Get localized string:C991("Errors_LongIntParameter")
		$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
	
Else 
	  //incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 