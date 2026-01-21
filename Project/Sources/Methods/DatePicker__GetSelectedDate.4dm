//%attributes = {"invisible":true}

var $1 : Pointer
var $PtrTarget : Pointer

var $2 : Text
var $Form : Text


var $date : Date

$PtrTarget:=$1

If (Count parameters:C259>=2)
	$Form:=$2
Else 
	$Form:=""
End if 

Tool_ObjectToVar("SelectedDate"; ->$date; $Form)

If ($date=!00-00-00!)
	$date:=<>DatePicker_DefaultDate
End if 

$PtrTarget->:=$date


