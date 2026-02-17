Class extends _widget

property minTime; maxTime; step : Time
property AM; PM : Text
property withMeridien : Boolean

property hours; minutes; seconds : Integer
property meridien; separator : Text

property time : Time

property inited:=False:C215

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor()
	
	Super:C1705()
	
	This:C1470.defaultValues()
	
	Use (Storage:C1525)
		
		var $param : Object:=Storage:C1525.time
		
	End use 
	
	This:C1470.minTime:=$param.minTime
	This:C1470.maxTime:=$param.maxTime
	This:C1470.step:=$param.step
	This:C1470.AM:=$param.AM
	This:C1470.PM:=$param.PM
	
	This:C1470.time:=?00:00:00?
	This:C1470.hours:=0
	This:C1470.minutes:=0
	This:C1470.seconds:=0
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Super:C1706.init()
	
	Case of 
			
			// ______________________________________________________
		: (This:C1470.currentForm="TimeEntry@")
			
			This:C1470.type:="entry"
			
			// ______________________________________________________
		: (This:C1470.currentForm="TimePicker@")
			
			This:C1470.type:="picker"
			
			// ______________________________________________________
	End case 
	
	var $t : Text
	GET SYSTEM FORMAT:C994(Time separator:K60:11; $t)
	This:C1470.separator:=$t
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function defaultValues($force : Boolean)
	
	If (Storage:C1525.time=Null:C1517) || ($force)
		
		Use (Storage:C1525)
			
			Storage:C1525.time:=New shared object:C1526
			
		End use 
		
		Use (Storage:C1525.time)
			
			Storage:C1525.time.minTime:=?00:00:00?
			Storage:C1525.time.maxTime:=?20:00:00?
			Storage:C1525.time.step:=?00:15:00?
			
			var $t : Text
			GET SYSTEM FORMAT:C994(System time AM label:K60:15; $t)
			Storage:C1525.time.AM:=$t || "AM"
			GET SYSTEM FORMAT:C994(System time PM label:K60:16; $t)
			Storage:C1525.time.PM:=$t || "PM"
			
		End use 
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
	
	This:C1470.setContainerValue(This:C1470.time; [Is real:K8:4; Is time:K8:8; Is undefined:K8:13])
	
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