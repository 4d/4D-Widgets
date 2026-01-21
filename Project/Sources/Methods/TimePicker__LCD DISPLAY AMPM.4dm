//%attributes = {"invisible":true}
#DECLARE($displayAmPm : Boolean)

var $PtrRebuild:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdRebuild")
var $Ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayAmPm")

$Ptr->:=$displayAmPm ? "true" : "false"
$PtrRebuild->:="true"
SET TIMER:C645(-1)  // Will redraw the image according to the associated variable