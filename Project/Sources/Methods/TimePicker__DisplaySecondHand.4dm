//%attributes = {"invisible":true}
#DECLARE($displaySecondHand : Boolean)

var $ptr : Pointer:=OBJECT Get pointer:C1124(Object named:K67:5; "clockDisplaySecondHand")
$Ptr->:=$displaySecondHand ? "true" : "false"

var $PtrRebuild : Pointer:=OBJECT Get pointer:C1124(Object named:K67:5; "clockRebuild")
$PtrRebuild->:="true"

SET TIMER:C645(-1)  // Will redraw the image according to the associated variable