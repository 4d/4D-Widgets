Class extends _date

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor
	
	Super:C1705()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	This:C1470.date:=This:C1470.getSelectedDate() || Current date:C33
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function handleEvents($e : Object)
	
	$e:=$e || FORM Event:C1606
	
	// MARK:Form Method
	If ($e.objectName=Null:C1517)
		
		Case of 
				
				//________________________________________________________________________________
			: ($e.code=On Load:K2:1)
				
				This:C1470.init()
				
				//________________________________________________________________________________
		End case 
		
		return 
		
	End if 
	
	// MARK: Widget Methods
	Case of 
			
			//________________________________________________________________________________
		: ($e.objectName="tinyCalendar")
			
			var $picker:=cs:C1710._datePicker.new()
			$picker.date:=This:C1470.date
			var $date:=$picker.dialog(True:C214).date
			
			This:C1470.setSelectedDate($date)
			
			//var $date:=cs._datePicker.new(This.date).date
			
			//If ($date#!00-00-00!)
			
			//This.setSelectedDate($date)
			
			//End if 
			
			//________________________________________________________________________________
	End case 
	
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function update()
	
	//
	
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function displayPicker()
	
	This:C1470.setSelectedDate(cs:C1710._datePicker.new(This:C1470.date).date)