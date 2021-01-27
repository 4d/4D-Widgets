//%attributes = {"invisible":true}
C_TEXT:C284($1)

C_TEXT:C284($SearchObjectName)
C_TEXT:C284($Format)

C_POINTER:C301($Target;$PtrSearchText)

Case of 
	: ($1="Win")
		$SearchObjectName:="SearchText_Win"
		
		$Format:=";file:Images/Win/SearchBox/searchbox_Glass.png"
		OBJECT SET FORMAT:C236(*;"CloseButton_Win";$Format)
		
	: ($1="Mac")
		$SearchObjectName:="SearchText_Mac"
		
End case 

$PtrSearchText:=OBJECT Get pointer:C1124(Object named:K67:5;$SearchObjectName)

If (Not:C34(Is nil pointer:C315($PtrSearchText)))
	$PtrSearchText->:=""
	$Target:=SearchPicker__GetTarget 
	If (Not:C34(Is nil pointer:C315($Target)))
		$Target->:=""
	End if 
End if 

SearchPicker__SetInterface 
