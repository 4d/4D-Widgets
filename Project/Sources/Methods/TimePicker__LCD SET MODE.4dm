//%attributes = {"invisible":true}
var $1 : Integer
var $mode : Integer

var $PtrMode : Pointer

$mode:=$1
$PtrMode:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayMode")

$PtrMode->:=$mode
SET TIMER:C645(-1)



