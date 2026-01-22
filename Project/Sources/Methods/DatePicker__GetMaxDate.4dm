//%attributes = {"invisible":true}
var $1 : Pointer
var $PtrTarget : Pointer

var $2 : Text
var $form : Text

var $date : Date

$PtrTarget:=$1



If (Count parameters:C259>=2)
	$form:=$2
Else 
	$form:=""
End if 


Tool_ObjectToVar("MaxDate"; ->$date; $form)
If ($date=!00-00-00!)
	$date:=<>DatePicker_DateMax
End if 

$PtrTarget->:=$date


