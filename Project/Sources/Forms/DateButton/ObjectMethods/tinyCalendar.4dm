
var $selectedDate : Date

/*
var $datePicker_Target : Pointer
$datePicker_Target:=DatePicker__GetTarget  //Always returns a valid pointer (but maybe not on the associated variable)
// TM 2019-05-24 - don't use process variables to allow two instances.
$selectedDate:=$datePicker_Target->
*/

$selectedDate:=DatePicker__GetTarget  // date or object.value form the subform
$selectedDate:=DatePicker__SetSelectedDate($selectedDate)  //may modify the value based on constraints

DatePicker__SetBlob
<>DatePicker_GetBlob:=True:C214
$selectedDate:=DatePicker Display Dialog(-1; -1; $selectedDate)  // $datePicker_Target->)  //ACI0097346


If ($selectedDate#!00-00-00!)
	//$datePicker_Target:=DatePicker__GetTarget   // ACI 97878 : must call again because it has been set to "dummyDate" when calling "DatePicker Display Dialog"
	//$datePicker_Target->:=$selectedDate
	DatePicker__SetTarget($selectedDate)
End if 

