//%attributes = {"invisible":true}
#DECLARE($time : Time)

var $containerValue : Variant
$containerValue:=OBJECT Get subform container value:C1785

If (Value type:C1509($containerValue)=Is real:K8:4) | (Value type:C1509($containerValue)=Is time:K8:8)
	OBJECT SET SUBFORM CONTAINER VALUE:C1784($time)
End if 

















//Code with an associated object which could be used as Form.value (useless)

//var $ptr : Pointer
//var $type : Integer
//var $ok : Boolean

//$ptr:=OBJECT Get pointer(Object subform container)  //parent associated variable witch is a date OR and object

//$ok:=False
//If (Form#Null)  // either varObject.value or Form.object.value associated to the subform container
//If (Not(Undefined(Form.value)))
//If ((Value type(Form.value)=Is real) | (Value type(Form.value)=Is longint) | (Value type(Form.value)=Is time))
//Form.value:=$time
//$ok:=True
//CALL SUBFORM CONTAINER(On Data Change)  //*(-1))
//End if 
//End if 
//End if 

//If (Not($ok))
//If (Not(Is nil pointer($ptr)))
//If (Type($ptr->)=Is time)
//$ptr->:=$time
//End if 
//End if 
//End if 

