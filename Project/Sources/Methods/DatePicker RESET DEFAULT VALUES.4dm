//%attributes = {"invisible":true,"shared":true}

// Reset days off arrays
ARRAY DATE:C224(<>_DatePicker_DaysOff1; 0)
ARRAY DATE:C224(<>_DatePicker_DaysOff2; 0)

ARRAY BOOLEAN:C223(<>_DatePicker_DaysOff0; 7)
<>_DatePicker_DaysOff0{Saturday:K10:18}:=True:C214
<>_DatePicker_DaysOff0{Sunday:K10:19}:=True:C214

// default values
<>DatePicker_DefaultDate:=!00-00-00!
<>DatePicker_DateMin:=!00-00-00!
<>DatePicker_DateMax:=!00-00-00!

<>DatePicker_FirstDayOfWeek:=Monday:K10:13