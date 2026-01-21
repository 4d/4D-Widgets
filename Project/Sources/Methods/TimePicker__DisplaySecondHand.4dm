//%attributes = {"invisible":true}

var $1 : Boolean
var $displaySecondHand : Boolean

$displaySecondHand:=$1

var $ptr : Pointer
var $PtrRebuild : Pointer

$PtrRebuild:=OBJECT Get pointer:C1124(Object named:K67:5; "clockRebuild")
$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "clockDisplaySecondHand")

If ($displaySecondHand)
	$Ptr->:="true"
Else 
	$Ptr->:="false"
End if 

$PtrRebuild->:="true"
SET TIMER:C645(-1)  // will redraw the image according to the associated variable
