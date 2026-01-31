Class extends _date

property data : cs:C1710._dateButton
property dayZoneName; monthZoneName; yearZoneName : Text
property posDay; posMonth; posYear : Integer

property dayWidth : Integer:=17
property monthWidth : Integer:=17
property yearWidth : Integer:=34

// Widgets
property width:=[Null:C1517; 0; 8; 0; 8; 0]
property widgets:=[Null:C1517; "LeftEntry"; "Slash1"; "CenterEntry"; "Slash2"; "RightEntry"]

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor($data : cs:C1710._dateButton)
	
	Super:C1705()
	
	This:C1470.data:=$data
	
	var $t
	GET SYSTEM FORMAT:C994(Short date day position:K60:12; $t)
	This:C1470.posDay:=Num:C11($t)
	
	GET SYSTEM FORMAT:C994(Short date month position:K60:13; $t)
	This:C1470.posMonth:=Num:C11($t)
	
	GET SYSTEM FORMAT:C994(Short date year position:K60:14; $t)
	This:C1470.posYear:=Num:C11($t)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Case of 
			//______________________________________________________
		: (This:C1470.posDay=1)\
			 && (This:C1470.posMonth=2)\
			 && (This:C1470.posYear=3)  // DD/MM/YYYY
			
			This:C1470.dayZoneName:=This:C1470.widgets[1]
			This:C1470.monthZoneName:=This:C1470.widgets[3]
			This:C1470.yearZoneName:=This:C1470.widgets[4]
			
			This:C1470.width[1]:=This:C1470.dayWidth
			This:C1470.width[3]:=This:C1470.monthWidth
			This:C1470.width[5]:=This:C1470.yearWidth
			
			//______________________________________________________
		: (This:C1470.posDay=1)\
			 && (This:C1470.posYear=2)\
			 && (This:C1470.posMonth=3)  // DD/YYYY/MM
			
			This:C1470.dayZoneName:=This:C1470.widgets[1]
			This:C1470.yearZoneName:=This:C1470.widgets[3]
			This:C1470.monthZoneName:=This:C1470.widgets[4]
			
			This:C1470.width[1]:=This:C1470.dayWidth
			This:C1470.width[3]:=This:C1470.yearWidth
			This:C1470.width[5]:=This:C1470.monthWidth
			
			//______________________________________________________
		: (This:C1470.posMonth=1)\
			 && (This:C1470.posDay=2)\
			 && (This:C1470.posYear=3)  // MM/DD/YYYY
			
			This:C1470.monthZoneName:=This:C1470.widgets[1]
			This:C1470.dayZoneName:=This:C1470.widgets[3]
			This:C1470.yearZoneName:=This:C1470.widgets[4]
			
			This:C1470.width[1]:=This:C1470.monthWidth
			This:C1470.width[3]:=This:C1470.dayWidth
			This:C1470.width[5]:=This:C1470.yearWidth
			
			//______________________________________________________
		: (This:C1470.posYear=1)\
			 && (This:C1470.posDay=2)\
			 && (This:C1470.posMonth=3)  // YYYY/DD/MM
			
			This:C1470.yearZoneName:=This:C1470.widgets[1]
			This:C1470.dayZoneName:=This:C1470.widgets[3]
			This:C1470.monthZoneName:=This:C1470.widgets[4]
			
			This:C1470.width[1]:=This:C1470.yearWidth
			This:C1470.width[3]:=This:C1470.dayWidth
			This:C1470.width[5]:=This:C1470.monthWidth
			
			//______________________________________________________
		: (This:C1470.posMonth=1)\
			 && (This:C1470.posYear=2)\
			 && (This:C1470.posDay=3)  // MM/YYYY/DD
			
			This:C1470.monthZoneName:=This:C1470.widgets[1]
			This:C1470.yearZoneName:=This:C1470.widgets[3]
			This:C1470.dayZoneName:=This:C1470.widgets[4]
			
			This:C1470.width[1]:=This:C1470.monthWidth
			This:C1470.width[3]:=This:C1470.yearWidth
			This:C1470.width[5]:=This:C1470.dayWidth
			
			//______________________________________________________
		: (This:C1470.posYear=1)\
			 && (This:C1470.posMonth=2)\
			 && (This:C1470.posDay=3)  // YYYY/MM/DD
			
			This:C1470.yearZoneName:=This:C1470.widgets[1]
			This:C1470.monthZoneName:=This:C1470.widgets[3]
			This:C1470.dayZoneName:=This:C1470.widgets[4]
			
			This:C1470.width[1]:=This:C1470.yearWidth
			This:C1470.width[3]:=This:C1470.monthWidth
			This:C1470.width[5]:=This:C1470.dayWidth
			
			//______________________________________________________
		Else   // Default
			
			This:C1470.dayZoneName:=This:C1470.widgets[1]
			This:C1470.monthZoneName:=This:C1470.widgets[3]
			This:C1470.yearZoneName:=This:C1470.widgets[4]
			
			This:C1470.width[1]:=This:C1470.dayWidth
			This:C1470.width[3]:=This:C1470.monthWidth
			This:C1470.width[5]:=This:C1470.yearWidth
			
			//______________________________________________________
	End case 
	
	// Resize objects (the order will NOT be changed !!!)
	var $left; $top; $right; $bottom; $start; $i : Integer
	OBJECT GET COORDINATES:C663(*; This:C1470.widgets[1]; $left; $top; $right; $bottom)
	$start:=$left
	
	For ($i; 1; 5; 1)
		
		OBJECT MOVE:C664(*; This:C1470.widgets[$i]; $start; $top; $start+This:C1470.width[$i]; $bottom; *)
		$start+=This:C1470.width[$i]
		
	End for 
	
	OBJECT SET FORMAT:C236(*; This:C1470.dayZoneName; "00")
	OBJECT SET FORMAT:C236(*; This:C1470.monthZoneName; "00")
	OBJECT SET FORMAT:C236(*; This:C1470.yearZoneName; "0000")
	
	OBJECT SET TITLE:C194(*; This:C1470.widgets[2]; <>Date_separator)
	OBJECT SET TITLE:C194(*; This:C1470.widgets[4]; <>Date_separator)
	
	OBJECT SET VALUE:C1742(This:C1470.dayZoneName; String:C10(Day of:C23(This:C1470.date); "00"))
	OBJECT SET VALUE:C1742(This:C1470.monthZoneName; String:C10(Day of:C23(This:C1470.date); "00"))
	OBJECT SET VALUE:C1742(This:C1470.yearZoneName; String:C10(Day of:C23(This:C1470.date); "0000"))
	
	
	OBJECT SET FOCUS RECTANGLE INVISIBLE:C1177(*; "@"; True:C214)
	
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function ManageFocus($e : Object)
	
	$e:=$e || FORM Event:C1606
	var $visible : Boolean
	
	If ($e.code=On Activate:K2:9)
		
		$visible:=True:C214
		
		var $t:=This:C1470.clickedInWidget([This:C1470.widgets[1]; This:C1470.widgets[3]; This:C1470.widgets[5]])
		
		If (Length:C16($t)>0)
			
			GOTO OBJECT:C206(*; $t)
			HIGHLIGHT TEXT:C210(*; $t; 1; MAXLONG:K35:2)
			
		Else 
			
			GOTO OBJECT:C206(*; This:C1470.widgets[1])
			
		End if 
	End if 
	
	OBJECT SET VISIBLE:C603(*; "FocusRing@"; $visible)
	OBJECT SET VISIBLE:C603(*; "up"; $visible)
	OBJECT SET VISIBLE:C603(*; "down"; $visible)
	OBJECT SET VISIBLE:C603(*; "stepper"; $visible)