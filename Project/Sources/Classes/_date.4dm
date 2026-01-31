Class extends _widget

property date:=!00-00-00!

property minDate; maxDate : Date

property firstOfCurrentMonth : Date
property firstDayOfWeek : Integer

property displayedMonth : Text
property firstDisplayedDay : Date

property dayOff0:=[]
property dayOff1:=[]
property dayOff2:=[]

property days:=[\
Null:C1517; \
Localized string:C991("Days_Sunday"); \
Localized string:C991("Days_Monday"); \
Localized string:C991("Days_Tuesday"); \
Localized string:C991("Days_Wednesday"); \
Localized string:C991("Days_Thursday"); \
Localized string:C991("Days_Friday"); \
Localized string:C991("Days_Saturday")\
]

property months:=[\
Null:C1517; \
Localized string:C991("Monthes_January"); \
Localized string:C991("Monthes_February"); \
Localized string:C991("Monthes_March"); \
Localized string:C991("Monthes_April"); \
Localized string:C991("Monthes_May"); \
Localized string:C991("Monthes_June"); \
Localized string:C991("Monthes_July"); \
Localized string:C991("Monthes_August"); \
Localized string:C991("Monthes_September"); \
Localized string:C991("Monthes_October"); \
Localized string:C991("Monthes_November"); \
Localized string:C991("Monthes_December")\
]

//property daysOff:=[].resize(8; False)

property inited:=False:C215

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor()
	
	Super:C1705()
	
	This:C1470.minDate:=<>DatePicker_DateMin
	This:C1470.maxDate:=<>DatePicker_DateMax
	//This.firstDayOfWeek:=<>DatePicker_FirstDayOfWeek
	
	ARRAY TO COLLECTION:C1563(This:C1470.dayOff0; <>_DatePicker_DaysOff0)
	ARRAY TO COLLECTION:C1563(This:C1470.dayOff1; <>_DatePicker_DaysOff1)
	ARRAY TO COLLECTION:C1563(This:C1470.dayOff2; <>_DatePicker_DaysOff2)
	
/*
This.daysOff[Saturday]:=True
This.daysOff[Sunday]:=True
*/
	
	This:C1470.defaultValues()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Super:C1706.init()
	
	var $date:=This:C1470.date || Current date:C33
	var $month:=Month of:C24($date)
	var $year:=Year of:C25($date)
	var $PositionMonth; $PositionYear : Text
	GET SYSTEM FORMAT:C994(Short date month position:K60:13; $PositionMonth)
	GET SYSTEM FORMAT:C994(Short date year position:K60:14; $PositionYear)
	
	If (Num:C11($PositionMonth)<Num:C11($PositionYear))  // standard case
		
		This:C1470.displayedMonth:=This:C1470.months[$month]+" "+String:C10($year; "0000")
		
	Else   // Japanese case (presumably)
		
		var $dateLongPattern : Text
		GET SYSTEM FORMAT:C994(System date long pattern:K60:9; $dateLongPattern)
		
		var $JapaneseYearCode : Integer:=24180
		
		If (Position:C15(Char:C90($JapaneseYearCode); $dateLongPattern)>0)
			
			This:C1470.displayedMonth:=String:C10($year; "0000")+Char:C90($JapaneseYearCode)+This:C1470.months[$month]
			
		Else 
			
			// Not Japanese after all !!! ;o)
			This:C1470.displayedMonth:=String:C10($year; "0000")+" "+This:C1470.months[$month]
			
		End if 
		
		This:C1470.displayedMonth:=String:C10($year; "0000")+<>Date_separator+This:C1470.months[$month]
		
	End if 
	
	This:C1470.firstDisplayedDay:=Add to date:C393(!00-00-00!; $year; $month; 1)
	This:C1470.firstDayOfWeek:=This:C1470.firstDayOfWeek || <>DatePicker_FirstDayOfWeek
	
	If (This:C1470.firstDayOfWeek>=1)\
		 & (This:C1470.firstDayOfWeek<=7)
		
		// Decrease the first day displayed until reaching the desired weekday.
		While (Day number:C114(This:C1470.firstDisplayedDay)#This:C1470.firstDayOfWeek)
			
			This:C1470.firstDisplayedDay:=This:C1470.firstDisplayedDay-1
			
		End while 
	End if 
	
	This:C1470.date:=<>DatePicker_DefaultDate#!00-00-00! ? <>DatePicker_DefaultDate : Current date:C33
	
	This:C1470.firstOfCurrentMonth:=Add to date:C393(!00-00-00!; Year of:C25(This:C1470.date); Month of:C24(This:C1470.date); 1)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function Update()
	
	var $date:=This:C1470.getSelectedDate()
	This:C1470.setSelectedDate($date)
	This:C1470.Display()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function Display($recalculation : Boolean)
	
	//
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function defaultValues($force : Boolean)
	
	If (Not:C34(This:C1470.inited) || $force)
		
		ARRAY DATE:C224(<>_DatePicker_DaysOff1; 0)
		ARRAY DATE:C224(<>_DatePicker_DaysOff2; 0)
		
		ARRAY BOOLEAN:C223(<>_DatePicker_DaysOff0; 7)
		<>_DatePicker_DaysOff0{Saturday:K10:18}:=True:C214
		<>_DatePicker_DaysOff0{Sunday:K10:19}:=True:C214
		
		var <>DatePicker_DefaultDate:=!00-00-00!
		var <>DatePicker_DateMin:=!00-00-00!
		var <>DatePicker_DateMax:=!00-00-00!
		
		var <>Date_separator : Text
		GET SYSTEM FORMAT:C994(Date separator:K60:10; <>Date_separator)
		
		var <>DatePicker_FirstDayOfWeek : Integer:=Monday:K10:13
		
		var <>DatePicker_CloseDial : Boolean
		var <>DatePicker_ActivateArrows : Boolean
		
		var <>DatePicker_GetBlob : Boolean
		
		This:C1470.inited:=True:C214
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function getSelectedDate() : Date
	
	var $o:=This:C1470.getContainerValue()
	
	If ($o.type=Is date:K8:7)
		
		return Date:C102($o.value)
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function setSelectedDate($date : Date)
	
	This:C1470.date:=This:C1470.constraints($date)
	This:C1470.setContainerValue(This:C1470.date; [Is date:K8:7; Is undefined:K8:13])
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function constraints($date : Date) : Date
	
	Case of 
			
			//________________________________________________________________________________
		: ($date<This:C1470.minDate)\
			 & (This:C1470.minDate#!00-00-00!)
			
			$date:=This:C1470.minDate
			
			//________________________________________________________________________________
		: ($date>This:C1470.maxDate)\
			 & (This:C1470.maxDate#!00-00-00!)
			
			$date:=This:C1470.maxDate
			
			//________________________________________________________________________________
	End case 
	
	return Date:C102($date)