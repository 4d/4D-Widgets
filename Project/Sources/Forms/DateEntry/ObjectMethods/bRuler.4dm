

C_POINTER:C301($ptr)
C_LONGINT:C283($Value)

$Ptr:=Self:C308(Object current:K67:2)

If (Not:C34(Is nil pointer:C315($Ptr)))
	$Value:=$Ptr->
	If ($Value#0)
		DateEntry__Increase ($Value)
	Else 
		  //ALERT("zero value !")
	End if 
Else 
	  //ALERT("No current object !")
End if 

$Ptr->:=0
