//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($Form)

C_DATE:C307($Date)
C_DATE:C307($FindDate)
C_DATE:C307($CurrentDate)
C_DATE:C307($MinDate)
C_DATE:C307($MaxDate)
C_DATE:C307($SelectedDate)
C_DATE:C307($FirstDisplayedDay)
C_DATE:C307($FirstOfNextMonth)

C_LONGINT:C283($p)
C_LONGINT:C283($Day;$DayNumber;$DayWeek)
C_LONGINT:C283($i)
C_LONGINT:C283($FirstDayOfWeek)
C_LONGINT:C283($ArraySize)
C_LONGINT:C283($Month;$CurrentMonth)
C_LONGINT:C283($Style)
C_LONGINT:C283($Year)

C_TEXT:C284($DayValue)
C_TEXT:C284($ObjectName)
C_TEXT:C284($label)

C_BOOLEAN:C305($SomeDaysOff)
C_BOOLEAN:C305($DayOff)

C_POINTER:C301($ptrBtn)
C_POINTER:C301($Ptr_ListDays)


ARRAY BOOLEAN:C223($_WeeklyDaysOff;7)


If (Count parameters:C259>=1)
	$Form:=$1
Else 
	$Form:=""
End if 

  //this parameter seems to be useless
  // (but "if it ain't broken, don't fix it")
$Form:=""


