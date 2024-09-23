//%attributes = {"invisible":true}
#DECLARE($inPosX : Integer; $inPosY : Integer)->$result : Object
var $screenCount; $screenIndex : Integer
var $left; $top; $right; $bottom : Integer

$result:=New object:C1471("x"; 0; "y"; 0; "width"; Screen width:C187; "height"; Screen height:C188)

$screenCount:=Count screens:C437
For ($screenIndex; 1; $screenCount)
	SCREEN COORDINATES:C438($left; $top; $right; $bottom; $screenIndex; Screen work area:K27:10)
	If (($inPosX>=$left) & ($inPosX<$right) & ($inPosY>=$top) & ($inPosY<$bottom))
		$result.x:=$left
		$result.y:=$top
		$result.width:=$right-$left
		$result.height:=$bottom-$top
		break
	End if 
End for 
