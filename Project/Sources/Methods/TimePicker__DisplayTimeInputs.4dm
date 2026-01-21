//%attributes = {"invisible":true}
var $1 : Boolean  //true = recalc time from HH MM SS AM  input zones (true by default)

var $recalc : Boolean

var $time : Time
var $minTime; $maxTime : Time

var $mode : Integer
var $h; $m; $s : Integer

var $PtrAmPm; $PtrHours; $PtrMinuts; $PtrSeconds : Pointer
var $AMlabel; $PMlabel : Text

If (Count parameters:C259>0)
	$recalc:=$1
Else 
	$recalc:=True:C214
End if 

//----------------- GET POINTERS ON FORM OBJECTS --------------------------------------

$PtrHours:=Self:C308(Object named:K67:5; "HoursEntry")
$PtrMinuts:=Self:C308(Object named:K67:5; "MinutsEntry")
$PtrSeconds:=Self:C308(Object named:K67:5; "SecondsEntry")
$PtrAmPm:=Self:C308(Object named:K67:5; "AmPmEntry")

If (Not:C34(Is nil pointer:C315($PtrHours))) & (Not:C34(Is nil pointer:C315($PtrMinuts))) & (Not:C34(Is nil pointer:C315($PtrSeconds)))
	
	$AMlabel:=""
	$PMlabel:=""
	
	If (Not:C34(Is nil pointer:C315($PtrAmPm)))
		
		$PtrAmPm->:=""
		TimePicker__GetLabelAM(->$AMlabel; "")
		TimePicker__GetLabelPM(->$PMlabel; "")
		
		If ($AMlabel#"") | ($PMlabel#"")  //One or the other must contain something to draw in 12 hours mode
			$mode:=1
		Else 
			$mode:=0  //otherwhise draw in 24 hours mode
		End if 
	Else 
		$mode:=0
	End if 
	
	TimePicker__GetTimeMin(->$minTime; "")
	TimePicker__GetTimeMax(->$maxTime; "")
	
	//----------------- RECALCULATION (OR NOT) OF THE ENTERED DATE --------------------------------------
	
	$time:=?00:00:00?
	If ($recalc)
		
		$time:=(3600*Num:C11($PtrHours->))+(60*Num:C11($PtrMinuts->))+Num:C11($PtrSeconds->)
		If ($mode=1)  //12:00:00 PM
			If ($PtrAmPm->=$PMlabel) & ($time<?13:00:00?) & (($time+(12*3600))<=($maxTime+0))  //if label = PM
				$time:=$time+(12*3600)  //ADD 12 hours to time (11 = 23)
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
	
	$H:=Int:C8($time/3600)
	$m:=Int:C8(($time-($H*3600))/60)
	$s:=Int:C8($time-(3600*$H)-(60*$m))
	
	If ($mode=0)  // 24 hours mode
		
		$PtrHours->:=String:C10($H; "00")
		
	Else   // 12 hours am/pm mode
		
		Case of 
			: ($H=0)
				$PtrAmPm->:=$AMlabel
				$PtrHours->:="12"
			: ($H<=11)
				$PtrAmPm->:=$AMlabel
				$PtrHours->:=String:C10($H; "00")
			: ($H=12)
				$PtrAmPm->:=$PMlabel
				$PtrHours->:="12"
			: ($H>12)
				$PtrAmPm->:=$PMlabel
				$PtrHours->:=String:C10($H-12; "00")
		End case 
		
	End if 
	
	$PtrMinuts->:=String:C10($m; "00")
	$PtrSeconds->:=String:C10($s; "00")
	
	
	$time:=TimePicker__SetSelectedTime($time; "")
	
	
Else 
	// Generic call, do nothing
	
End if 
