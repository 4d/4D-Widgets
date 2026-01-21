//%attributes = {"invisible":true}
#DECLARE($mode : Integer)

var $PtrMode:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayMode")

$PtrMode->:=$mode
SET TIMER:C645(-1)