//%attributes = {"invisible":true}
#DECLARE($time : Time)

var $containerValue : Variant:=OBJECT Get subform container value:C1785

If (Value type:C1509($containerValue)=Is real:K8:4)\
 | (Value type:C1509($containerValue)=Is time:K8:8)
	
	OBJECT SET SUBFORM CONTAINER VALUE:C1784($time)
	
End if 