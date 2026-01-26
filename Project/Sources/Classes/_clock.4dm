Class extends _widget

property autorun : Boolean
property withSeconds:=True:C214
property offset : Time
property redraw : Boolean

// === === === === === === === === === === === === === === === === === === === === === === === === 
Class constructor
	
	Super:C1705()
	
	This:C1470.widget:="gClock"
	
	// === === === === === === === === === === === === === === === === === === === === === === === === 
Function getTime() : Object
	
	var $o:=This:C1470.getContainerValue()
	
	Case of 
			
			// ----------------------------------
		: ($o.type=Is undefined:K8:13)\
			 || ($o.type=Is longint:K8:6)\
			 || ($o.type=Is real:K8:4)\
			 || ($o.type=Null:C1517)
			
			This:C1470.autorun:=True:C214
			
			This:C1470.offset:=$o.value#Null:C1517 ? $o.value : ?00:00:00?
			var $time : Time:=Current time:C178+This:C1470.offset
			$time:=$time>?24:00:00? ? $time-?24:00:00? : $time
			
			// ----------------------------------
		: ($o.type=Is time:K8:8)
			
			$time:=$o.value
			
			// ----------------------------------
		: ($o.type=Is text:K8:3)
			
			$time:=Time:C179(String:C10($o.value))
			
			// ----------------------------------
		Else 
			
			// Any other type is not managed
			
			// ----------------------------------
	End case 
	
	var $seconds : Integer:=$time+0
	
	var $hours : Integer:=$seconds\3600
	$seconds-=$hours*3600
	
	var $minutes : Integer:=$seconds\60
	$seconds-=$minutes*60
	
	return {\
		time: $time; \
		daylight: ($time>=?08:00:00?) && ($time<?20:00:00?); \
		hours: $hours; \
		minutes: $minutes; \
		seconds: $seconds}
	
	// === === === === === === === === === === === === === === === === === === === === === === === === 
Function loadClock($file : 4D:C1709.File) : Picture
	
	var $pict : Picture
	
	If ($file.exists)
		
		READ PICTURE FILE:C678($file.platformPath; $pict)
		
	End if 
	
	return $pict