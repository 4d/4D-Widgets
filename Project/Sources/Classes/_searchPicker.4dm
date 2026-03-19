Class extends _widget

property toSearch:=""
property page : Integer

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor()
	
	Super:C1705()
	
	This:C1470.defaultValues()
	This:C1470.page:=1+Num:C11(Is Windows:C1573)  // +1
	
	If (Structure file:C489=Structure file:C489(*))\
		 && (Is macOS:C1572 && Shift down:C543)/* 🚧 FOR TESTING PURPOSES */
		
		This:C1470.page+=1  // Test Windows UI
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Super:C1706.init()
	
	var $container:=This:C1470.getContainerValue()
	
	If ($container.type=Is text:K8:3)\
		 | ($container.type=Is string var:K8:2)
		
		Form:C1466.toSearch:=String:C10($container.value)
		
	End if 
	
	This:C1470.manageRing()
	This:C1470.update()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function defaultValues($force : Boolean)
	
	If (Not:C34(This:C1470.inited) || $force)
		
		This:C1470.inited:=True:C214
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function handleEvents($e : Object)
	
	$e:=$e || FORM Event:C1606
	
	// MARK: Form Method
	If ($e.objectName=Null:C1517)
		
		Case of 
				
				// ________________________________________________________________________________
			: ($e.code=On Load:K2:1)
				
				FORM GOTO PAGE:C247(This:C1470.page; *)
				
				This:C1470.init()
				
				// ________________________________________________________________________________
			: ($e.code=On Bound Variable Change:K2:52)
				
				var $container:=This:C1470.getContainerValue()
				
				If ($container.type=Is text:K8:3)\
					 | ($container.type=Is string var:K8:2)
					
					Form:C1466.toSearch:=String:C10($container.value)
					This:C1470.update()
					
				End if 
				
				// ________________________________________________________________________________
			: ($e.code=On Activate:K2:9)
				
				This:C1470.manageFocus()
				
				// ________________________________________________________________________________
		End case 
		
		return 
		
	End if 
	
	// MARK: Widget Methods
	Case of 
			
			// ______________________________________________________
		: ($e.code=On Activate:K2:9)\
			 || ($e.code=On Deactivate:K2:10)
			
			This:C1470.manageFocus()
			
			// ______________________________________________________
		: ($e.objectName="search@")
			
			Case of 
					
					// ________________________________________________________________________________
				: ($e.code=On After Edit:K2:43)
					
					This:C1470.setContainerValue(Get edited text:C655; [Is text:K8:3; Is string var:K8:2])
					This:C1470.update()
					
					// ________________________________________________________________________________
				: ($e.code=On Getting Focus:K2:7)
					
					This:C1470.manageRing()
					
					// ________________________________________________________________________________
				: ($e.code=On Losing Focus:K2:8)
					
					OBJECT SET RGB COLORS:C628(*; "BgndRing@"; FORM Get color scheme:C1761="dark" ? "grey" : "silver"; Background color:K23:2)
					
					// ________________________________________________________________________________
			End case 
			
			// ______________________________________________________
		: ($e.objectName="close@")
			
			Form:C1466.toSearch:=""
			This:C1470.setContainerValue(""; [Is text:K8:3; Is string var:K8:2])
			This:C1470.update()
			
			// ______________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function update()
	
	var $container:=This:C1470.getContainerValue()
	
	If ($container.type=Is text:K8:3)\
		 | ($container.type=Is string var:K8:2)
		
		This:C1470.setContainerValue(String:C10($container.value); [Is text:K8:3; Is string var:K8:2])
		
	End if 
	
	If (This:C1470.page=1)
		
		OBJECT SET VISIBLE:C603(*; "CloseButton_Mac"; Length:C16($container.value)>0)
		
	Else 
		
		If (Length:C16($container.value)>0)
			
			OBJECT SET FORMAT:C236(*; "CloseButton_Win"; ";file:Images/SearchBox/win_close.svg")
			
		Else 
			
			OBJECT SET FORMAT:C236(*; "CloseButton_Win"; ";file:Images/SearchBox/win_glass.svg")
			
		End if 
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function manageFocus()
	
	If (This:C1470.enterable)
		
		If (This:C1470.page=1)
			
			GOTO OBJECT:C206(*; "SearchText_Mac")
			
		Else 
			
			GOTO OBJECT:C206(*; "SearchText_Win")
			
		End if 
		
	Else 
		
		If (OBJECT Get name:C1087(Object with focus:K67:3)="SearchText_@")
			
			POST KEY:C465(Tab key:K12:28)
			
		End if 
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function manageRing()
	
	If (This:C1470.enterable)\
		 && (OBJECT Get name:C1087(Object with focus:K67:3)="SearchText_@")
		
		OBJECT SET RGB COLORS:C628(*; "BgndRing@"; FORM Get color scheme:C1761="dark" ? "silver" : "grey"; Background color:K23:2)
		
	Else 
		
		OBJECT SET RGB COLORS:C628(*; "BgndRing@"; FORM Get color scheme:C1761="dark" ? "grey" : "silver"; Background color:K23:2)
		
	End if 
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function set placeholder($value : Text)
	
	OBJECT SET PLACEHOLDER:C1295(*; This:C1470.page=1 ? "SearchText_Mac" : "SearchText_Win"; $value)
	
	// ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==> ==>
Function get enterable() : Boolean
	
	return OBJECT Get enterable:C1067(*; This:C1470.page=1 ? "SearchText_Mac" : "SearchText_Win")
	
	// <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <== <==
Function set enterable($value : Boolean)
	
	If (This:C1470.page=1)
		
		OBJECT SET ENTERABLE:C238(*; "SearchText_Mac"; $value)
		
	Else 
		
		OBJECT SET ENTERABLE:C238(*; "SearchText_Win"; $value)
		
	End if 
	
	This:C1470.manageFocus()
	This:C1470.manageRing()
	This:C1470.update()