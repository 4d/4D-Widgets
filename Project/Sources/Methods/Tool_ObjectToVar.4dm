//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_POINTER:C301($2)
C_TEXT:C284($3)  //form (if provided)

C_TEXT:C284($ObjectName; $ParentName)
C_POINTER:C301($PtrSource; $PtrTarget)

$ObjectName:=$1
$PtrTarget:=$2
If (Count parameters:C259>=3)
	$ParentName:=$3
	If ($ParentName#"")
		$PtrSource:=OBJECT Get pointer:C1124(Object named:K67:5; $ObjectName; $ParentName)  //specific form
	Else 
		$PtrSource:=OBJECT Get pointer:C1124(Object named:K67:5; $ObjectName)  //current form
	End if 
Else 
	$PtrSource:=OBJECT Get pointer:C1124(Object named:K67:5; $ObjectName)  //current form
End if 

If (Not:C34(Is nil pointer:C315($PtrSource)))
	$PtrTarget->:=$PtrSource->
End if 
