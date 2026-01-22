//%attributes = {"invisible":true}
#DECLARE($recalc : Boolean)  // True = recalc time from HH MM SS AM input zones

$recalc:=Count parameters:C259>0 ? $recalc : True:C214  // True by default

//----------------- GET POINTERS ON FORM OBJECTS --------------------------------------
var $PtrHours:=OBJECT Get pointer:C1124(Object named:K67:5; "hours")
var $PtrMinutes:=OBJECT Get pointer:C1124(Object named:K67:5; "minutes")
var $PtrSeconds:=OBJECT Get pointer:C1124(Object named:K67:5; "seconds")
var $PtrAmPm:=OBJECT Get pointer:C1124(Object named:K67:5; "am_pm")

If (Is nil pointer:C315($PtrHours) || Is nil pointer:C315($PtrMinutes) || Is nil pointer:C315($PtrSeconds))
	
	// Generic call, do nothing
	return 
	
End if 

var $AMlabel:=""
var $PMlabel:=""
var $mode : Integer:=0

If (Not:C34(Is nil pointer:C315($PtrAmPm)))
	
	$PtrAmPm->:=""
	TimePicker__GetLabelAM(->$AMlabel; "")
	TimePicker__GetLabelPM(->$PMlabel; "")
	
	If ($AMlabel#"")\
		 || ($PMlabel#"")  // One or the other must contain something to draw in 12 hours mode
		
		$mode:=1
		
	End if 
End if 

var $minTime; $maxTime : Time
TimePicker__GetTimeMin(->$minTime; "")
TimePicker__GetTimeMax(->$maxTime; "")

//----------------- RECALCULATION (OR NOT) OF THE ENTERED DATE --------------------------------------
var $time:=?00:00:00?
If ($recalc)
	
	$time:=(3600*Num:C11($PtrHours->))+(60*Num:C11($PtrMinutes->))+Num:C11($PtrSeconds->)
	
	If ($mode=1)  // 12:00:00 PM
		
		If ($PtrAmPm->=$PMlabel)\
			 & ($time<?13:00:00?)\
			 & (($time+(12*3600))<=($maxTime+0))  // If label = PM
			
			
			$time:=$time+(12*3600)  // ADD 12 hours to time (11 = 23)
			
		End if 
	End if 
	
Else 
	
	TimePicker__GetSelectedTime(->$time)
	
End if 

//-------------------- CHECK CONSTRAINTS ------------------------
$time:=($time+?24:00:00?)%(24*3600)

Case of 
	: ($time<$minTime)
		$time:=$minTime
	: ($time>$maxTime) & ($maxTime#?00:00:00?)
		$time:=$maxTime
End case 

// ---------------------- SETUP INPUT ZONES ----------------------------
var $H : Integer:=Int:C8($time/3600)
var $m : Integer:=Int:C8(($time-($H*3600))/60)
var $s : Integer:=Int:C8($time-(3600*$H)-(60*$m))

If ($mode=0)  // 24 hours mode
	
	$PtrHours->:=String:C10($H; "00")
	
Else   // 12 hours am/pm mode
	
	Case of 
			
			//________________________________________________________________________________
		: ($H=0)
			
			$PtrAmPm->:=$AMlabel
			$PtrHours->:="12"
			
			//________________________________________________________________________________
		: ($H<=11)
			
			$PtrAmPm->:=$AMlabel
			$PtrHours->:=String:C10($H; "00")
			
			//________________________________________________________________________________
		: ($H=12)
			
			$PtrAmPm->:=$PMlabel
			$PtrHours->:="12"
			
			//________________________________________________________________________________
		: ($H>12)
			
			$PtrAmPm->:=$PMlabel
			$PtrHours->:=String:C10($H-12; "00")
			
			//________________________________________________________________________________
	End case 
End if 

$PtrMinutes->:=String:C10($m; "00")
$PtrSeconds->:=String:C10($s; "00")


$time:=TimePicker__SetSelectedTime($time; "")
