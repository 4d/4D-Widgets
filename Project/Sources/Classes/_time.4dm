Class extends _widget

property minTime; maxTime; step : Time
property AM; PM : Text
property withMeridien : Boolean

property hours; minutes; seconds : Integer
property meridien : Text

property time : Time

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor()
	
	Super:C1705()
	
	This:C1470.defaultValues()
	
	This:C1470.minTime:=<>TimePicker_TimeMin
	This:C1470.maxTime:=<>TimePicker_TimeMax
	This:C1470.step:=<>TimePicker_Step
	This:C1470.AM:=<>TimePicker_LabelAM
	This:C1470.PM:=<>TimePicker_LabelPM
	
	This:C1470.hours:=0
	This:C1470.minutes:=0
	This:C1470.seconds:=0
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function defaultValues($force : Boolean)
	
	var <>TimePicker_Inited : Boolean
	
	If (Not:C34(<>TimePicker_Inited) || $force)
		
		var <>TimePicker_CloseDial : Boolean
		
		// Default value
		var <>TimePicker_LabelAM : Text
		GET SYSTEM FORMAT:C994(System time AM label:K60:15; <>TimePicker_LabelAM)
		var <>TimePicker_LabelPM : Text
		GET SYSTEM FORMAT:C994(System time PM label:K60:16; <>TimePicker_LabelPM)
		var <>Time_separator : Text
		GET SYSTEM FORMAT:C994(Time separator:K60:11; <>Time_separator)
		
		var <>TimePicker_TimeMin:=?08:00:00?
		var <>TimePicker_TimeMax:=?20:00:00?
		var <>TimePicker_Step:=?00:15:00?
		var <>TimePicker_SelectedTime:=?00:00:00?
		
		<>TimePicker_Inited:=True:C214
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function getSelectedTime() : Time
	
	var $o:=This:C1470.getContainerValue()
	
	If ($o.type=Is real:K8:4)\
		 | ($o.type=Is time:K8:8)
		
		return Time:C179($o.value)
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function setSelectedTime($time : Time)
	
	This:C1470.time:=This:C1470.constraints($time)
	
	var $o:=This:C1470.getContainerValue()
	
	This:C1470.setContainerValue($time; [Is real:K8:4; Is time:K8:8; Is undefined:K8:13])
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function constraints($time : Time) : Time
	
	Case of 
			
			// ________________________________________________________________________________
		: ($time<This:C1470.minTime)
			
			$time:=This:C1470.minTime
			
			// ________________________________________________________________________________
		: ($time>This:C1470.maxTime)\
			 && (This:C1470.maxTime#?00:00:00?)
			
			$time:=This:C1470.maxTime
			
			// ________________________________________________________________________________
	End case 
	
	return Time:C179($time)