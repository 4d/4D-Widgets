Class extends _clock

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor
	
	Super:C1705()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function getClock() : Picture
	
	var $file:=File:C1566("/RESOURCES/clock.svg"; *)
	
	If ($file.exists)
		
		// User clock
		
	Else 
		
		$file:=File:C1566("/RESOURCES/clock.svg")
		
	End if 
	
	return This:C1470.loadClock($file)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function update()
	
	This:C1470.resize()
	
	If (This:C1470.redraw)
		
		SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "seconds-hand"; "visibility"; This:C1470.withSeconds ? "visible" : "hidden")
		This:C1470.redraw:=False:C215  // Done
		
	End if 
	
	var $o:=This:C1470.getTime()
	var $hours : Integer:=Num:C11($o.hours)
	var $minutes : Integer:=Num:C11($o.minutes)
	var $seconds : Integer:=Num:C11($o.seconds)
	
	var $secondAngle : Integer:=($seconds*6)+180
	var $minuteAngle:=($minutes*6)+180
	var $hourAngle:=(($hours-(12*Num:C11($hours>12)))*30)+180
	
	// MARK: Modifie the rotation of the 3 hands : according to the user value of cx cy if any
	var $cx; $cy : Real
	SVG GET ATTRIBUTE:C1056(*; This:C1470.widget; "seconds-hand"; "d4:cx"; $cx)
	SVG GET ATTRIBUTE:C1056(*; This:C1470.widget; "seconds-hand"; "d4:cy"; $cy)
	$cx:=$cx=0 ? 200 : $cx
	$cy:=$cy=0 ? 200 : $cy
	SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "seconds-hand"; "transform"; "rotate("+String:C10($secondAngle; "&xml")+","+String:C10($cx; "&xml")+","+String:C10($cy; "&xml")+")")
	
	SVG GET ATTRIBUTE:C1056(*; This:C1470.widget; "minutes-hand"; "d4:cx"; $cx)
	SVG GET ATTRIBUTE:C1056(*; This:C1470.widget; "minutes-hand"; "d4:cy"; $cy)
	$cx:=$cx=0 ? 200 : $cx
	$cy:=$cy=0 ? 200 : $cy
	SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "minutes-hand"; "transform"; "rotate("+String:C10($minuteAngle; "&xml")+","+String:C10($cx; "&xml")+","+String:C10($cy; "&xml")+")")
	
	SVG GET ATTRIBUTE:C1056(*; This:C1470.widget; "hours-hand"; "d4:cx"; $cx)
	SVG GET ATTRIBUTE:C1056(*; This:C1470.widget; "hours-hand"; "d4:cy"; $cy)
	$cx:=$cx=0 ? 200 : $cx
	$cy:=$cy=0 ? 200 : $cy
	SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "hours-hand"; "transform"; "rotate("+String:C10($hourAngle; "&xml")+","+String:C10($cx; "&xml")+","+String:C10($cy; "&xml")+")")
	
	// MARK: Set the background according to the daylight if any
	If ($o.daylight)
		
		var $fill:="d4:day-fill"
		var $stroke:="d4:day-stroke"
		
	Else 
		
		$fill:="d4:night-fill"
		$stroke:="d4:night-stroke"
		
	End if 
	
	var $id; $fillColor; $strokeColor : Text
	
	For each ($id; ["watch-dial"; "hours-hand"; "minutes-hand"; "seconds-hand"; "labels"; "clock-glass"])
		
		SVG GET ATTRIBUTE:C1056(*; This:C1470.widget; $id; $fill; $fillColor)
		
		If (Length:C16($fillColor)#0)
			
			SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; $id; "fill"; $fillColor)
			
		End if 
		
		SVG GET ATTRIBUTE:C1056(*; This:C1470.widget; $id; $stroke; $strokeColor)
		
		If (Length:C16($strokeColor)#0)
			
			SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; $id; "stroke"; $strokeColor)
			
		End if 
	End for each 
	
	SET TIMER:C645(This:C1470.autorun ? 10 : 0)