$ptrBtn:=Self:C308(Object named:K67:5;"DatePicker_Btn_1")
If (Not:C34(Is nil pointer:C315($ptrBtn)))
	
	DatePicker__GetMinDate (->$MinDate)
	DatePicker__GetMaxDate (->$MaxDate)
	DatePicker__GetWeekDaysOff (->$_WeeklyDaysOff)
	
	DatePicker__GetSelectedDate (->$SelectedDate)
	If ($SelectedDate<$MinDate) & ($MinDate#!00-00-00!)
		$SelectedDate:=$MinDate
		DatePicker__CalculateFirstDay ($SelectedDate)
	End if 
	If ($SelectedDate>$MaxDate) & ($MaxDate#!00-00-00!)
		$SelectedDate:=$MaxDate
		DatePicker__CalculateFirstDay ($SelectedDate)
	End if 
	DatePicker__SetSelectedDate ($SelectedDate;"")
	
	Tool_ObjectToVar ("FirstDisplayedDay";->$FirstDisplayedDay)
	Tool_ObjectToVar ("FirstDayOfWeek";->$FirstDayOfWeek)  //specific form
	
	  // draw the name of the month and the initials of day of weeks
	
	$Ptr_ListDays:=Self:C308(Object named:K67:5;"_ListDays")
	
	If (Not:C34(Is nil pointer:C315($Ptr_ListDays)))
		If (Size of array:C274($Ptr_ListDays->)=7)
			  // et affectation dans les objets
			For ($i;1;7)
				$DayValue:=Substring:C12($Ptr_ListDays->{($i-2+$FirstDayOfWeek)%7+1};1;2)
				Tool_VarToObject (->$DayValue;"DayName"+String:C10($i))
			End for 
		Else 
			  //not initialised yet
		End if 
	End if 
	
	ARRAY DATE:C224($_DaysOff1;0)
	ARRAY DATE:C224($_DaysOff2;0)
	
	DatePicker__GetDaysOff (0;->$_DaysOff1;"")
	DatePicker__GetDaysOff (1;->$_DaysOff2;"")
	
	  //Si (Faux)
	$ArraySize:=Size of array:C274($_DaysOff1)+Size of array:C274($_DaysOff2)
	If ($ArraySize>0)
		$SomeDaysOff:=True:C214
	Else 
		$SomeDaysOff:=False:C215
	End if 
	
	
	  //Si ($SelectedDate=!00/00/00!)
	  //$SelectedDate:=Date du jour
	  //Fin de si 
	
	If ($FirstDisplayedDay=!00-00-00!)
		DatePicker__CalculateFirstDay (Current date:C33)
		Tool_ObjectToVar ("FirstDisplayedDay";->$FirstDisplayedDay)
	End if 
	
	$CurrentMonth:=Month of:C24($FirstDisplayedDay+7)
	
	OBJECT SET RGB COLORS:C628(*;"DatePicker_Btn_@";0;0)
	
	For ($i;1;42)  //42 objects to fill
		
		$Date:=$FirstDisplayedDay+$i-1
		$DayWeek:=Day number:C114($date)
		$Day:=Day of:C23($date)
		$Month:=Month of:C24($date)
		$Year:=Year of:C25($date)
		
		
		  //1st,  lets label the button
		$ObjectName:="DatePicker_Btn_"+String:C10($i)
		OBJECT SET TITLE:C194(*;$ObjectName;String:C10(Day of:C23($date)))
		
		
		  //is this particular day a day off ?  **********************************
		$DayOff:=False:C215
		If ($SomeDaysOff)
			$FindDate:=$Date
			$p:=Find in array:C230($_DaysOff2;$FindDate)
			If ($p>0)
				$DayOff:=True:C214
			Else 
				$FindDate:=Add to date:C393(!00-00-00!;2000;$Month;$Day)
				$p:=Find in array:C230($_DaysOff1;$FindDate)
				If ($p>0)
					$DayOff:=True:C214
				End if 
			End if 
		End if 
		
		  //does this day belong the the defined range (if any) ?  ***********************************
		
		If ($date<$MinDate) | (($MaxDate#!00-00-00!) & ($date>$MaxDate))
			OBJECT SET ENABLED:C1123(*;$ObjectName;False:C215)
		Else 
			OBJECT SET ENABLED:C1123(*;$ObjectName;True:C214)
		End if 
		
		
		  // is it a weekly day off ?   **********************************
		
		If ($_WeeklyDaysOff{$DayWeek})
			$Style:=Bold:K14:2+Italic:K14:3
		Else 
			$Style:=Plain:K14:1
		End if 
		OBJECT SET FONT STYLE:C166(*;$ObjectName;$Style)
		
		
		  //is it the currently selected day  **********************************
		
		$ptrBtn:=Self:C308(Object named:K67:5;$ObjectName)
		
		If ($Date=$SelectedDate)
			$ptrBtn->:=1
			OBJECT SET RGB COLORS:C628(*;$ObjectName;0x00FFFFFF;0x00FFFFFF)
		Else 
			$ptrBtn->:=0
		End if 
		
		  //does it belong to the current month ?
		If (Month of:C24($Date)=$CurrentMonth)
			
			  //yes
			If ($DayOff)
				OBJECT SET RGB COLORS:C628(*;$ObjectName;0x00B00000;0x00B00000)  //RED
				OBJECT SET FONT STYLE:C166(*;$ObjectName;($Style | Bold:K14:2))
			Else 
				  //OBJECT SET RGB COLORS(*;$ObjectName;0;0)
			End if 
			
		Else 
			  //no
			If ($DayOff)
				OBJECT SET RGB COLORS:C628(*;$ObjectName;0x00D08080;0x00D08080)  // PINK
				OBJECT SET FONT STYLE:C166(*;$ObjectName;($Style | Bold:K14:2))
			Else 
				OBJECT SET RGB COLORS:C628(*;$ObjectName;0x00404040;0x00404040)  // grey
			End if 
			
		End if 
		
		  //bold face for LMMJVSD
		If ($i<=7)
			$label:="DayName"+String:C10($i)
			OBJECT SET FONT STYLE:C166(*;$label;$Style)
		End if 
		
		
	End for 
	
	If (True:C214)
		
		If ($FirstDisplayedDay<$MinDate)
			OBJECT SET ENABLED:C1123(*;"BtnPrevious";False:C215)
		Else 
			OBJECT SET ENABLED:C1123(*;"BtnPrevious";True:C214)
		End if 
		
		$DayNumber:=Day of:C23($date)
		$FirstOfNextMonth:=Add to date:C393($date;0;0;(1+(($DayNumber)*(-1))))
		
		If (($MaxDate#!00-00-00!) & ($FirstOfNextMonth>$MaxDate))
			OBJECT SET ENABLED:C1123(*;"BtnNext";False:C215)
		Else 
			OBJECT SET ENABLED:C1123(*;"BtnNext";True:C214)
		End if 
		
		OBJECT SET ENABLED:C1123(*;"BtnToday";True:C214)
		$CurrentDate:=Current date:C33
		Case of 
			: ($CurrentDate<$MinDate)
				OBJECT SET ENABLED:C1123(*;"BtnToday";False:C215)
			: ($CurrentDate>$MaxDate) & ($MaxDate#!00-00-00!)
				OBJECT SET ENABLED:C1123(*;"BtnToday";False:C215)
		End case 
		
	End if 
	
End if 
