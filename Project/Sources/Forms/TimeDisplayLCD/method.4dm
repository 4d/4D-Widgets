// ----------------------------------------------------
// Form method : clock
// Created 26/09/08 by vdl
// ----------------------------------------------------
// Modified #06-5-2013 by Roland Lannuzel
// variables renames
// test of bound variable type
// added to widgets and picture library
// ----------------------------------------------------
// Modified 22-01-2025 by vdl
// Code modernization
// ----------------------------------------------------
var $e:=FORM Event:C1606

Case of 
		
		//__________________________________________________________________________________
	: ($e.code=On Load:K2:1)
		
		// Default values
		OBJECT SET VALUE:C1742("withSeconds"; True:C214)
		OBJECT SET VALUE:C1742("withAMPM"; True:C214)
		OBJECT SET VALUE:C1742("mode"; 12)
		OBJECT SET VALUE:C1742("redraw"; False:C215)
		
		//var $file:=File("/RESOURCES/clockLCD.svg"; *)
		
		//If ($file.exists)  // User clock
		
		//var $pict : Picture
		//READ PICTURE FILE($file.platformPath; $pict)
		
		//Else 
		
		//$pict:=TimePicker__LCDcreatePict(True; True)  // seconds + AmPm
		
		//End if 
		
		//OBJECT SET VALUE("gClock"; $pict)
		OBJECT SET VALUE:C1742("gClock"; Form:C1466.clock)
		
		var $width; $height : Integer
		OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
		OBJECT MOVE:C664(*; "gClock"; 1; 1; $width-1; $height-1; *)
		
		CALL SUBFORM CONTAINER:C1086((-1)*On Load:K2:1)
		
		SET TIMER:C645(-1)
		
		//__________________________________________________________________________________
	: ($e.code=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-1)
		
		//__________________________________________________________________________________
	: ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		// Resize to fit the container
		OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
		OBJECT MOVE:C664(*; "gClock"; 1; 1; $width-1; $height-1; *)
		
		If (OBJECT Get value:C1743("redraw"))  // Change of display type (with or without seconds, with or without AMPM)
			
			// Before rebuild image we get the color and we save it
			If (OBJECT Get value:C1743("color")="")
				
				// If there is already something, that means the LCD SET COLOR command has been called just before of juste after TimePicker LCD DISPLAY SECONDS
				// In this case it's useless to save the current color because it will changed anyway !
				var $attribute : Text
				SVG GET ATTRIBUTE:C1056(*; "gClock"; "globalClock"; "fill"; $attribute)
				OBJECT SET VALUE:C1742("color"; $attribute)
				
			End if 
			
			// Then the image can be rebuilt !!!
			OBJECT SET VALUE:C1742("gClock"; TimePicker__LCDcreatePict(OBJECT Get value:C1743("withSeconds"); OBJECT Get value:C1743("withAMPM")))
			OBJECT SET VALUE:C1742("redraw"; False:C215)  // Done
			
		End if 
		
		// Apply display color
		var $color : Text:=OBJECT Get value:C1743("color")
		If ($color#"")
			
			SVG SET ATTRIBUTE:C1055(*; "gClock"; "globalClock"; "fill"; $color)
			
		Else 
			
			SVG SET ATTRIBUTE:C1055(*; "gClock"; "globalClock"; "fill"; FORM Get color scheme:C1761="dark" ? "white" : "black")
			
		End if 
		
		var $variant:=OBJECT Get subform container value:C1785
		var $type:=Value type:C1509($variant)
		var $AutoRun : Boolean
		
		Case of 
				
				//----------------------------------
			: ($type=Is longint:K8:6)\
				 || ($type=Is real:K8:4)\
				 || ($variant=Null:C1517)
				
				$AutoRun:=True:C214
				
				var $offset : Time:=$variant#Null:C1517 ? $variant : ?00:00:00?
				var $currentTime : Time:=Current time:C178+$offset
				$currentTime:=$currentTime>?24:00:00? ? $currentTime-?24:00:00? : $currentTime
				
				//----------------------------------
			: ($type=Is time:K8:8)
				
				$currentTime:=$variant
				
				//----------------------------------
			Else   // Any other type will TRY to provide a STATIC clock
				
				$currentTime:=Time:C179(String:C10($variant))
				
				//----------------------------------
		End case 
		
		var $blink:=$AutoRun
		TimePicker__LCDdisplayTime("gClock"; $currentTime; $blink; OBJECT Get value:C1743("mode"); OBJECT Get value:C1743("withAMPM"))
		
		SET TIMER:C645($AutoRun ? 10 : 0)
		
		//__________________________________________________________________________________
End case 