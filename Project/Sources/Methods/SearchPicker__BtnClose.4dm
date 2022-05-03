//%attributes = {"invisible":true}
C_TEXT:C284($1)

C_TEXT:C284($searchObjectName)
C_TEXT:C284($Format)

C_POINTER:C301($target; $PtrSearchText)

Case of 
	: ($1="Win")
		$searchObjectName:="SearchText_Win"
		
		//$Format:=";file:Images/Win/SearchBox/searchbox_Glass.png"
		//OBJECT SET FORMAT(*; "CloseButton_Win"; $Format)
		
	: ($1="Mac")
		$searchObjectName:="SearchText_Mac"
		
End case 

$PtrSearchText:=OBJECT Get pointer:C1124(Object named:K67:5; $searchObjectName)
If (Not:C34(Is nil pointer:C315($PtrSearchText)))  // should NEVER happend (internal bug otherwise)
	$PtrSearchText->:=""
End if 

SearchPicker__SetTarget("")

SearchPicker__SetInterface
