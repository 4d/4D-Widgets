//%attributes = {"invisible":true}
#DECLARE() : Time

var $containerValue:=OBJECT Get subform container value:C1785

If (Value type:C1509($containerValue)=Is real:K8:4)\
 | (Value type:C1509($containerValue)=Is time:K8:8)
	
	return $containerValue
	
End if 