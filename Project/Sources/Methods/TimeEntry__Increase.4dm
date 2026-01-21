//%attributes = {"invisible":true}
#DECLARE($Increment : Integer)

var $PtrCurrentObject:=OBJECT Get pointer:C1124(Object with focus:K67:3)

var $PtrHours:=OBJECT Get pointer:C1124(Object named:K67:5; "HoursEntry")
var $PtrMinuts:=OBJECT Get pointer:C1124(Object named:K67:5; "MinutsEntry")
var $PtrSeconds:=OBJECT Get pointer:C1124(Object named:K67:5; "SecondsEntry")
var $PtrAmPm:=OBJECT Get pointer:C1124(Object named:K67:5; "AmPmEntry")

var $CurrentTime:=?00:00:00?
TimePicker__GetSelectedTime(->$CurrentTime; "")

Case of 
		
		// ________________________________________________________________________________
	: ($PtrCurrentObject=$PtrAmPm)
		
		$Increment:=12*3600*$Increment
		
		// ________________________________________________________________________________
	: ($PtrCurrentObject=$PtrHours)
		
		$Increment:=3600*$Increment
		
		// ________________________________________________________________________________
	: ($PtrCurrentObject=$PtrMinuts)
		
		$Increment:=60*$Increment
		
		// ________________________________________________________________________________
	: ($PtrCurrentObject=$PtrSeconds)
		
		$Increment:=$Increment
		
		// ________________________________________________________________________________
End case 

$CurrentTime+=$Increment

// Save the calculated value in the local variable of the form.
$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime; "")

// Check min/max and recalculation if needed
TimePicker__DisplayTimeInputs(False:C215)