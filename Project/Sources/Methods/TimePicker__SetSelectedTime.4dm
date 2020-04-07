//%attributes = {"invisible":true}
  //the method TimePicker__SetSelectedTime does the actions below

  // it receives a time as parameter

  // ••• IF a formname is passed
  // it makes this time conform with local constraints (min/max)
  // it saves this time localy
  // if the result is different from the binded variable, then the bind variable is uapdated

  // ••• IF a formname is NOT passed
  // it makes this time conform with local constraints (min/max)
  // it becames the default time


C_TIME:C306($1)  // Time
C_TEXT:C284($2)  //destination form 

C_TIME:C306($0)  // returned time (that MAY be different from received one)

C_TIME:C306($Time)
C_TIME:C306($ReturnedTime)

C_TEXT:C284($Form)
C_TEXT:C284($ErrorText)

C_POINTER:C301($Target)

TimePicker__InitInter 


If (Type:C295($1)=Is time:K8:8)
	$Time:=$1
	If (Count parameters:C259>=2)  //for a specific parent subform object OR current form 
		$Form:=$2
		
		C_TIME:C306($MinTime)
		C_TIME:C306($MaxTime)
		
		TimePicker__GetTimeMin (->$MinTime;"")
		TimePicker__GetTimeMax (->$MaxTime;"")
		
		Case of 
			: ($Time<$MinTime)
				$Time:=$MinTime
			: ($Time>$MaxTime) & ($MaxTime#?00:00:00?)
				$Time:=$MaxTime
		End case 
		
		Tool_VarToObject (->$Time;"SelectedTime";$Form)
		
		$Target:=TimePicker__GetTarget 
		If (Not:C34(Is nil pointer:C315($Target)))
			If (($Target->)#$Time)
				$Target->:=$Time
			End if 
		End if 
		
	Else   // default value
		
		Case of 
			: ($Time<<>TimePicker_TimeMin)
				$Time:=<>TimePicker_TimeMin
				
			: ($Time><>TimePicker_TimeMax) & (<>TimePicker_TimeMax#?00:00:00?)
				$Time:=<>TimePicker_TimeMax
				
		End case 
		
		TimePicker SET DEFAULT TIME ($Time)
		
	End if 
	
	$ReturnedTime:=$Time
	
Else 
	
	$ErrorText:=Get localized string:C991("Errors_TimeParameter")
	$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
	ALERT:C41($ErrorText)
	
	$ReturnedTime:=?00:00:00?
	
End if 

$0:=$ReturnedTime

