//%attributes = {"invisible":true}
#DECLARE($rgb : Text)

var $PtrColor:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayColor")

If (Not:C34(Is nil pointer:C315($PtrColor)))
	
	$PtrColor->:=$rgb
	SET TIMER:C645(-1)
	
End if 