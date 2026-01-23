//%attributes = {}
#DECLARE($name : Text; $form : Text) : Variant

var $value

If (Length:C16($form)#0)
	
	EXECUTE METHOD IN SUBFORM:C1085($form; Formula:C1597(OBJECT Get value:C1743($name)); $value)
	
Else 
	
	$value:=OBJECT Get value:C1743($name)
	
End if 

return $value