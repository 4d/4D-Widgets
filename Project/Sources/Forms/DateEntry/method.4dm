//modified by RL on avril 2nd 2010  ∆∆∆
// replace hard coded "/" system date separators

C_DATE:C307($DisplayedDate)

C_LONGINT:C283($start; $i)
C_LONGINT:C283($dayWidth; $monthWidth; $yearWidth)

C_TEXT:C284($dateSeparator)
C_TEXT:C284($PositionDay_t; $PositionMonth_t; $PositionYear_t)
C_TEXT:C284($DayZoneName; $monthZoneName; $YearZoneName)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  //usefull when the widget is not in page 1 of the main form
		
		//On load Only
		
		DatePicker__InitInter
		DatePicker__InitForm
		DateEntry__ManageFocus(On Deactivate:K2:10)
		
		// Common code On Load / On bound variable change
		
		$DisplayedDate:=DatePicker__GetTarget
		$DisplayedDate:=DatePicker__SetSelectedDate($DisplayedDate; "")
		DatePicker__CalculateFirstDay($DisplayedDate; "")
		
		// set sources of input zones according to system settings
		
		$dayWidth:=17
		$monthWidth:=17
		$yearWidth:=34
		
		ARRAY LONGINT:C221($_Width; 5)
		ARRAY POINTER:C280($_inputs; 3)
		ARRAY TEXT:C222($_inputNames; 5)
		
		$_Width{2}:=8  // slash1
		$_Width{4}:=8  //slash2
		
		$_inputNames{1}:="LeftEntry"
		$_inputNames{2}:="Slash1"
		$_inputNames{3}:="CenterEntry"
		$_inputNames{4}:="Slash2"
		$_inputNames{5}:="RightEntry"
		
		$_inputs{1}:=OBJECT Get pointer:C1124(Object named:K67:5; "LeftEntry")
		$_inputs{2}:=OBJECT Get pointer:C1124(Object named:K67:5; "CenterEntry")
		$_inputs{3}:=OBJECT Get pointer:C1124(Object named:K67:5; "RightEntry")
		
		
		GET SYSTEM FORMAT:C994(Short date day position:K60:12; $PositionDay_t)
		GET SYSTEM FORMAT:C994(Short date month position:K60:13; $PositionMonth_t)
		GET SYSTEM FORMAT:C994(Short date year position:K60:14; $PositionYear_t)
		
		Case of 
			: ($PositionDay_t="1") & ($PositionMonth_t="2") & ($PositionYear_t="3")  //DD/MM/YYYY
				$DayZoneName:="LeftEntry"
				$monthZoneName:="CenterEntry"
				$YearZoneName:="RightEntry"
				$_Width{1}:=$dayWidth
				$_Width{3}:=$monthWidth
				$_Width{5}:=$yearWidth
				
			: ($PositionDay_t="1") & ($PositionYear_t="2") & ($PositionMonth_t="3")  //DD/YYYY/MM
				$DayZoneName:="LeftEntry"
				$YearZoneName:="CenterEntry"
				$monthZoneName:="RightEntry"
				$_Width{1}:=$dayWidth
				$_Width{3}:=$yearWidth
				$_Width{5}:=$monthWidth
				
			: ($PositionMonth_t="1") & ($PositionDay_t="2") & ($PositionYear_t="3")  //MM/DD/YYYY
				$monthZoneName:="LeftEntry"
				$DayZoneName:="CenterEntry"
				$YearZoneName:="RightEntry"
				$_Width{1}:=$monthWidth
				$_Width{3}:=$dayWidth
				$_Width{5}:=$yearWidth
				
			: ($PositionYear_t="1") & ($PositionDay_t="2") & ($PositionMonth_t="3")  //YYYY/DD/MM
				$YearZoneName:="LeftEntry"
				$DayZoneName:="CenterEntry"
				$monthZoneName:="RightEntry"
				$_Width{1}:=$yearWidth
				$_Width{3}:=$dayWidth
				$_Width{5}:=$monthWidth
				
			: ($PositionMonth_t="1") & ($PositionYear_t="2") & ($PositionDay_t="3")  //MM/YYYY/DD
				$monthZoneName:="LeftEntry"
				$YearZoneName:="CenterEntry"
				$DayZoneName:="RightEntry"
				$_Width{1}:=$monthWidth
				$_Width{3}:=$yearWidth
				$_Width{5}:=$dayWidth
				
			: ($PositionYear_t="1") & ($PositionMonth_t="2") & ($PositionDay_t="3")  //YYYY/MM/DD
				$YearZoneName:="LeftEntry"
				$monthZoneName:="CenterEntry"
				$DayZoneName:="RightEntry"
				$_Width{1}:=$yearWidth
				$_Width{3}:=$monthWidth
				$_Width{5}:=$dayWidth
				
			Else   // default values
				
				$DayZoneName:="LeftEntry"
				$monthZoneName:="CenterEntry"
				$YearZoneName:="RightEntry"
				$_Width{1}:=$dayWidth
				$_Width{3}:=$monthWidth
				$_Width{5}:=$yearWidth
				
		End case 
		
		// SAVE names in the form
		
		(OBJECT Get pointer:C1124(Object named:K67:5; "DayZoneName"))->:=$DayZoneName
		(OBJECT Get pointer:C1124(Object named:K67:5; "MonthZoneName"))->:=$monthZoneName
		(OBJECT Get pointer:C1124(Object named:K67:5; "YearZoneName"))->:=$YearZoneName
		
		// resize objects (the order will NOT be changed !!!)
		OBJECT GET COORDINATES:C663(*; $_inputNames{1}; $x1; $y1; $x2; $y2)
		$start:=$x1
		For ($i; 1; 5)
			OBJECT MOVE:C664(*; $_inputNames{$i}; $start; $y1; $start+$_Width{$i}; $y2; *)
			$start:=$start+$_Width{$i}
		End for 
		
		OBJECT SET FORMAT:C236(*; $DayZoneName; "00")
		OBJECT SET FORMAT:C236(*; $monthZoneName; "00")
		OBJECT SET FORMAT:C236(*; $YearZoneName; "0000")
		
		
		GET SYSTEM FORMAT:C994(Date separator:K60:10; $dateSeparator)  //∆∆∆
		OBJECT SET TITLE:C194(*; "Slash1"; $dateSeparator)
		OBJECT SET TITLE:C194(*; "Slash2"; $dateSeparator)
		
		(OBJECT Get pointer:C1124(Object named:K67:5; $DayZoneName))->:=String:C10(Day of:C23($DisplayedDate); "00")
		(OBJECT Get pointer:C1124(Object named:K67:5; $monthZoneName))->:=String:C10(Month of:C24($DisplayedDate); "00")
		(OBJECT Get pointer:C1124(Object named:K67:5; $YearZoneName))->:=String:C10(Year of:C25($DisplayedDate); "0000")
		
		OBJECT SET FOCUS RECTANGLE INVISIBLE:C1177(*; "@"; True:C214)
		
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		// Common code On Load / On bound variable change
		
		
		$DisplayedDate:=DatePicker__GetTarget
		$DisplayedDate:=DatePicker__SetSelectedDate($DisplayedDate; "")
		
		DatePicker__CalculateFirstDay($DisplayedDate; "")
		
		$DayZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "DayZoneName"))->
		$monthZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "MonthZoneName"))->
		$YearZoneName:=(OBJECT Get pointer:C1124(Object named:K67:5; "YearZoneName"))->
		
		(OBJECT Get pointer:C1124(Object named:K67:5; $DayZoneName))->:=String:C10(Day of:C23($DisplayedDate); "00")
		(OBJECT Get pointer:C1124(Object named:K67:5; $monthZoneName))->:=String:C10(Month of:C24($DisplayedDate); "00")
		(OBJECT Get pointer:C1124(Object named:K67:5; $YearZoneName))->:=String:C10(Year of:C25($DisplayedDate); "0000")
		
		
	: (Form event code:C388=On Activate:K2:9)
		
		DateEntry__ManageFocus(Form event code:C388)
		
	: (Form event code:C388=On Deactivate:K2:10)
		
		DateEntry__ManageFocus(Form event code:C388)
		
End case 