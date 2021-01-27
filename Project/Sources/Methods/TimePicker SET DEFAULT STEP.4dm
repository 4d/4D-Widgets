//%attributes = {"invisible":true,"shared":true}
C_TIME:C306($1)
C_TIME:C306($Time)

C_TEXT:C284($ErrorText)

If (Count parameters:C259=1)
	If (Type:C295($1)=Is time:K8:8)
		
		$Time:=$1
		Case of 
			: ($Time<?00:01:00?)
				$Time:=?00:01:00?
			: ($Time>?01:00:00?)
				$Time:=?01:00:00?
			Else 
				$Time:=3600/Round:C94(3600/$Time;0)
		End case 
		
		
		<>TimePicker_Step:=$Time
	Else 
		$ErrorText:=Get localized string:C991("Errors_TimeParameter")
		$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
Else 
	  //incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
