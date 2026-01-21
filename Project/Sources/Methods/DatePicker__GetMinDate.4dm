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

Tool_ObjectToVar("MinDate"; ->$date; $Form)
If ($date=!00-00-00!)
	$date:=<>DatePicker_DateMin
End if 

$PtrTarget->:=$date


