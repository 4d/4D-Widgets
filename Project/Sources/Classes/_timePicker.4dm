Class extends _widget

property minTime; maxTime; step : Time
property AM; PM : Text
property withMeridien : Boolean

property hours; minutes; seconds : Integer
property meridiem : Text

property time : Time

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor
	
	Super:C1705()
	
	This:C1470.minTime:=<>TimePicker_TimeMin
	This:C1470.maxTime:=<>TimePicker_TimeMax
	This:C1470.step:=<>TimePicker_Step
	
	This:C1470.hours:=0
	This:C1470.minutes:=0
	This:C1470.seconds:=0
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	This:C1470.withMeridien:=This:C1470.withWidget("am_pm")
	
	If (This:C1470.withMeridien)
		
		This:C1470.AM:=<>TimePicker_LabelAM
		This:C1470.PM:=<>TimePicker_LabelPM
		
		// MARK: Special settings for japaneese
		If (Get database localization:C1009(User system localization:K5:23)="ja")\
			 || (Get database localization:C1009(Current localization:K5:22)="ja")
			
			If (This:C1470.withWidget("Separator2"))
				
				var $left; $top; $right; $bottom : Integer
				OBJECT GET COORDINATES:C663(*; "FocusRingBackGround"; $left; $top; $right; $bottom)
				var $start:=$left+1
				
				var $t : Text
				For each ($t; ["am_pm"; "hours"; "Separator1"; "minutes"; "Separator2"; "seconds"])
					
					OBJECT GET COORDINATES:C663(*; $t; $left; $top; $right; $bottom)
					var $width : Integer:=$right-$left
					OBJECT MOVE:C664(*; $t; $start; $top; $start+$width; $bottom; *)
					$start+=$width
					
				End for each 
			End if 
		End if 
	End if 
	
	OBJECT SET FOCUS RECTANGLE INVISIBLE:C1177(*; "@"; True:C214)
	
	This:C1470.update()
	
	This:C1470.callParent()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function update()
	
	var $time : Time:=Time:C179(This:C1470.getContainerValue().value)
	This:C1470.setSelectedTime($time)
	This:C1470.displayTimeInputs()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function manageFocus($e : Object)
	
	$e:=$e || FORM Event:C1606
	var $visible : Boolean
	
	If ($e.code=On Activate:K2:9)
		
		$Visible:=True:C214
		GOTO OBJECT:C206(*; "hours")
		
	End if 
	
	OBJECT SET VISIBLE:C603(*; "FocusRing@"; $Visible)
	OBJECT SET VISIBLE:C603(*; "up"; $Visible)
	OBJECT SET VISIBLE:C603(*; "down"; $Visible)
	OBJECT SET VISIBLE:C603(*; "stepper"; $Visible)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function setSelectedTime($time : Time)
	
	This:C1470.time:=This:C1470.constraints($time)
	
	var $o:=This:C1470.getContainerValue()
	
	If ($o.type=Is real:K8:4)\
		 | ($o.type=Is time:K8:8)
		
		If (Time:C179($o.value)#$time)
			
			This:C1470.setContainerValue($time; [Is real:K8:4; Is time:K8:8])
			
		End if 
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function displayTimeInputs($recalculation : Boolean)
	
	// MARK: RECALCULATION (OR NOT) OF THE ENTERED DATE
	If ($recalculation)
		
		This:C1470.hours:=Num:C11(OBJECT Get value:C1743("hours"))
		This:C1470.minutes:=Num:C11(OBJECT Get value:C1743("minutes"))
		This:C1470.seconds:=Num:C11(OBJECT Get value:C1743("seconds"))
		
		var $time : Time:=(3600*This:C1470.hours)+(60*This:C1470.minutes)+This:C1470.seconds
		
		If (This:C1470.withMeridien)  // 12:00:00 PM
			
			If (This:C1470.meridiem=This:C1470.PM)\
				 && ($time<?13:00:00?)\
				 && (($time+(12*3600))<=(This:C1470.maxTime+0))  // If label = PM
				
				$time:=$time+(12*3600)  // ADD 12 hours to time (11 = 23)
				
			End if 
		End if 
		
	Else 
		
		$time:=This:C1470.time
		
	End if 
	
	$time:=This:C1470.constraints(($time+?24:00:00?)%(24*3600))
	
	// MARK: SETUP INPUT ZONES
	var $H : Integer:=Int:C8($time/3600)
	var $M : Integer:=Int:C8(($time-($H*3600))/60)
	var $S : Integer:=Int:C8($time-(3600*$H)-(60*$M))
	
	If (This:C1470.withMeridien)
		
		Case of 
				
				//________________________________________________________________________________
			: ($H=0)
				
				OBJECT SET VALUE:C1742("am_pm"; This:C1470.AM)
				OBJECT SET VALUE:C1742("hours"; "12")
				
				//________________________________________________________________________________
			: ($H<=11)
				
				OBJECT SET VALUE:C1742("am_pm"; This:C1470.AM)
				OBJECT SET VALUE:C1742("hours"; String:C10($H; "00"))
				
				//________________________________________________________________________________
			: ($H=12)
				
				OBJECT SET VALUE:C1742("am_pm"; This:C1470.PM)
				OBJECT SET VALUE:C1742("hours"; "12")
				
				//________________________________________________________________________________
			: ($H>12)
				
				OBJECT SET VALUE:C1742("am_pm"; This:C1470.PM)
				OBJECT SET VALUE:C1742("hours"; String:C10($H-12; "00"))
				
				//________________________________________________________________________________
		End case 
		
		
		OBJECT SET VALUE:C1742("minutes"; String:C10($M; "00"))
		OBJECT SET VALUE:C1742("seconds"; String:C10($S; "00"))
		
	Else 
		
		OBJECT SET VALUE:C1742("hours"; String:C10($H; "00"))
		OBJECT SET VALUE:C1742("minutes"; String:C10($M; "00"))
		OBJECT SET VALUE:C1742("seconds"; String:C10($S; "00"))
		
	End if 
	
	This:C1470.setSelectedTime($time)
	
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
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function increase($step : Integer)
	
	var $target:=OBJECT Get name:C1087(Object with focus:K67:3)
	var $time : Time:=This:C1470.getContainerValue().value
	
	Case of 
			
			// ________________________________________________________________________________
		: ($target="am_pm")
			
			$step:=12*3600*$step
			
			// ________________________________________________________________________________
		: ($target="hours")
			
			$step:=3600*$step
			
			// ________________________________________________________________________________
		: ($target="minutes")
			
			$step:=60*$step
			
			// ________________________________________________________________________________
		: ($target="seconds")
			
			$step:=$step
			
			// ________________________________________________________________________________
	End case 
	
	$time+=$step
	
	This:C1470.setSelectedTime($time)
	This:C1470.displayTimeInputs()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function stepper()
	
	var $current:=OBJECT Get name:C1087(Object current:K67:2)
	This:C1470.increase(OBJECT Get value:C1743($current))  // +1 ou -1
	OBJECT SET VALUE:C1742($current; 0)