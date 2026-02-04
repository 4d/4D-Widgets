Class extends _date

property data : cs:C1710._dateButton
property dayZoneName; monthZoneName; yearZoneName; shortPattern : Text
property posDay; posMonth; posYear : Integer

property dayWidth : Integer:=17
property monthWidth : Integer:=17
property yearWidth : Integer:=34

// Widgets
property width:=[Null:C1517; 0; 8; 0; 8; 0]
property widgets:=[Null:C1517; "LeftEntry"; "Slash1"; "CenterEntry"; "Slash2"; "RightEntry"]

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor($data : cs:C1710._dateButton)
	
	Super:C1705()
	
	This:C1470.data:=$data
	
	var $t
	GET SYSTEM FORMAT:C994(Short date day position:K60:12; $t)
	This:C1470.posDay:=Num:C11($t)
	
	GET SYSTEM FORMAT:C994(Short date month position:K60:13; $t)
	This:C1470.posMonth:=Num:C11($t)
	
	GET SYSTEM FORMAT:C994(Short date year position:K60:14; $t)
	This:C1470.posYear:=Num:C11($t)
	
	GET SYSTEM FORMAT:C994(System date short pattern:K60:7; $t)
	This:C1470.shortPattern:=$t
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Super:C1706.init()
	
	OBJECT SET TITLE:C194(*; "Slash1"; This:C1470.separator)
	OBJECT SET TITLE:C194(*; "Slash2"; This:C1470.separator)
	
	Case of 
			
			// ______________________________________________________
		: (This:C1470.posDay=1)\
			 && (This:C1470.posMonth=2)\
			 && (This:C1470.posYear=3)  // DD/MM/YYYY
			
			This:C1470.dayZoneName:=This:C1470.widgets[1]
			This:C1470.monthZoneName:=This:C1470.widgets[3]
			This:C1470.yearZoneName:=This:C1470.widgets[5]
			
			This:C1470.width[1]:=This:C1470.dayWidth
			This:C1470.width[3]:=This:C1470.monthWidth
			This:C1470.width[5]:=This:C1470.yearWidth
			
			// ______________________________________________________
		: (This:C1470.posDay=1)\
			 && (This:C1470.posYear=2)\
			 && (This:C1470.posMonth=3)  // DD/YYYY/MM
			
			This:C1470.dayZoneName:=This:C1470.widgets[1]
			This:C1470.yearZoneName:=This:C1470.widgets[3]
			This:C1470.monthZoneName:=This:C1470.widgets[5]
			
			This:C1470.width[1]:=This:C1470.dayWidth
			This:C1470.width[3]:=This:C1470.yearWidth
			This:C1470.width[5]:=This:C1470.monthWidth
			
			// ______________________________________________________
		: (This:C1470.posMonth=1)\
			 && (This:C1470.posDay=2)\
			 && (This:C1470.posYear=3)  // MM/DD/YYYY
			
			This:C1470.monthZoneName:=This:C1470.widgets[1]
			This:C1470.dayZoneName:=This:C1470.widgets[3]
			This:C1470.yearZoneName:=This:C1470.widgets[5]
			
			This:C1470.width[1]:=This:C1470.monthWidth
			This:C1470.width[3]:=This:C1470.dayWidth
			This:C1470.width[5]:=This:C1470.yearWidth
			
			// ______________________________________________________
		: (This:C1470.posYear=1)\
			 && (This:C1470.posDay=2)\
			 && (This:C1470.posMonth=3)  // YYYY/DD/MM
			
			This:C1470.yearZoneName:=This:C1470.widgets[1]
			This:C1470.dayZoneName:=This:C1470.widgets[3]
			This:C1470.monthZoneName:=This:C1470.widgets[5]
			
			This:C1470.width[1]:=This:C1470.yearWidth
			This:C1470.width[3]:=This:C1470.dayWidth
			This:C1470.width[5]:=This:C1470.monthWidth
			
			// ______________________________________________________
		: (This:C1470.posMonth=1)\
			 && (This:C1470.posYear=2)\
			 && (This:C1470.posDay=3)  // MM/YYYY/DD
			
			This:C1470.monthZoneName:=This:C1470.widgets[1]
			This:C1470.yearZoneName:=This:C1470.widgets[3]
			This:C1470.dayZoneName:=This:C1470.widgets[5]
			
			This:C1470.width[1]:=This:C1470.monthWidth
			This:C1470.width[3]:=This:C1470.yearWidth
			This:C1470.width[5]:=This:C1470.dayWidth
			
			// ______________________________________________________
		: (This:C1470.posYear=1)\
			 && (This:C1470.posMonth=2)\
			 && (This:C1470.posDay=3)  // YYYY/MM/DD
			
			This:C1470.yearZoneName:=This:C1470.widgets[1]
			This:C1470.monthZoneName:=This:C1470.widgets[3]
			This:C1470.dayZoneName:=This:C1470.widgets[5]
			
			This:C1470.width[1]:=This:C1470.yearWidth
			This:C1470.width[3]:=This:C1470.monthWidth
			This:C1470.width[5]:=This:C1470.dayWidth
			
			// ______________________________________________________
	End case 
	
	// Resize objects (the order will NOT be changed !!!)
	var $left; $top; $right; $bottom : Integer
	OBJECT GET COORDINATES:C663(*; This:C1470.widgets[1]; $left; $top; $right; $bottom)
	
	var $i : Integer
	For ($i; 1; 5; 1)
		
		OBJECT MOVE:C664(*; This:C1470.widgets[$i]; $left; $top; $left+This:C1470.width[$i]; $bottom; *)
		$left+=This:C1470.width[$i]
		
	End for 
	
	OBJECT SET FORMAT:C236(*; This:C1470.dayZoneName; "00")
	OBJECT SET FORMAT:C236(*; This:C1470.monthZoneName; "00")
	OBJECT SET FORMAT:C236(*; This:C1470.yearZoneName; "0000")
	
	OBJECT SET TITLE:C194(*; This:C1470.widgets[2]; This:C1470.separator)
	OBJECT SET TITLE:C194(*; This:C1470.widgets[4]; This:C1470.separator)
	
	This:C1470.date:=This:C1470.getSelectedDate() || Current date:C33
	
	This:C1470.setSelectedDate(This:C1470.date)
	This:C1470.display(True:C214)
	
