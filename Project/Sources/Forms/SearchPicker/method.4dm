Case of 
		
		//________________________________________________________________________________
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  // Usefull when the widget is not in page 1 of the main form
		
		If (Is Windows:C1573)
			
			OBJECT SET VISIBLE:C603(*; "@_Win"; True:C214)
			OBJECT SET VISIBLE:C603(*; "@_Mac"; False:C215)
			
		Else 
			
			OBJECT SET VISIBLE:C603(*; "@_Mac"; True:C214)
			OBJECT SET VISIBLE:C603(*; "@_Win"; False:C215)
			
		End if 
		
		// Common part (on load + on bound variable change)
		var $Ptr:=OBJECT Get pointer:C1124(Object subform container:K67:4)  // Parent associated variable which is A TEXT
		
		If (Not:C34(Is nil pointer:C315($Ptr)))
			
			var $type:=Type:C295($Ptr->)
			
			If ($type=Is string var:K8:2)\
				 | ($type=Is text:K8:3)
				
				var $searchText : Text:=$Ptr->
				SearchPicker__SET_TEXT($searchText; "")
				
			End if 
		End if 
		
		SearchPicker__SetInterface
		
		//________________________________________________________________________________
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		$searchText:=SearchPicker__GetTarget
		
		SearchPicker__SET_TEXT($searchText; "")
		
		SearchPicker__SetInterface
		
		//________________________________________________________________________________
	: (Form event code:C388=On Unload:K2:2)
		
		// $PtrSearchMenu:=Object get pointer(Object named ;"SearchMenu")
		// RELEASE MENU($PtrSearchMenu->)
		
		//________________________________________________________________________________
End case 