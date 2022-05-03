//%attributes = {"invisible":true}
C_LONGINT:C283($1)
C_LONGINT:C283($mode)

C_POINTER:C301($PtrMode)

$mode:=$1
$PtrMode:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayMode")

$PtrMode->:=$mode
SET TIMER:C645(-1)



