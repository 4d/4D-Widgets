Class extends _time

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor
	
	Super:C1705()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	OBJECT SET TITLE:C194(*; "Separator1"; <>Time_separator)
	OBJECT SET TITLE:C194(*; "Separator2"; <>Time_separator)
	
	This:C1470.withMeridien:=This:C1470.withWidget("am_pm")
	
	If (This:C1470.withMeridien)
		
		This:C1470.AM:=<>TimePicker_LabelAM
		This:C1470.PM:=<>TimePicker_LabelPM
		
		This:C1470.meridien:=This:C1470.AM
		
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
	
	This:C1470.Update()
	
	This:C1470.callParent()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function handleEvents($e : Object)
	
	$e:=$e || FORM Event:C1606
	
	// MARK:Form Method
	If ($e.objectName=Null:C1517)
		
		Try
			
			Case of 
					
					//________________________________________________________________________________
				: ($e.code=On Load:K2:1)
					
					This:C1470.init()
					
					//________________________________________________________________________________
				: ($e.code=On Bound Variable Change:K2:52)
					
					This:C1470.Update()
					
					//________________________________________________________________________________
				: ($e.code=On Activate:K2:9)\
					 || ($e.code=On Deactivate:K2:10)
					
					This:C1470.ManageFocus($e)
					
					//________________________________________________________________________________
			End case 
			
			return 
			
		Catch
			
			ALERT:C41(".The type of the time selector must be numeric, time, or undefined.")
			OBJECT SET VISIBLE:C603(*; "@"; False:C215)
			
		End try
	End if 
	
	// MARK: Widget Methods
	Case of 
			// ______________________________________________________
		: ($e.code=On Activate:K2:9)\
			 || ($e.code=On Deactivate:K2:10)
			
			This:C1470.ManageFocus($e)
			
			// ______________________________________________________
		: ($e.objectName="Hours")\
			 || ($e.objectName="Minutes")\
			 || ($e.objectName="seconds")\
			 || ($e.objectName="am_pm")
			
			This:C1470.Display(True:C214)
			
			// ______________________________________________________
		: ($e.objectName="stepper")
			
			This:C1470.Increase(OBJECT Get value:C1743("stepper"))  // +1 ou -1
			OBJECT SET VALUE:C1742("stepper"; 0)
			
			// ______________________________________________________
		: ($e.objectName="up")
			
			This:C1470.Increase(1)
			
			// ______________________________________________________
		: ($e.objectName="down")
			
			This:C1470.Increase(-1)
			
			// ______________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function Update()
	
	var $time : Time:=Time:C179(This:C1470.getContainerValue().value)
	This:C1470.setSelectedTime($time)
	This:C1470.Display()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function Display($recalculation : Boolean)
	
	// MARK: Recalculation (or not) of the entered date
	If ($recalculation)
		
		var $time : Time:=\
			(3600*Num:C11(OBJECT Get value:C1743("hours")))\
			+(60*Num:C11(OBJECT Get value:C1743("minutes")))\
			+Num:C11(OBJECT Get value:C1743("seconds"))
		
		If (This:C1470.withMeridien)  // 12:00:00 PM
			
			var $meridien : Text:=OBJECT Get value:C1743("am_pm")
			
			If ($meridien#This:C1470.meridien)
				
				This:C1470.meridien:=$meridien
				
				If (This:C1470.meridien=This:C1470.PM)\
					 && ($time<?13:00:00?) && (($time+(12*3600))<=This:C1470.maxTime)  // If label = PM
					
					$time:=$time+(12*3600)  // Add 12 hours to time (11 = 23)
					
				End if 
			End if 
		End if 
		
	Else 
		
		$time:=This:C1470.time
		
	End if 
	
	$time:=This:C1470.constraints(($time+?24:00:00?)%(24*3600))
	This:C1470.time:=$time
	
	// MARK: Setup input zones
	This:C1470.hours:=$time\3600
	$time-=This:C1470.hours*3600
	This:C1470.minutes:=$time\60
	$time-=This:C1470.minutes*60
	This:C1470.seconds:=$time
	
	If (This:C1470.withMeridien)
		
		If (This:C1470.time<=?11:59:59?)
			
			This:C1470.meridien:=This:C1470.AM
			OBJECT SET VALUE:C1742("hours"; This:C1470.hours=0 ? "12" : String:C10(This:C1470.hours; "00"))
			
		Else 
			
			This:C1470.meridien:=This:C1470.PM
			OBJECT SET VALUE:C1742("hours"; This:C1470.hours=12 ? "12" : String:C10(This:C1470.hours-12; "00"))
			
		End if 
		
		OBJECT SET VALUE:C1742("am_pm"; This:C1470.meridien)
		
	Else 
		
		OBJECT SET VALUE:C1742("hours"; String:C10(This:C1470.hours; "00"))
		
	End if 
	
	OBJECT SET VALUE:C1742("minutes"; String:C10(This:C1470.minutes; "00"))
	OBJECT SET VALUE:C1742("seconds"; String:C10(This:C1470.seconds; "00"))
	
	This:C1470.setSelectedTime(This:C1470.time)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function ManageFocus($e : Object)
	
	$e:=$e || FORM Event:C1606
	var $visible : Boolean
	
	If ($e.code=On Activate:K2:9)
		
		$visible:=True:C214
		
		var $t:=This:C1470.clickedInWidget(["hours"; "minutes"; "seconds"; "am_pm"])
		
		If (Length:C16($t)>0)
			
			GOTO OBJECT:C206(*; $t)
			HIGHLIGHT TEXT:C210(*; $t; 1; MAXLONG:K35:2)
			
		Else 
			
			GOTO OBJECT:C206(*; "hours")
			
		End if 
	End if 
	
	OBJECT SET VISIBLE:C603(*; "FocusRing@"; $visible)
	OBJECT SET VISIBLE:C603(*; "up"; $visible)
	OBJECT SET VISIBLE:C603(*; "down"; $visible)
	OBJECT SET VISIBLE:C603(*; "stepper"; $visible)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function Increase($step : Integer)
	
	var $target:=OBJECT Get name:C1087(Object with focus:K67:3)
	var $time : Time:=Try(This:C1470.getContainerValue().value) || ?00:00:00?
	
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
	This:C1470.Display()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function Stepper()
	
	var $current:=OBJECT Get name:C1087(Object current:K67:2)
	This:C1470.Increase(OBJECT Get value:C1743($current))  // +1 ou -1
	OBJECT SET VALUE:C1742($current; 0)