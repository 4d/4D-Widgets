Class extends _widget

property widget:="gClock"

property withSeconds:=True:C214
property withAMPM:=True:C214
property mode : Integer:=12
property redraw : Boolean

property clock : Picture

Class constructor
	
	Super:C1705()
	
	var $file:=File:C1566("/RESOURCES/clockLCD.svg"; *)
	
	If ($file.exists)  // User clock
		
		var $pict : Picture
		READ PICTURE FILE:C678($file.platformPath; $pict)
		This:C1470.clock:=$pict
		
	Else 
		
		This:C1470.clock:=TimePicker__LCDcreatePict(This:C1470.withSeconds; This:C1470.withAMPM)
		
	End if 