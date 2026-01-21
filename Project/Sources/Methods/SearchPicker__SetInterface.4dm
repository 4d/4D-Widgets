//%attributes = {"invisible":true}

var $x1; $y1; $x2; $y2 : Integer
var $memoX1; $memoX2; $memoY1; $memoY2 : Integer
var $Width : Integer

var $searchObjectName; $searchClose; $Format : Text

var $PtrSearchText : Pointer

If (Is Windows:C1573)  //----------- WIN -----------
	$searchObjectName:="SearchText_Win"
	$searchClose:="CloseButton_Win"
Else   //macintosh
	$searchObjectName:="SearchText_Mac"
	$searchClose:="CloseButton_Mac"
End if 

$PtrSearchText:=OBJECT Get pointer:C1124(Object named:K67:5; $searchObjectName)


If (Is Windows:C1573)  //----------- WIN -----------
	
	$Format:=OBJECT Get format:C894(*; $searchClose)
	
	If ($PtrSearchText->#"")
		$Format:=";file:Images/Win/SearchBox/Searchbox_close.png"
	Else 
		$Format:=";file:Images/Win/SearchBox/Searchbox_glass.png"
	End if 
	
	OBJECT SET FORMAT:C236(*; $searchClose; $Format)
	
Else   //---------------  MAC ------------------
	
	If ($PtrSearchText->#"")
		OBJECT SET VISIBLE:C603(*; $searchClose; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; $searchClose; False:C215)
	End if 
	
End if 

