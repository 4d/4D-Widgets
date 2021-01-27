
C_DATE:C307($SelectedDate)
C_POINTER:C301($datePicker_Target)

$datePicker_Target:=DatePicker__GetTarget   //Always returns a valid pointer (but maybe not on the associated variable)
  // TM 2019-05-24 - don't use process variables to allow two instances.
$SelectedDate:=$datePicker_Target->
$SelectedDate:=DatePicker__SetSelectedDate ($SelectedDate)  //modifies the default value

DatePicker__SetBlob 
<>DatePicker_GetBlob:=True:C214
$SelectedDate:=DatePicker Display Dialog (-1;-1;$datePicker_Target->)  //ACI0097346

If ($SelectedDate#!00-00-00!)
	  //$datePicker_Target:=DatePicker__GetTarget   // ACI 97878 : must call again because it has been set to "dummyDate" when calling "DatePicker Display Dialog"
	$datePicker_Target->:=$SelectedDate
End if 
