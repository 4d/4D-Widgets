//%attributes = {"invisible":true}
#DECLARE($step : Integer)

var $target:=OBJECT Get name:C1087(Object with focus:K67:3)

var $CurrentTime:=?00:00:00?
TimePicker__GetSelectedTime(->$CurrentTime; "")

Case of 
		
		// ________________________________________________________________________________
	: ($target="am_pm")
		
		$step:=12*3600*$step
		
		// ________________________________________________________________________________
	: ($target="hours")
		
		$step:=3600*$step
		
		// ________________________________________________________________________________
	: ($target="minutes")
		
		$step:=60*$step
		
		// ________________________________________________________________________________
	: ($target="seconds")
		
		$step:=$step
		
		// ________________________________________________________________________________
End case 

$CurrentTime+=$step

// Save the calculated value in the local variable of the form.
$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime; "")

// Check min/max and recalculation if needed
TimePicker__DisplayTimeInputs(False:C215)