Class extends _widget

property clock:="gClock"
property autorun : Boolean
property withSeconds:=True:C214
property offset : Time
property redraw : Boolean

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor
	
	Super:C1705()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Super:C1706.init()
	
	Case of 
			
			// ______________________________________________________
		: (This:C1470.currentForm="TimeDisplay")
			
			This:C1470.type:="analogicClock"
			
			// ______________________________________________________
		: (This:C1470.currentForm="TimeDisplayLCD")
			
			This:C1470.type:="digitalClock"
			
			// ______________________________________________________
	End case 
	
	OBJECT SET VALUE:C1742(This:C1470.clock; Form:C1466.getClock())
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function handleEvents($e : Object)
	
	$e:=$e || FORM Event:C1606
	
	// MARK:Form Method
	If ($e.objectName=Null:C1517)
		
		Try
			
			Case of 
					
					// __________________________________________________________________________________
				: ($e.code=On Load:K2:1)
					
					Form:C1466.init()
					
					// __________________________________________________________________________________
				: ($e.code=On Bound Variable Change:K2:52)
					
					SET TIMER:C645(-1)
					
					// __________________________________________________________________________________
				: ($e.code=On Timer:K2:25)
					
					SET TIMER:C645(0)
					
					Form:C1466.Update()
					
					// __________________________________________________________________________________
			End case 
			
		Catch
			
			ALERT:C41(Last errors:C1799.extract("message").join("\r"))
			
		End try
		
		return 
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function resize()
	
	// Resize to fit the container
	var $width; $height : Integer
	OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
	OBJECT MOVE:C664(*; This:C1470.clock; 1; 1; $width-1; $height-1; *)
	
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