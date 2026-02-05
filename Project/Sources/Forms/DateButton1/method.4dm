/*
Case of 

//________________________________________________________________________________
: (Form event code=On Load)

CALL SUBFORM CONTAINER(On Load*(-1))  // Usefull when the widget is not in page 1 of the main form

DatePicker__InitInter
DatePicker__InitForm

// Common code On Load / On bound variable change
var $selectedDate : Date:=DatePicker__GetTarget
$selectedDate:=DatePicker__SetSelectedDate($selectedDate; "")

DatePicker__CalculateFirstDay($selectedDate; "")

//________________________________________________________________________________
: (Form event code=On Bound Variable Change)

// Common code On Load / On bound variable change
$selectedDate:=DatePicker__GetTarget
$selectedDate:=DatePicker__SetSelectedDate($selectedDate; "")

DatePicker__CalculateFirstDay($selectedDate; "")

//________________________________________________________________________________
End case 
*/

var $e:=FORM Event:C1606

Case of 
		//______________________________________________________
	: ($e.code=On Load:K2:1)
		
		Form:C1466.init()
		
		//______________________________________________________
	: ($e.code=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-1)
		
		
		//______________________________________________________
	: ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		Form:C1466.update()
		
		//______________________________________________________
	Else 
		
		// A "Case of" statement should never omit "Else"
		
		//______________________________________________________
End case 