//%attributes = {"invisible":true}
var $1 : Boolean
var $displaySeconds : Boolean

$displaySeconds:=$1

var $ptr : Pointer
var $PtrRebuild : Pointer


$PtrRebuild:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdRebuild")
$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplaySeconds")

If ($displaySeconds)
	$ptr->:="true"
Else 
	$ptr->:="false"
End if 

$PtrRebuild->:="true"
SET TIMER:C645(-1)  // will redraw the image according to the associated variable

