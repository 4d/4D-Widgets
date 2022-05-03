//%attributes = {"invisible":true}
#DECLARE($date : Date)

var $containerValue : Variant
$containerValue:=OBJECT Get subform container value:C1785

If (Value type:C1509($containerValue)=Is date:K8:7)
	OBJECT SET SUBFORM CONTAINER VALUE:C1784($date)
End if 
























//var $ptr : Pointer
//var $type : Integer
//var $ok : Boolean

//$ptr:=OBJECT Get pointer(Object subform container)  //parent associated variable witch is a date OR and object

//$ok:=False
//If (Form#Null)  // either varObject.value or Form.object.value associated to the subform container
//If (Not(Undefined(Form.value)))
//If (Value type(Form.value)=Is date)
//Form.value:=$date
//$ok:=True
//CALL SUBFORM CONTAINER(On Data Change)
//End if 
//End if 
//End if 

//If (Not($ok))
//If (Not(Is nil pointer($ptr)))
//If (Type($ptr->)=Is date)
//$ptr->:=$date
//End if 
//End if 
//End if 
