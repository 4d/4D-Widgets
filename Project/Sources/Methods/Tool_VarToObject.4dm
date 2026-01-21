//%attributes = {"invisible":true}
#DECLARE($PtrSource : Pointer; $ObjectName : Text; $ParentName : Text)

If (Length:C16($ParentName)>0)
	
	var $PtrTarget:=OBJECT Get pointer:C1124(Object named:K67:5; $ObjectName; $ParentName)
	
Else 
	
	$PtrTarget:=OBJECT Get pointer:C1124(Object named:K67:5; $ObjectName)
	
End if 

If (Not:C34(Is nil pointer:C315($PtrTarget)))
	
	$PtrTarget->:=$PtrSource->
	
End if 