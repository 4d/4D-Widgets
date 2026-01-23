//%attributes = {"invisible":true}
#DECLARE($force : Boolean)

var <>TimePicker_Inited : Boolean

If (Not:C34(<>TimePicker_Inited) || $force)
	
	var <>TimePicker_CloseDial : Boolean
	
	// Default value
	var <>TimePicker_LabelAM : Text
	GET SYSTEM FORMAT:C994(System time AM label:K60:15; <>TimePicker_LabelAM)
	var <>TimePicker_LabelPM : Text
	GET SYSTEM FORMAT:C994(System time PM label:K60:16; <>TimePicker_LabelPM)
	var <>Time_separator : Text
	GET SYSTEM FORMAT:C994(Time separator:K60:11; <>Time_separator)
	
	var <>TimePicker_TimeMin:=?08:00:00?
	var <>TimePicker_TimeMax:=?20:00:00?
	var <>TimePicker_Step:=?00:15:00?
	var <>TimePicker_SelectedTime:=?00:00:00?
	
	<>TimePicker_Inited:=True:C214
	
End if 