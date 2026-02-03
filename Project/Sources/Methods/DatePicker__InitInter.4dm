//%attributes = {"invisible":true}
var <>DatePicker_Inited : Boolean

If (Not:C34(<>DatePicker_Inited))
	
	<>DatePicker_Inited:=True:C214
	
	//var <>DatePicker_CloseDial : Boolean
	//var <>DatePicker_ActivateArrows : Boolean
	//C_POINTER(datePicker_Target)
	var <>DatePicker_GetBlob : Boolean
	
	
	var <>DatePicker_DateMin : Date
	var <>DatePicker_DateMax : Date
	var <>DatePicker_DefaultDate : Date  //ACI0099964 renamed, was <>DatePicker_SelectedDate
	
	var <>DatePicker_FirstDayOfWeek : Integer
	
	ARRAY TEXT:C222(<>_DatePicker_ListDays; 7)
	<>_DatePicker_ListDays{1}:=Localized string:C991("Days_Sunday")
	<>_DatePicker_ListDays{2}:=Localized string:C991("Days_Monday")
	<>_DatePicker_ListDays{3}:=Localized string:C991("Days_Tuesday")
	<>_DatePicker_ListDays{4}:=Localized string:C991("Days_Wednesday")
	<>_DatePicker_ListDays{5}:=Localized string:C991("Days_Thursday")
	<>_DatePicker_ListDays{6}:=Localized string:C991("Days_Friday")
	<>_DatePicker_ListDays{7}:=Localized string:C991("Days_Saturday")
	
	ARRAY TEXT:C222(<>_DatePicker_ListMonthes; 12)
	<>_DatePicker_ListMonthes{1}:=Localized string:C991("Monthes_January")
	<>_DatePicker_ListMonthes{2}:=Localized string:C991("Monthes_February")
	<>_DatePicker_ListMonthes{3}:=Localized string:C991("Monthes_March")
	<>_DatePicker_ListMonthes{4}:=Localized string:C991("Monthes_April")
	<>_DatePicker_ListMonthes{5}:=Localized string:C991("Monthes_May")
	<>_DatePicker_ListMonthes{6}:=Localized string:C991("Monthes_June")
	<>_DatePicker_ListMonthes{7}:=Localized string:C991("Monthes_July")
	<>_DatePicker_ListMonthes{8}:=Localized string:C991("Monthes_August")
	<>_DatePicker_ListMonthes{9}:=Localized string:C991("Monthes_September")
	<>_DatePicker_ListMonthes{10}:=Localized string:C991("Monthes_October")
	<>_DatePicker_ListMonthes{11}:=Localized string:C991("Monthes_November")
	<>_DatePicker_ListMonthes{12}:=Localized string:C991("Monthes_December")
	
	ARRAY DATE:C224(<>_DatePicker_DaysOff1; 0)
	ARRAY DATE:C224(<>_DatePicker_DaysOff2; 0)
	
	
	ARRAY BOOLEAN:C223(<>_DatePicker_DaysOff0; 7)
	<>_DatePicker_DaysOff0{Saturday:K10:18}:=True:C214
	<>_DatePicker_DaysOff0{Sunday:K10:19}:=True:C214
	
	// default balues
	<>DatePicker_DefaultDate:=!00-00-00!
	<>DatePicker_DateMin:=!00-00-00!
	<>DatePicker_DateMax:=!00-00-00!
	
	<>DatePicker_FirstDayOfWeek:=Monday:K10:13
	
	dummyDate:=!00-00-00!  // ACI0097774 the returned pointer can't be NIL
	//datePicker_Target:=->dummyDate  // ACI0097774 the returned pointer can't be NIL
	// TM 2019-05-24 - don't use process variables to allow two instances.
End if 
