//%attributes = {"invisible":true}
C_BOOLEAN:C305(<>TimePicker_Inited)

If (Not:C34(<>TimePicker_Inited))
	
	<>TimePicker_Inited:=True:C214
	
	C_BOOLEAN:C305(<>TimePicker_CloseDial)
	C_POINTER:C301(<>TimePicker_Target)
	
	C_TEXT:C284(<>TimePicker_LabelAM)
	C_TEXT:C284(<>TimePicker_LabelPM)
	C_TIME:C306(<>TimePicker_TimeMin)
	C_TIME:C306(<>TimePicker_TimeMax)
	C_TIME:C306(<>TimePicker_Step)
	
	C_TIME:C306(<>TimePicker_SelectedTime)
	C_TIME:C306(<>TimePicker_DummyTime)
	
	  // Default value
	
	C_TEXT:C284($AMLabel)
	C_TEXT:C284($PMLabel)
	
	GET SYSTEM FORMAT:C994(System time AM label:K60:15;$AMLabel)
	GET SYSTEM FORMAT:C994(System time PM label:K60:16;$PMLabel)
	
	If (True:C214)
		<>TimePicker_LabelAM:=$AMLabel
		<>TimePicker_LabelPM:=$PMLabel
		<>TimePicker_TimeMin:=?08:00:00?
		<>TimePicker_TimeMax:=?20:00:00?
		<>TimePicker_Step:=?00:15:00?
		
		<>TimePicker_SelectedTime:=?00:00:00?
	Else 
		TimePicker SET DEFAULT LABEL AM ($AMLabel)
		TimePicker SET DEFAULT LABEL PM ($PMLabel)
		TimePicker SET DEFAULT MIN TIME (?08:00:00?)
		TimePicker SET DEFAULT MAX TIME (?20:00:00?)
		TimePicker SET DEFAULT STEP (?00:15:00?)
		
	End if 
	
	<>TimePicker_Target:=-><>TimePicker_DummyTime
	
End if 
