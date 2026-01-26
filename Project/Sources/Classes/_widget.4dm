property widget : Text

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor($force : Boolean)
	
	var <>TimePicker_Inited : Boolean
	
	If (Not:C34(<>TimePicker_Inited) || $force)
		
		var <>TimePicker_CloseDial : Boolean
		
		// Default value
		var <>TimePicker_LabelAM : Text
		GET SYSTEM FORMAT:C994(System time AM label:K60:15; <>TimePicker_LabelAM)
		var <>TimePicker_LabelPM : Text
		GET SYSTEM FORMAT:C994(System time PM label:K60:16; <>TimePicker_LabelPM)
		var <>Time_separator : Text
		GET SYSTEM FORMAT:C994(Time separator:K60:11; <>Time_separator)
		
		var <>TimePicker_TimeMin:=?08:00:00?
		var <>TimePicker_TimeMax:=?20:00:00?
		var <>TimePicker_Step:=?00:15:00?
		var <>TimePicker_SelectedTime:=?00:00:00?
		
		<>TimePicker_Inited:=True:C214
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function resize()
	
	// Resize to fit the container
	var $width; $height : Integer
	OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
	OBJECT MOVE:C664(*; This:C1470.widget; 1; 1; $width-1; $height-1; *)
	
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
		: (Value type:C1509($type)=Is real:K8:4)\
			 || (Value type:C1509($type)=Is time:K8:8)
			
			If (Value type:C1509($variant)=Is real:K8:4)\
				 || (Value type:C1509($variant)=Is time:K8:8)
				
				OBJECT SET SUBFORM CONTAINER VALUE:C1784($value)
				
			End if 
			
			//______________________________________________________
		Else 
			
			// A "Case of" statement should never omit "Else"
			
			//______________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function withWidget($name : Text) : Boolean
	
	ARRAY TEXT:C222($_widgets; 0)
	FORM GET OBJECTS:C898($_widgets)
	
	return Find in array:C230($_widgets; $name)>0
	