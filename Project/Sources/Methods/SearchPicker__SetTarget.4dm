//%attributes = {"invisible":true}
#DECLARE($search : Text)

var $containerValue : Variant
$containerValue:=OBJECT Get subform container value:C1785

If (Value type:C1509($containerValue)=Is text:K8:3)
	OBJECT SET SUBFORM CONTAINER VALUE:C1784($search)
End if 

