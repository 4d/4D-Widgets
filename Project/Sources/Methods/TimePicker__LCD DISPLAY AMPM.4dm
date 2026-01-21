//%attributes = {"invisible":true}
var $1 : Boolean
var $displayAmPm : Boolean

$displayAmPm:=$1

var $ptr : Pointer
var $PtrRebuild : Pointer

$PtrRebuild:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdRebuild")
$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayAmPm")

If ($displayAmPm)
	$Ptr->:="true"
Else 
	$Ptr->:="false"
End if 

$PtrRebuild->:="true"
SET TIMER:C645(-1)  // will redraw the image according to the associated variable

