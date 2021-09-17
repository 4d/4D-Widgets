C_POINTER:C301($Ptr)
C_LONGINT:C283($Type)
C_TEXT:C284($SearchText)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  //usefull when the widget is not in page 1 of the main form
		
		//SearchPicker__InitInter 
		
		If (Is Windows:C1573)
			OBJECT SET VISIBLE:C603(*; "@_Win"; True:C214)
			OBJECT SET VISIBLE:C603(*; "@_Mac"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "@_Mac"; True:C214)
			OBJECT SET VISIBLE:C603(*; "@_Win"; False:C215)
		End if 
		
		// common part (on load + on bound variable change)
		
		$Ptr:=Self:C308(Object subform container:K67:4)  //parent associated variable which is A TEXT
		If (Not:C34(Is nil pointer:C315($Ptr)))
			
			$Type:=Type:C295($Ptr->)
			
			If ($Type=Is string var:K8:2) | ($Type=Is text:K8:3)
				$SearchText:=$Ptr->
				SearchPicker__SET_TEXT($SearchText; "")
			End if 
			
		End if 
		
		SearchPicker__SetInterface
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		$Ptr:=Self:C308(Object subform container:K67:4)  //parent associated variable which is A TEXT
		If (Not:C34(Is nil pointer:C315($Ptr)))
			
			$Type:=Type:C295($Ptr->)
			
			If ($Type=Is string var:K8:2) | ($Type=Is text:K8:3)
				$SearchText:=$Ptr->
				SearchPicker__SET_TEXT($SearchText; "")
			End if 
			
		End if 
		
		SearchPicker__SetInterface
		
	: (Form event code:C388=On Unload:K2:2)
		
		//$PtrSearchMenu:=Object get pointer(Object named ;"SearchMenu")
		//RELEASE MENU($PtrSearchMenu->)
		
End case 