//%attributes = {"invisible":true}
// The method TimePicker__SetSelectedTime does the actions below

// It receives a time as parameter

// ••• IF a formname is passed
// It makes this time conform with local constraints (min/max)
// It saves this time localy
// If the result is different from the binded variable, then the bind variable is uapdated

// ••• IF a formname is NOT passed
// It makes this time conform with local constraints (min/max)
// It becames the default time

#DECLARE($time : Time; $Form : Text) : Time  // Returned time (that MAY be different from received one)

TimePicker__InitInter

If (Count parameters:C259>=2)  // For a specific parent subform object OR current form
	
	var $minTime : Time
	TimePicker__GetTimeMin(->$minTime; "")
	
	var $maxTime : Time
	TimePicker__GetTimeMax(->$maxTime; "")
	
	Case of 
			
			// ________________________________________________________________________________
		: ($time<$minTime)
			
			$time:=$minTime
			
			// ________________________________________________________________________________
		: ($time>$maxTime)\
			 & ($maxTime#?00:00:00?)
			
			$time:=$maxTime
			
			// ________________________________________________________________________________
	End case 
	
	Tool_VarToObject(->$time; "SelectedTime"; $Form)
	
	var $targetTime:=TimePicker__GetTarget
	
	If ($targetTime#$time)
		
		$targetTime:=$time
		TimePicker__SetTarget($targetTime)
		
	End if 
	
Else   // Default value
	
	Case of 
			
			// ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
		: ($time<<>TimePicker_TimeMin)
			
			$time:=<>TimePicker_TimeMin
			
			// ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
		: ($time><>TimePicker_TimeMax)\
			 & (<>TimePicker_TimeMax#?00:00:00?)
			
			$time:=<>TimePicker_TimeMax
			
			// ┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
	End case 
	
	TimePicker SET DEFAULT TIME($time)
	
End if 

return $time