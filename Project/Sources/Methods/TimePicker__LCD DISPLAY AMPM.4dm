//%attributes = {"invisible":true}
C_BOOLEAN:C305($1)
C_BOOLEAN:C305($displayAmPm)

$displayAmPm:=$1

C_POINTER:C301($ptr)
C_POINTER:C301($PtrRebuild)

$PtrRebuild:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdRebuild")
$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplayAmPm")

If ($displayAmPm)
	$Ptr->:="true"
Else 
	$Ptr->:="false"
End if 

$PtrRebuild->:="true"
SET TIMER:C645(-1)  // will redraw the image according to the associated variable

