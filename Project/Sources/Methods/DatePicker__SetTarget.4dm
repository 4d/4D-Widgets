//%attributes = {"invisible":true}
#DECLARE($date : Date)

var $containerValue:=OBJECT Get subform container value:C1785

If (Value type:C1509($containerValue)=Is date:K8:7)
	
	OBJECT SET SUBFORM CONTAINER VALUE:C1784($date)
	
End if 