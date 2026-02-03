Class extends _widget

property date; minDate; maxDate : Date

property firstDayOfMonth : Date

property displayedMonth : Text
property firstDisplayedDay : Date

property separator : Text



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

property daysOff:=[].resize(8; False:C215)

property inited:=False:C215

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor()
	
	Super:C1705()
	
	This:C1470.defaultValues()
	
	This:C1470.minDate:=<>DatePicker_DateMin
	This:C1470.maxDate:=<>DatePicker_DateMax
	
	var $t : Text
	GET SYSTEM FORMAT:C994(Date separator:K60:10; $t)
	This:C1470.separator:=$t
	
	This:C1470.daysOff[Saturday:K10:18]:=True:C214
	This:C1470.daysOff[Sunday:K10:19]:=True:C214
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Super:C1706.init()
	
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
		
		var <>DatePicker_FirstDayOfWeek : Integer:=Monday:K10:13
		
		
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
	// Apply constraints, fills in This.date and updates the value of the container
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