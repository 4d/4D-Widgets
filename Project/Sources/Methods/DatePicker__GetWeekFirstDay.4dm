//%attributes = {"invisible":true}
var $1 : Pointer
var $PtrTarget : Pointer

var $2 : Text
var $Form : Text

var $FirstDayOfWeek : Real

If (Count parameters:C259>=2)
	$Form:=$2
Else 
	$Form:=""
End if 

$PtrTarget:=$1

Tool_ObjectToVar("FirstDayOfWeek"; ->$FirstDayOfWeek; $Form)
If ($FirstDayOfWeek=0)
	$FirstDayOfWeek:=<>DatePicker_FirstDayOfWeek
End if 

$PtrTarget->:=$FirstDayOfWeek
