Class extends _widget

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor()
	
	Super:C1705()
	
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Super:C1706.init()
	
	var $searchText:=String:C10(This:C1470.getContainerValue().value)
	SearchPicker__SET_TEXT($searchText; "")
	
	
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function defaultValues($force : Boolean)
	
	If (Not:C34(This:C1470.inited) || $force)
		
		var <>SearchPicker_SearchText:=""
		
		
		
		
		var <>SearchPicker_PopupFunction : Text
		
		var <>SearchPicker_Menu : Text
		
		<>SearchPicker_PopupFunction:="Scope"  //(or "Values")
		
		RELEASE MENU:C978(<>SearchPicker_Menu)
		<>SearchPicker_Menu:=""
		
		var <>SearchPicker_DummyText : Text
		var <>SearchPicker_Target : Pointer
		<>SearchPicker_Target:=-><>SearchPicker_DummyText
		
		This:C1470.inited:=True:C214
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function close()
	
	//SearchPicker__SetTarget("")
	This:C1470.setContainerValue("")
	
	SearchPicker__SetInterface