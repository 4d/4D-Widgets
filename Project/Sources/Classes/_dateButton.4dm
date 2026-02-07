Class extends _date

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor
	
	Super:C1705()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function handleEvents($e : Object)
	
	$e:=$e || FORM Event:C1606
	
	Case of 
			
			// ________________________________________________________________________________
		: ($e.code=On Clicked:K2:4)
			
			This:C1470.displayPicker()
			
			// ________________________________________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function displayPicker() : Date
	
	This:C1470.date:=This:C1470.getSelectedDate() || Current date:C33
	
	var $date:=cs:C1710._datePicker.new(This:C1470.date).date
	
	If ($date#!00-00-00!)
		
		This:C1470.setSelectedDate($date)
		
	End if 
	
	return $date