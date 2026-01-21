//%attributes = {"invisible":true}
var $1 : Text
var $rgb : Text

var $PtrColor : Pointer

$rgb:=$1
$PtrColor:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayColor")
If (Not:C34(Is nil pointer:C315($PtrColor)))
	$PtrColor->:=$rgb
	SET TIMER:C645(-1)
End if 


