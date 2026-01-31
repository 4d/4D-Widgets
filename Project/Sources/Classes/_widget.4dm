property currentForm : Text
property type : Text

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor()
	
	//
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	This:C1470.currentForm:=Current form name:C1298
	
	This:C1470.callParent()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function callParent()
	
	CALL SUBFORM CONTAINER:C1086((-1)*On Load:K2:1)
	SET TIMER:C645(-1)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function getContainerValue() : Object
	
	var $variant:=OBJECT Get subform container value:C1785
	
	return {value: $variant; type: Value type:C1509($variant)}
	SET TIMER:C645(-1)
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function setContainerValue($value; $type)
	
	var $variant:=OBJECT Get subform container value:C1785
	
	Case of 
			//______________________________________________________
		: (Value type:C1509($type)=Is collection:K8:32)
			
			If ($type.indexOf(Value type:C1509($variant))#-1)
				
				OBJECT SET SUBFORM CONTAINER VALUE:C1784($value)
				
			End if 
			
			//______________________________________________________
		: (Value type:C1509($variant)=Num:C11($type))
			
			OBJECT SET SUBFORM CONTAINER VALUE:C1784($value)
			
			//______________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function withWidget($name : Text) : Boolean
	
	ARRAY TEXT:C222($_widgets; 0)
	FORM GET OBJECTS:C898($_widgets; Form all pages:K67:7)
	
	return Find in array:C230($_widgets; $name)>0
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function clickedInWidget($widgets : Collection) : Text
	
	var $x; $y; $b : Integer
	MOUSE POSITION:C468($x; $y; $b)
	CONVERT COORDINATES:C1365($x; $y; XY Current window:K27:6; XY Current form:K27:5)
	
	If ($x>0)\
		 && ($y>0)
		
		If ($widgets=Null:C1517)
			
			$widgets:=[]
			
			ARRAY TEXT:C222($_widgets; 0)
			FORM GET OBJECTS:C898($_widgets)
			ARRAY TO COLLECTION:C1563($widgets; $_widgets)
			
		End if 
		
		var $t : Text
		
		For each ($t; $widgets)
			
			var $left; $top; $right; $bottom : Integer
			OBJECT GET COORDINATES:C663(*; $t; $left; $top; $right; $bottom)
			
			If ($x>=$left)\
				 && ($x<=$right)\
				 && ($y>=$top)\
				 && ($y<=$bottom)
				
				return $t
				
			End if 
		End for each 
	End if 