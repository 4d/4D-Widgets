//%attributes = {"invisible":true}

#DECLARE()->$search : Text

var $containerValue : Variant
$containerValue:=OBJECT Get subform container value:C1785

If (Value type:C1509($containerValue)=Is text:K8:3)
	$search:=$containerValue
End if 





















//C_POINTER($0)

//C_POINTER($target)
//C_POINTER($Ptr)
//C_LONGINT($type)

//$Ptr:=Self(Object subform container)
//If (Not(Is nil pointer($Ptr)))

//$type:=Type($Ptr->)
//If ($type=Is string var) | ($type=Is text)
//$target:=$Ptr
//End if 

//End if 

//If (Is nil pointer($target))
//$target:=<>SearchPicker_Target
//End if 

//$0:=$target



