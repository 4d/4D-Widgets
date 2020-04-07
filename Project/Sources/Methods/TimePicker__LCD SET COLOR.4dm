//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_TEXT:C284($rgb)

C_POINTER:C301($PtrColor)

$rgb:=$1
$PtrColor:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplayColor")
If (Not:C34(Is nil pointer:C315($PtrColor)))
	$PtrColor->:=$rgb
	SET TIMER:C645(-1)
End if 


