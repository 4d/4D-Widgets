//%attributes = {"invisible":true}
#DECLARE($ObjectName : Text; $PtrTarget : Pointer; $ParentName : Text)

If (Length:C16($ParentName)#0)
	
	var $PtrSource:=OBJECT Get pointer:C1124(Object named:K67:5; $ObjectName; $ParentName)  // Specific form
	
Else 
	
	$PtrSource:=OBJECT Get pointer:C1124(Object named:K67:5; $ObjectName)  // Current form
	
End if 

If (Not:C34(Is nil pointer:C315($PtrSource)))
	
	$PtrTarget->:=$PtrSource->
	
End if 