//%attributes = {"invisible":true}
C_POINTER:C301($PtrDefaultInited)
C_POINTER:C301($Ptr_ListDays)
C_POINTER:C301($Ptr_ListMonthes)

C_DATE:C307($SelectedDate)
C_DATE:C307($FirstOfCurrentMonth)

$PtrDefaultInited:=OBJECT Get pointer:C1124(Object named:K67:5;"FormInited")
If (Not:C34(Is nil pointer:C315($PtrDefaultInited)))
	
	If ($PtrDefaultInited->=0)
		
		$PtrDefaultInited->:=1
		
		$Ptr_ListDays:=OBJECT Get pointer:C1124(Object named:K67:5;"_ListDays")
		If (Not:C34(Is nil pointer:C315($Ptr_ListDays)))
			ARRAY TEXT:C222($Ptr_ListDays->;0)
			COPY ARRAY:C226(<>_DatePicker_ListDays;$Ptr_ListDays->)
		End if 
		
		$Ptr_ListMonthes:=OBJECT Get pointer:C1124(Object named:K67:5;"_ListMonthes")
		If (Not:C34(Is nil pointer:C315($Ptr_ListMonthes)))
			ARRAY TEXT:C222($Ptr_ListMonthes->;0)
			COPY ARRAY:C226(<>_DatePicker_ListMonthes;$Ptr_ListMonthes->)
		End if 
		
		  // Affectation des valeurs par defaut dans le formulaire
		$SelectedDate:=DatePicker__SetSelectedDate (<>DatePicker_DefaultDate;"")
		
		DatePicker SET MIN DATE ("";<>DatePicker_DateMin)
		DatePicker SET MAX DATE ("";<>DatePicker_DateMax)
		DatePicker SET WEEK FIRST DAY ("";<>DatePicker_FirstDayOfWeek)
		
		DatePicker SET DAYS OFF ("";0;-><>_DatePicker_DaysOff0)
		DatePicker SET DAYS OFF ("";1;-><>_DatePicker_DaysOff1)
		DatePicker SET DAYS OFF ("";2;-><>_DatePicker_DaysOff2)
		
		DatePicker__CalculateFirstDay (<>DatePicker_DefaultDate;"")
		
		If (<>DatePicker_DefaultDate#!00-00-00!)
			$SelectedDate:=<>DatePicker_DefaultDate
		Else 
			$SelectedDate:=Current date:C33
		End if 
		
		$FirstOfCurrentMonth:=Add to date:C393(!00-00-00!;Year of:C25($SelectedDate);Month of:C24($SelectedDate);1)
		Tool_VarToObject (->$FirstOfCurrentMonth;"FirstOfCurrentMonth";"")
		
	End if   //already inited
	
End if   //not nil
