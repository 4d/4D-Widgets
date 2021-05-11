//%attributes = {"invisible":true}

C_LONGINT:C283($x1; $y1; $x2; $y2)
C_LONGINT:C283($MemoX1; $MemoX2; $MemoY1; $MemoY2)
C_LONGINT:C283($Width)

C_TEXT:C284($SearchObjectName; $SearchClose; $Format)

C_POINTER:C301($PtrSearchText)

If (Is Windows:C1573)
	$SearchObjectName:="SearchText_Win"
	$SearchClose:="CloseButton_Win"
Else   //macintosh
	$SearchObjectName:="SearchText_Mac"
	$SearchClose:="CloseButton_Mac"
End if 

$PtrSearchText:=OBJECT Get pointer:C1124(Object named:K67:5; $SearchObjectName)
//$PtrSearchMenu:=OBJECT Get pointer(Object named;"SearchMenu")

If (Is Windows:C1573)  //----------- WIN -----------
	
	// by default, the form object is complete and every item has the right size
	// but as long as it can change dynamically, all the items have to be moved according to the context
	
	//OBJECT GET COORDINATES(*; "BgndLeft_Win"; $x1; $y1; $x2; $y2)
	//$MemoX1:=$x1
	//$MemoY1:=$y1
	//OBJECT GET COORDINATES(*; "BgndRight_Win"; $x1; $y1; $x2; $y2)
	//$MemoX2:=$x2
	//$MemoY2:=$y2
	
	//If ($PtrSearchText->#"")
	//$Format:=";file:Images/Win/SearchBox/searchbox_close.png"
	//Else 
	//$Format:=";file:Images/Win/SearchBox/searchbox_Glass.png"
	//End if 
	
	//OBJECT SET FORMAT(*; $SearchClose; $Format)
	
Else   //---------------  MAC ------------------
	
	
	//$Format:=";;;;;;;;;;0"
	//$Width:=18
	
	//OBJECT GET COORDINATES(*; "SearchButton_Mac"; $x1; $y1; $x2; $y2)
	//OBJECT MOVE(*; "SearchButton_Mac"; $x1; $y1; $x1+$Width; $y2; *)
	//OBJECT SET FORMAT(*; "SearchButton_Mac"; $Format)
	
	If ($PtrSearchText->#"")
		OBJECT SET VISIBLE:C603(*; $SearchClose; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; $SearchClose; False:C215)
	End if 
	
End if 