/*
This.firstDayOfMonth:=Add to date(!00-00-00!; Year of(This.date); Month of(This.date); 1)
This.firstDayOfWeek:=<>DatePicker_FirstDayOfWeek
*/
	
	OBJECT SET FOCUS RECTANGLE INVISIBLE:C1177(*; "@"; True:C214)
	
	This:C1470.callParent()
	
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
	Case of 
			
			// ______________________________________________________
		: ($e.code=On Activate:K2:9)\
			 || ($e.code=On Deactivate:K2:10)
			
			This:C1470.manageFocus($e)
			
			// ______________________________________________________
		: ($e.objectName=This:C1470.dayZoneName)\
			 || ($e.objectName=This:C1470.monthZoneName)\
			 || ($e.objectName=This:C1470.yearZoneName)
			
			This:C1470.display(True:C214)
			
			// ______________________________________________________
		: ($e.objectName="stepper")
			
			This:C1470.increase(OBJECT Get value:C1743("stepper"))  // +1 ou -1
			OBJECT SET VALUE:C1742("stepper"; 0)
			
			// ______________________________________________________
		: ($e.objectName="up")
			
			This:C1470.increase(1)
			
			// ______________________________________________________
		: ($e.objectName="down")
			
			This:C1470.increase(-1)
			
			// ______________________________________________________
		: ($e.objectName="tinyCalendar")
			
			var $date:=cs:C1710._datePicker.new(True:C214).date
			
			If ($date#!00-00-00!)
				
				This:C1470.setSelectedDate($date)
				This:C1470.display()
				
			End if 
			
			// ______________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function update()
	
	var $date:=This:C1470.getSelectedDate()
	This:C1470.setSelectedDate($date)
	This:C1470.display()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function display($recalculation : Boolean)
	
	If ($recalculation)
		
		var $day : Integer:=Num:C11(OBJECT Get value:C1743(This:C1470.dayZoneName))
		var $month : Integer:=Num:C11(OBJECT Get value:C1743(This:C1470.monthZoneName))
		var $year : Integer:=Num:C11(OBJECT Get value:C1743(This:C1470.yearZoneName))
		
		// The default value is January 1 of the current year.
		$day:=$day>0 ? $day : 1
		$month:=$month>0 ? $month : 1
		$year:=$year>0 ? $year : Year of:C25(Current date:C33)
		
		$year:=$year>=100 ? $year : $year<50 ? $year+2000 : $year+1900
		
		This:C1470.setSelectedDate(Add to date:C393(!00-00-00!; $year; $month; $day))
		
	End if 
	
	// TODO:MOVE TO _datePicker class
	//If (This.currentForm="DatePicker")
	//// Recalculate the first day in order to use the tiny popup properly 
	//This.computeFirstDay()
	//End if
	
	OBJECT SET VALUE:C1742(This:C1470.dayZoneName; String:C10(Day of:C23(This:C1470.date); "00"))
	OBJECT SET VALUE:C1742(This:C1470.monthZoneName; String:C10(Month of:C24(This:C1470.date); "00"))
	OBJECT SET VALUE:C1742(This:C1470.yearZoneName; String:C10(Year of:C25(This:C1470.date); "0000"))
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function manageFocus($e : Object)
	
	$e:=$e || FORM Event:C1606
	var $visible : Boolean
	
	If ($e.code=On Activate:K2:9)
		
		$visible:=True:C214
		
		var $t:=This:C1470.clickedInWidget([This:C1470.widgets[1]; This:C1470.widgets[3]; This:C1470.widgets[5]])
		
		If (Length:C16($t)>0)
			
			GOTO OBJECT:C206(*; $t)
			HIGHLIGHT TEXT:C210(*; $t; 1; MAXLONG:K35:2)
			
		Else 
			
			GOTO OBJECT:C206(*; This:C1470.widgets[1])
			
		End if 
	End if 
	
	OBJECT SET VISIBLE:C603(*; "FocusRing@"; $visible)
	OBJECT SET VISIBLE:C603(*; "up"; $visible)
	OBJECT SET VISIBLE:C603(*; "down"; $visible)
	OBJECT SET VISIBLE:C603(*; "stepper"; $visible)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function increase($step : Integer)
	
	var $target:=OBJECT Get name:C1087(Object with focus:K67:3)
	var $date : Date:=Add to date:C393(!00-00-00!; Year of:C25(This:C1470.date); Month of:C24(This:C1470.date); Day of:C23(This:C1470.date))
	
	Case of 
			
			// ________________________________________________________________________________
		: ($target=This:C1470.yearZoneName)
			
			$date:=Add to date:C393($date; $step; 0; 0)
			
			// ________________________________________________________________________________
		: ($target=This:C1470.monthZoneName)
			
			$date:=Add to date:C393($date; 0; $step; 0)
			
			// ________________________________________________________________________________
		: ($target=This:C1470.dayZoneName)
			
			$date:=Add to date:C393($date; 0; 0; $step)
			
			// ________________________________________________________________________________
	End case 
	
	This:C1470.setSelectedDate($date)
	This:C1470.display()
	