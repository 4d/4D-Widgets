Class extends _date

property formName:="DatePicker"

property caller : Object
property firstDayOfWeek : Integer

property dayOff0:=[]
property dayOff1:=[]
property dayOff2:=[]

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor($caller : Object)
	
	Super:C1705()
	
	This:C1470.caller:=$caller
	
	ARRAY TO COLLECTION:C1563(This:C1470.dayOff0; <>_DatePicker_DaysOff0)
	ARRAY TO COLLECTION:C1563(This:C1470.dayOff1; <>_DatePicker_DaysOff1)
	ARRAY TO COLLECTION:C1563(This:C1470.dayOff2; <>_DatePicker_DaysOff2)
	
	If (This:C1470.caller#Null:C1517)
		
		This:C1470.date:=This:C1470.dialog()
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Super:C1706.init()
	
	This:C1470.firstDayOfWeek:=<>DatePicker_FirstDayOfWeek
	
	This:C1470.computeFirstDay()
	
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
			: ($e.code=On Bound Variable Change:K2:52)
				
				This:C1470.update()
				
				//________________________________________________________________________________
			: ($e.code=On Activate:K2:9)\
				 || ($e.code=On Deactivate:K2:10)
				
				This:C1470.manageFocus($e)
				
				//________________________________________________________________________________
		End case 
		
		return 
		
	End if 
	
	// MARK: Widget Methods
/*
Case of 
	
// ______________________________________________________
: ($e.code=On Activate)\
|| ($e.code=On Deactivate)
	
This.manageFocus($e)
	
// ______________________________________________________
: ($e.objectName=This.dayZoneName)\
|| ($e.objectName=This.monthZoneName)\
|| ($e.objectName=This.yearZoneName)
	
This.display(True)
	
// ______________________________________________________
: ($e.objectName="stepper")
	
This.increase(OBJECT Get value("stepper"))  // +1 ou -1
OBJECT SET VALUE("stepper"; 0)
	
// ______________________________________________________
: ($e.objectName="up")
	
This.increase(1)
	
// ______________________________________________________
: ($e.objectName="down")
	
This.increase(-1)
	
// ______________________________________________________
: ($e.objectName="tinyCalendar")
	
var $date:=cs._datePicker.new(This).date
	
If ($date#!00-00-00!)
	
This.setSelectedDate($date)
This.display()
	
End if 
	
// ______________________________________________________
End case 
*/
	
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function update()
	
	var $date:=This:C1470.getSelectedDate()
	This:C1470.setSelectedDate($date)
	This:C1470.display()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function display($recalculation : Boolean)
	
	
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function manageFocus($e : Object)
	
	$e:=$e || FORM Event:C1606
	var $visible : Boolean:=($e.code=On Activate:K2:9)
	
	OBJECT SET VISIBLE:C603(*; "DummyBtn@"; $visible)
	OBJECT SET ENABLED:C1123(*; "DummyBtn@"; $visible)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function dialog() : Date
	
	If (This:C1470.caller#Null:C1517)
		
		If (Is macOS:C1572)
			
			MOUSE POSITION:C468($mouseX; $mouseY; $mouseButton; *)  // Global system
			
			$left:=$mouseX
			$top:=$mouseY
			
		Else 
			
			var $mouseX; $mouseY; $mouseButton : Integer
			MOUSE POSITION:C468($mouseX; $mouseY; $mouseButton)  // front most window
			
			var $left; $top; $right; $bottom : Integer
			GET WINDOW RECT:C443($left; $top; $right; $bottom)  // front most window
			
			$left+=$mouseX
			$top+=$mouseY
			
		End if 
		
		var $cordinates:=This:C1470.adjustWindowPos(This:C1470.formName; $left; $top)
		$left:=$cordinates.x
		$top:=$cordinates.y
		
		var $form:={displayDate: This:C1470.caller.date}
		
	Else 
		
		$form:={displayDate: <>DatePicker_DefaultDate}
		
	End if 
	
	$form.autoClose:=This:C1470.caller#Null:C1517  // True will close the dial on click on any date
	$form.useArrows:=This:C1470.caller#Null:C1517  // Tru will allow the use of arrows (which is not the case when displayed inside a form)
	
	var $winRef:=Open form window:C675(String:C10(This:C1470.formName); Movable form dialog box no title:K39:20; $left; $top)
	DIALOG:C40(This:C1470.formName; $form)
	
	If (Bool:C1537(OK))
		
		// MARK: ACI0105847
		<>DatePicker_DefaultDate:=$form.displayDate
		return $form.displayDate
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function computeFirstDay()
	
	This:C1470.firstDayOfMonth:=Add to date:C393(!00-00-00!; Year of:C25(This:C1470.date); Month of:C24(This:C1470.date); 1)
	This:C1470.firstDisplayedDay:=This:C1470.firstDayOfMonth  // First day of the month displayed
	
	If (This:C1470.firstDayOfWeek>=1)\
		 & (This:C1470.firstDayOfWeek<=7)
		
		// Decrease on the first day until you reach the desired day of the week
		While (Day number:C114(This:C1470.firstDisplayedDay)#This:C1470.firstDayOfWeek)
			
			This:C1470.firstDisplayedDay-=1
			
		End while 
	End if 
	