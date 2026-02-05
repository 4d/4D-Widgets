//%attributes = {"invisible":true}


//Release internal arrays
//ARRAY TEXT(<>DatePicker_ListMonthes; 0)
//ARRAY TEXT(<>DatePicker_ListDays; 0)

// Reset days off arrays
ARRAY BOOLEAN:C223(<>_DatePicker_DaysOff0; 0)
ARRAY DATE:C224(<>_DatePicker_DaysOff1; 0)
ARRAY DATE:C224(<>_DatePicker_DaysOff2; 0)


<>DatePicker_DateMin:=!00-00-00!
<>DatePicker_DateMax:=!00-00-00!

<>DatePicker_Inited:=False:C215
