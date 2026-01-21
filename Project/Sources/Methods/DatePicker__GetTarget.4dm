//%attributes = {"invisible":true}
#DECLARE() : Date

var $containerValue : Variant:=OBJECT Get subform container value:C1785

If (Value type:C1509($containerValue)=Is date:K8:7)
	
	return $containerValue
	
End if 