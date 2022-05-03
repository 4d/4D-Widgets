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

C_TIME:C306($time)
C_TIME:C306($returnedTime)

C_TEXT:C284($Form)
C_TEXT:C284($ErrorText)

C_TIME:C306($targetTime)

TimePicker__InitInter


If (Type:C295($1)=Is time:K8:8)
	$time:=$1
	If (Count parameters:C259>=2)  //for a specific parent subform object OR current form 
		$Form:=$2
		
		C_TIME:C306($minTime)
		C_TIME:C306($maxTime)
		
		TimePicker__GetTimeMin(->$minTime; "")
		TimePicker__GetTimeMax(->$maxTime; "")
		
		Case of 
			: ($time<$minTime)
				$time:=$minTime
			: ($time>$maxTime) & ($maxTime#?00:00:00?)
				$time:=$maxTime
		End case 
		
		Tool_VarToObject(->$time; "SelectedTime"; $Form)
		
		$targetTime:=TimePicker__GetTarget
		
		If ($targetTime#$time)
			$targetTime:=$time
			TimePicker__SetTarget($targetTime)
		End if 
		
		
	Else   // default value
		
		Case of 
			: ($time<<>TimePicker_TimeMin)
				$time:=<>TimePicker_TimeMin
				
			: ($time><>TimePicker_TimeMax) & (<>TimePicker_TimeMax#?00:00:00?)
				$time:=<>TimePicker_TimeMax
				
		End case 
		
		TimePicker SET DEFAULT TIME($time)
		
	End if 
	
	$returnedTime:=$time
	
Else 
	
	$ErrorText:=Get localized string:C991("Errors_TimeParameter")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
	$returnedTime:=?00:00:00?
	
End if 

$0:=$returnedTime

