//%attributes = {"invisible":true}
C_DATE:C307(dummyDate)  //ACI0099964  (just for test in interpreted mode)

C_POINTER:C301($0)

C_POINTER:C301($target)
C_POINTER:C301($ptr)
C_LONGINT:C283($type)

$ptr:=Self:C308(Object subform container:K67:4)  //parent associated variable witch is a date
If (Not:C34(Is nil pointer:C315($ptr)))
	$type:=Type:C295($ptr->)
	If ($Type=Is date:K8:7)
		$target:=$ptr
	Else 
		$target:=->dummyDate  // ACI0097774 the returned pointer can't be NIL
	End if 
Else 
	$target:=->dummyDate  // ACI0097774 the returned pointer can't be NIL
End if 

$0:=$Target

