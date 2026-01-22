//%attributes = {"invisible":true}
var <>TimePicker_Inited : Boolean

If (Not:C34(<>TimePicker_Inited))
	
	var <>TimePicker_CloseDial : Boolean
	var <>TimePicker_LabelAM : Text
	var <>TimePicker_LabelPM : Text
	var <>TimePicker_TimeMin : Time
	var <>TimePicker_TimeMax : Time
	var <>TimePicker_Step : Time
	
	var <>TimePicker_SelectedTime : Time
	
	// Default value
	var $AMLabel : Text
	var $PMLabel : Text
	
	GET SYSTEM FORMAT:C994(System time AM label:K60:15; $AMLabel)
	GET SYSTEM FORMAT:C994(System time PM label:K60:16; $PMLabel)
	
	<>TimePicker_LabelAM:=$AMLabel
	<>TimePicker_LabelPM:=$PMLabel
	<>TimePicker_TimeMin:=?08:00:00?
	<>TimePicker_TimeMax:=?20:00:00?
	<>TimePicker_Step:=?00:15:00?
	<>TimePicker_SelectedTime:=?00:00:00?
	
	<>TimePicker_Inited:=True:C214
	
End if 