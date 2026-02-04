Class extends _date

property formName:="DatePicker"

property firstDayOfWeek : Integer

property dayOff0:=[]
property dayOff1:=[]
property dayOff2:=[]

property weeklyDaysOff:=[]

property autoClose : Boolean  // True will close the dial on click on any date
property useArrows : Boolean  // True will allow the use of arrows (which is not the case when displayed inside a form)

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor($fromButton : Boolean)
	
	Super:C1705()
	
	ARRAY TO COLLECTION:C1563(This:C1470.dayOff0; <>_DatePicker_DaysOff0)
	This:C1470.dayOff0.insert(0; 1)  // [0] Un used [1]= Sunday [2] = Monday … [7] = Saturday
	
	ARRAY TO COLLECTION:C1563(This:C1470.dayOff1; <>_DatePicker_DaysOff1)
	ARRAY TO COLLECTION:C1563(This:C1470.dayOff2; <>_DatePicker_DaysOff2)
	
	If ($fromButton)
		
		This:C1470.date:=This:C1470.dialog(True:C214)
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Super:C1706.init()
	
	This:C1470.firstDayOfWeek:=<>DatePicker_FirstDayOfWeek
	
	If (This:C1470.autoClose)
		
		OBJECT SET SHORTCUT:C1185(*; "cancel"; Shortcut with Escape:K75:20)
		
		This:C1470.manageFocus({code: On Activate:K2:9})
		
	Else 
		
		This:C1470.manageFocus({code: On Deactivate:K2:10})
		
	End if 
	
	This:C1470.update(True:C214)
	
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
				
				This:C1470.update(True:C214)
				
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
			
			//________________________________________________________________________________
		: ($e.objectName="BtnNext")
			
			This:C1470.nextPreviousMonth(1)
			
			//________________________________________________________________________________
		: ($e.objectName="BtnPrevious")
			
			This:C1470.nextPreviousMonth(-1)
			
			//________________________________________________________________________________
		: ($e.objectName="DummyBtnLeft")
			
			This:C1470.nextPreviousDay(-1)
			
			//________________________________________________________________________________
		: ($e.objectName="DummyBtnUp")
			
			This:C1470.nextPreviousDay(-7)
			
			//________________________________________________________________________________
		: ($e.objectName="DummyBtnRight")
			
			This:C1470.nextPreviousDay(1)
			
			//________________________________________________________________________________
		: ($e.objectName="DummyBtnDown")
			
			This:C1470.nextPreviousDay(7)
			
			//________________________________________________________________________________
		: ($e.objectName="cancel")
			
			//
			
			//________________________________________________________________________________
		: ($e.code=On Clicked:K2:4)
			
			This:C1470.clicOnday($e)
			
			//________________________________________________________________________________
		: ($e.code=On Bound Variable Change:K2:52)
			
			This:C1470.update(True:C214)
			
			//________________________________________________________________________________
		: ($e.code=On Activate:K2:9)\
			 || ($e.code=On Deactivate:K2:10)
			
			This:C1470.manageFocus($e)
			
			//________________________________________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function nextPreviousMonth($step : Integer)
	
	var $date : Date:=Add to date:C393(!00-00-00!; Year of:C25(This:C1470.firstDayOfMonth); Month of:C24(This:C1470.firstDayOfMonth)+$step; Day of:C23(This:C1470.date))
	This:C1470.setSelectedDate($date)
	This:C1470.computeFirstDay($date)
	This:C1470.redraw()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function nextPreviousDay($step : Integer)
	
	This:C1470.date:=Add to date:C393(This:C1470.date; 0; 0; $step)
	This:C1470.update(True:C214)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function update($redraw : Boolean)
	
	var $date:=This:C1470.getSelectedDate()
	This:C1470.setSelectedDate($date)
	This:C1470.computeFirstDay()
	
	If ($redraw)
		
		This:C1470.redraw()
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function redraw()
	
	var $i : Integer
	For ($i; 1; 7)
		
		OBJECT SET VALUE:C1742("DayName"+String:C10($i); Substring:C12(This:C1470.days[($i-2+This:C1470.firstDayOfWeek)%7+1]; 1; 2))
		
	End for 
	
	If (This:C1470.firstDisplayedDay=!00-00-00!)
		
		//This.date:=Current date
		This:C1470.computeFirstDay(Current date:C33)
		
	End if 
	
	var $CurrentMonth:=Month of:C24(This:C1470.firstDisplayedDay+7)
	
	OBJECT SET RGB COLORS:C628(*; "DatePicker_Btn_@"; 0; 0)
	
	For ($i; 1; 42)  //42 objects to fill
		
		var $date : Date:=This:C1470.firstDisplayedDay+$i-1
		var $dayWeek:=Day number:C114($date)
		var $Day:=Day of:C23($date)
		var $month:=Month of:C24($date)
		var $Year:=Year of:C25($date)
		
		// Let's start by labeling the header button.
		var $ObjectName:="DatePicker_Btn_"+String:C10($i)
		OBJECT SET TITLE:C194(*; $ObjectName; String:C10(Day of:C23($date)))
		
		// Is that day a day off?
		var $DayOff:=(This:C1470.dayOff2.indexOf($date)>=0) | (This:C1470.dayOff1.indexOf($date)>=0)
		
		// Does this day belong to the defined range (if applicable)?
		If ($date<This:C1470.minDate)\
			 || ((This:C1470.maxDate#!00-00-00!) && ($date>This:C1470.maxDate))
			
			OBJECT SET ENABLED:C1123(*; $ObjectName; False:C215)
			
		Else 
			
			OBJECT SET ENABLED:C1123(*; $ObjectName; True:C214)
			
		End if 
		
		// Is it a weekly day off?
		var $style:=This:C1470.dayOff0[$dayWeek] ? Bold:K14:2+Italic:K14:3 : Plain:K14:1
		OBJECT SET FONT STYLE:C166(*; $ObjectName; $style)
		
		// Is this the currently selected day?
		If ($date=This:C1470.date)
			
			OBJECT SET VALUE:C1742($ObjectName; 1)
			OBJECT SET RGB COLORS:C628(*; $ObjectName; 0x00FFFFFF; 0x00FFFFFF)
			
		Else 
			
			OBJECT SET VALUE:C1742($ObjectName; 0)
			
		End if 
		
		// Does this concern the current month?
		If (Month of:C24($date)=$CurrentMonth)
			
			If ($DayOff)
				
				OBJECT SET RGB COLORS:C628(*; $ObjectName; 0x00B00000; 0x00B00000)  // RED
				OBJECT SET FONT STYLE:C166(*; $ObjectName; ($style | Bold:K14:2))
				
			End if 
			
		Else 
			
			If ($DayOff)
				
				OBJECT SET RGB COLORS:C628(*; $ObjectName; 0x00D08080; 0x00D08080)  // PINK
				OBJECT SET FONT STYLE:C166(*; $ObjectName; ($style | Bold:K14:2))
				
			Else 
				
				OBJECT SET RGB COLORS:C628(*; $ObjectName; 0x00404040; 0x00404040)  // Grey
				
			End if 
		End if 
		
		// Bold for LMMJVSD
		If ($i<=7)
			
			OBJECT SET FONT STYLE:C166(*; "DayName"+String:C10($i); $style)
			
		End if 
		
		OBJECT SET ENABLED:C1123(*; "BtnPrevious"; This:C1470.firstDisplayedDay>=This:C1470.minDate)
		
		var $DayNumber:=Day of:C23($date)
		var $FirstOfNextMonth:=Add to date:C393($date; 0; 0; (1+(($DayNumber)*(-1))))
		
		If ((This:C1470.maxDate#!00-00-00!)\
			 && ($FirstOfNextMonth>This:C1470.maxDate))
			
			OBJECT SET ENABLED:C1123(*; "BtnNext"; False:C215)
			
		Else 
			
			OBJECT SET ENABLED:C1123(*; "BtnNext"; True:C214)
			
		End if 
	End for 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function clicOnday($e : Object)
	
	var $date : Date:=This:C1470.firstDisplayedDay+Num:C11($e.objectName)-1
	This:C1470.setSelectedDate($date)
	
	If (This:C1470.autoClose)
		
		ACCEPT:C269
		
	Else 
		
		This:C1470.update(True:C214)
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function manageFocus($e : Object)
	
	$e:=$e || FORM Event:C1606
	var $visible : Boolean:=($e.code=On Activate:K2:9)
	
	OBJECT SET VISIBLE:C603(*; "DummyBtn@"; $visible)
	OBJECT SET ENABLED:C1123(*; "DummyBtn@"; $visible)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function dialog($fromButton : Boolean) : Date
	
	If ($fromButton)
		
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
		
		This:C1470.autoClose:=True:C214
		This:C1470.useArrows:=True:C214
		
	End if 
	
	var $date:=This:C1470.date
	var $winRef:=Open form window:C675(String:C10(This:C1470.formName); Movable form dialog box no title:K39:20; $left; $top)
	
	DIALOG:C40(This:C1470.formName; This:C1470)
	
	If (Bool:C1537(OK))
		
		// MARK: ACI0105847
		<>DatePicker_DefaultDate:=This:C1470.date
		
	Else 
		
		This:C1470.date:=$date
		
	End if 
	
	return This:C1470.date
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function computeFirstDay($date : Date)
	
	This:C1470.date:=$date || This:C1470.date
	
	If (This:C1470.date#!00-00-00!)
		
		var $monthPos; $yearPos : Text
		GET SYSTEM FORMAT:C994(Short date month position:K60:13; $monthPos)
		GET SYSTEM FORMAT:C994(Short date year position:K60:14; $yearPos)
		
		If (Num:C11($monthPos)<Num:C11($yearPos))
			
			OBJECT SET VALUE:C1742("DisplayedMonth"; This:C1470.months[Month of:C24(This:C1470.date)]+" "+String:C10(Year of:C25(This:C1470.date); "0000"))
			
		Else   // Maybe Japanese
			
			var $pattern : Text
			GET SYSTEM FORMAT:C994(System date long pattern:K60:9; $pattern)
			var $separator:=Position:C15(Char:C90(24180); $pattern)>0 ? Char:C90(24180) : " "
			OBJECT SET VALUE:C1742("DisplayedMonth"; String:C10(Year of:C25(This:C1470.date); "0000")+$separator+This:C1470.months[Month of:C24(This:C1470.date)])
			
		End if 
	End if 
	
	This:C1470.firstDayOfMonth:=Add to date:C393(!00-00-00!; Year of:C25(This:C1470.date); Month of:C24(This:C1470.date); 1)
	This:C1470.firstDisplayedDay:=This:C1470.firstDayOfMonth  // First day of the month displayed
	
	If (This:C1470.firstDayOfWeek>=1)\
		 && (This:C1470.firstDayOfWeek<=7)
		
		// Decrease on the first day until you reach the desired day of the week
		While (Day number:C114(This:C1470.firstDisplayedDay)#This:C1470.firstDayOfWeek)
			
			This:C1470.firstDisplayedDay-=1
			
		End while 
	End if 
	