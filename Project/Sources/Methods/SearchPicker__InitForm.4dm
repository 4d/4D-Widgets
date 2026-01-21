//%attributes = {"invisible":true}
var $PtrDefaultInited : Pointer

$PtrDefaultInited:=Self:C308(Object named:K67:5; "FormInited")
If (Not:C34(Is nil pointer:C315($PtrDefaultInited)))
	
	If ($PtrDefaultInited->=0)
		
		$PtrDefaultInited->:=1
		
		
	End if   //already inited
	
End if   //not nil
