//%attributes = {"invisible":true}
#DECLARE()->$time : Time

var $containerValue : Variant
$containerValue:=OBJECT Get subform container value:C1785

If (Value type:C1509($containerValue)=Is real:K8:4) | (Value type:C1509($containerValue)=Is time:K8:8)
	$time:=$containerValue
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
//$time:=Form.value
//$ok:=True
//End if 
//End if 
//End if 

//If (Not($ok))
//If (Not(Is nil pointer($ptr)))
//If (Type($ptr->)=Is time)
//$time:=$ptr->
//End if 
//End if 
//End if 

// OLD CODE

//C_LONGINT($type)
//$Ptr:=OBJECT Get pointer(Object subform container)  //parent associated variable witch is an array ptr
//If (Not(Is nil pointer($Ptr)))
//$type:=Type($Ptr->)
//If ($type=Is time)
//$time:=$Ptr->
//End if 
//Else 
//$time:=?00:00:00?
//End if 


