//%attributes = {"invisible":true}

C_POINTER:C301($1)  //Source ptr
C_TEXT:C284($2)  //form object name
C_TEXT:C284($3)  //form (if provided)

C_POINTER:C301($PtrSource;$PtrTarget)
C_TEXT:C284($ObjectName;$ParentName)

$PtrSource:=$1
$ObjectName:=$2

If (Count parameters:C259>=3)
	$ParentName:=$3
	$PtrTarget:=OBJECT Get pointer:C1124(Object named:K67:5;$ObjectName;$ParentName)
Else 
	$PtrTarget:=OBJECT Get pointer:C1124(Object named:K67:5;$ObjectName)
End if 

If (Not:C34(Is nil pointer:C315($PtrTarget)))
	$PtrTarget->:=$PtrSource->
End if 


