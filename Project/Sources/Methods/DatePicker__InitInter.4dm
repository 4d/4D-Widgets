//%attributes = {"invisible":true}
C_BOOLEAN:C305(<>DatePicker_Inited)

If (Not:C34(<>DatePicker_Inited))
	
	<>DatePicker_Inited:=True:C214
	
	C_BOOLEAN:C305(<>DatePicker_CloseDial)
	C_BOOLEAN:C305(<>DatePicker_ActivateArrows)
	  //C_POINTER(datePicker_Target)
	C_BOOLEAN:C305(<>DatePicker_GetBlob)
	
	
	C_DATE:C307(<>DatePicker_DateMin)
	C_DATE:C307(<>DatePicker_DateMax)
	C_DATE:C307(<>DatePicker_DefaultDate)  //ACI0099964 renamed, was <>DatePicker_SelectedDate
	
	C_LONGINT:C283(<>DatePicker_FirstDayOfWeek)
	
	ARRAY TEXT:C222(<>_DatePicker_ListDays;7)
	<>_DatePicker_ListDays{1}:=Get localized string:C991("Days_Sunday")
	<>_DatePicker_ListDays{2}:=Get localized string:C991("Days_Monday")
	<>_DatePicker_ListDays{3}:=Get localized string:C991("Days_Tuesday")
	<>_DatePicker_ListDays{4}:=Get localized string:C991("Days_Wednesday")
	<>_DatePicker_ListDays{5}:=Get localized string:C991("Days_Thursday")
	<>_DatePicker_ListDays{6}:=Get localized string:C991("Days_Friday")
	<>_DatePicker_ListDays{7}:=Get localized string:C991("Days_Saturday")
	
	ARRAY TEXT:C222(<>_DatePicker_ListMonthes;12)
	<>_DatePicker_ListMonthes{1}:=Get localized string:C991("Monthes_January")
	<>_DatePicker_ListMonthes{2}:=Get localized string:C991("Monthes_February")
	<>_DatePicker_ListMonthes{3}:=Get localized string:C991("Monthes_March")
	<>_DatePicker_ListMonthes{4}:=Get localized string:C991("Monthes_April")
	<>_DatePicker_ListMonthes{5}:=Get localized string:C991("Monthes_May")
	<>_DatePicker_ListMonthes{6}:=Get localized string:C991("Monthes_June")
	<>_DatePicker_ListMonthes{7}:=Get localized string:C991("Monthes_July")
	<>_DatePicker_ListMonthes{8}:=Get localized string:C991("Monthes_August")
	<>_DatePicker_ListMonthes{9}:=Get localized string:C991("Monthes_September")
	<>_DatePicker_ListMonthes{10}:=Get localized string:C991("Monthes_October")
	<>_DatePicker_ListMonthes{11}:=Get localized string:C991("Monthes_November")
	<>_DatePicker_ListMonthes{12}:=Get localized string:C991("Monthes_December")
	
	ARRAY DATE:C224(<>_DatePicker_DaysOff1;0)
	ARRAY DATE:C224(<>_DatePicker_DaysOff2;0)
	
	
	ARRAY BOOLEAN:C223(<>_DatePicker_DaysOff0;7)
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
