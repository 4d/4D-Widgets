//%attributes = {"invisible":true}
#DECLARE() : Text

var $containerValue:=OBJECT Get subform container value:C1785

If (Value type:C1509($containerValue)=Is text:K8:3)
	
	return $containerValue
	
End if 