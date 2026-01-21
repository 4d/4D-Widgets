//%attributes = {"invisible":true}
If (OBJECT Get value:C1743("FormInited")=0)
	
	OBJECT SET VALUE:C1742("FormInited"; 1)
	
	TimePicker SET MIN TIME(""; <>TimePicker_TimeMin)
	TimePicker SET MAX TIME(""; <>TimePicker_TimeMax)
	TimePicker SET STEP(""; <>TimePicker_Step)
	TimePicker SET LABEL AM(""; <>TimePicker_LabelAM)
	TimePicker SET LABEL PM(""; <>TimePicker_LabelPM)
	
End if 
