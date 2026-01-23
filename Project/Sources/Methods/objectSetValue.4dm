//%attributes = {}
#DECLARE($name : Text; $value; $form : Text)

If (Length:C16($form)#0)
	
	EXECUTE METHOD IN SUBFORM:C1085($form; Formula:C1597(OBJECT SET VALUE:C1742($name; $value)))
	
Else 
	
	OBJECT SET VALUE:C1742($name; $value)
	
End if 