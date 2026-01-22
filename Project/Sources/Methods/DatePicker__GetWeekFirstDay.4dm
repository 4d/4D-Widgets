//%attributes = {"invisible":true}
var $1 : Pointer
var $PtrTarget : Pointer

var $2 : Text
var $form : Text

var $FirstDayOfWeek : Real

If (Count parameters:C259>=2)
	$form:=$2
Else 
	$form:=""
End if 

$PtrTarget:=$1

Tool_ObjectToVar("FirstDayOfWeek"; ->$FirstDayOfWeek; $form)
If ($FirstDayOfWeek=0)
	$FirstDayOfWeek:=<>DatePicker_FirstDayOfWeek
End if 

$PtrTarget->:=$FirstDayOfWeek
