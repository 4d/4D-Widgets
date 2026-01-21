//%attributes = {"invisible":true}

var $1 : Integer
var $Increment : Integer
var $CurrentTime : Time
var $PtrCurrentObject; $PtrHours; $PtrMinuts; $PtrSeconds; $PtrAmPm : Pointer

$Increment:=$1

$PtrCurrentObject:=Self:C308(Object with focus:K67:3)

$PtrHours:=Self:C308(Object named:K67:5; "HoursEntry")
$PtrMinuts:=Self:C308(Object named:K67:5; "MinutsEntry")
$PtrSeconds:=Self:C308(Object named:K67:5; "SecondsEntry")
$PtrAmPm:=Self:C308(Object named:K67:5; "AmPmEntry")

$CurrentTime:=?00:00:00?
TimePicker__GetSelectedTime(->$CurrentTime; "")

Case of 
	: ($PtrCurrentObject=$PtrAmPm)
		$Increment:=12*3600*$Increment
		
	: ($PtrCurrentObject=$PtrHours)
		$Increment:=3600*$Increment
		
	: ($PtrCurrentObject=$PtrMinuts)
		$Increment:=60*$Increment
		
	: ($PtrCurrentObject=$PtrSeconds)
		$Increment:=$Increment
End case 

$CurrentTime:=$CurrentTime+$Increment


// Save the calculated value in the local variable of the form.
$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime; "")
//check min/max and recalculation if needed
TimePicker__DisplayTimeInputs(False:C215)

