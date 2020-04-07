//%attributes = {"invisible":true}
C_POINTER:C301($0)
C_POINTER:C301($Target;$ptr)
C_LONGINT:C283($type)

$Ptr:=Self:C308(Object subform container:K67:4)  //parent associated variable witch is an array ptr
If (Not:C34(Is nil pointer:C315($Ptr)))
	$type:=Type:C295($Ptr->)
	If ($Type=Is time:K8:8)
		$Target:=$Ptr
	End if 
End if 

If (Is nil pointer:C315($Target))
	$Target:=<>TimePicker_Target
End if 

$0:=$Target