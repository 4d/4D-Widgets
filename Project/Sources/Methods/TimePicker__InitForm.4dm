//%attributes = {"invisible":true}
C_POINTER:C301($PtrDefaultInited)

$PtrDefaultInited:=Self:C308(Object named:K67:5;"FormInited")
If (Not:C34(Is nil pointer:C315($PtrDefaultInited)))
	
	If ($PtrDefaultInited->=0)
		$PtrDefaultInited->:=1
		
		TimePicker SET MIN TIME ("";<>TimePicker_TimeMin)
		TimePicker SET MAX TIME ("";<>TimePicker_TimeMax)
		TimePicker SET STEP ("";<>TimePicker_Step)
		TimePicker SET LABEL AM ("";<>TimePicker_LabelAM)
		TimePicker SET LABEL PM ("";<>TimePicker_LabelPM)
		
	End if   //already inited
End if   //not nil
