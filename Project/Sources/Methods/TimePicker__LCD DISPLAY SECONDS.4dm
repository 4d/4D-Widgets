//%attributes = {"invisible":true}
#DECLARE($displaySeconds : Boolean)

var $PtrRebuild:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdRebuild")
var $ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplaySeconds")

$ptr->:=$displaySeconds ? "true" : "false"

$PtrRebuild->:="true"
SET TIMER:C645(-1)  // Will redraw the image according to the associated variable