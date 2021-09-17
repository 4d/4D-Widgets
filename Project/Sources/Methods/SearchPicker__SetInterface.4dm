//%attributes = {"invisible":true}

C_LONGINT:C283($x1; $y1; $x2; $y2)
C_LONGINT:C283($MemoX1; $MemoX2; $MemoY1; $MemoY2)
C_LONGINT:C283($Width)

C_TEXT:C284($SearchObjectName; $SearchClose; $Format)

C_POINTER:C301($PtrSearchText)

If (Is Windows:C1573)  //----------- WIN -----------
	$SearchObjectName:="SearchText_Win"
	$SearchClose:="CloseButton_Win"
Else   //macintosh
	$SearchObjectName:="SearchText_Mac"
	$SearchClose:="CloseButton_Mac"
End if 

$PtrSearchText:=OBJECT Get pointer:C1124(Object named:K67:5; $SearchObjectName)


If (Is Windows:C1573)  //----------- WIN -----------
	
	$Format:=OBJECT Get format:C894(*; $SearchClose)
	
	If ($PtrSearchText->#"")
		$Format:=";file:Images/Win/SearchBox/Searchbox_close.png"
	Else 
		$Format:=";file:Images/Win/SearchBox/Searchbox_glass.png"
	End if 
	
	OBJECT SET FORMAT:C236(*; $SearchClose; $Format)
	
Else   //---------------  MAC ------------------
	
	If ($PtrSearchText->#"")
		OBJECT SET VISIBLE:C603(*; $SearchClose; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; $SearchClose; False:C215)
	End if 
	
End if 

