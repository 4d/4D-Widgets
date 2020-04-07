//%attributes = {"invisible":true}
C_POINTER:C301($0)

C_POINTER:C301($Target)
C_POINTER:C301($Ptr)
C_LONGINT:C283($Type)

$Ptr:=Self:C308(Object subform container:K67:4)
If (Not:C34(Is nil pointer:C315($Ptr)))
	
	$Type:=Type:C295($Ptr->)
	If ($Type=Is string var:K8:2) | ($Type=Is text:K8:3)
		$Target:=$Ptr
	End if 
	
End if 

If (Is nil pointer:C315($Target))
	$Target:=<>SearchPicker_Target
End if 

$0:=$Target



