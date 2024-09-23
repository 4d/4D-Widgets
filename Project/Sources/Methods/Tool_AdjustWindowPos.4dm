//%attributes = {"invisible":true}
#DECLARE($ioPosX : Pointer; $ioPosY : Pointer; $inWidth : Integer; $inHeight : Integer)

var $applicationInfo : Object
var $inModalDialog : Boolean
var $x; $y : Integer
var $screenInfo : Object

$screenInfo:={x: 0; y: 0; width: Screen width:C187; height: Screen height:C188}

$x:=$ioPosX->
$y:=$ioPosY->

If (Is Windows:C1573)
	$applicationInfo:=Application info:C1599
	$inModalDialog:=(Window kind:C445(Frontmost window:C447)=Modal dialog:K27:2)
	
	If ($applicationInfo.SDIMode=False:C215 & $inModalDialog)
		CONVERT COORDINATES:C1365($x; $x; XY Main window:K27:8; XY Screen:K27:7)
	End if 
	
	If ($applicationInfo.SDIMode=True:C214 | $inModalDialog)
		$screenInfo:=Tool_ScreenInfoFromPoint($x; $y)
	End if 
Else 
	$screenInfo:=Tool_ScreenInfoFromPoint($x; $y)
End if 

Case of 
	: (($x+$inWidth)>($screenInfo.x+$screenInfo.width))
		$x:=($screenInfo.x+$screenInfo.width)-$inWidth-5
	: ($x<($screenInfo.x+5))
		$x:=$screenInfo.x+5
End case 

Case of 
	: (($y+$inHeight)>($screenInfo.y+$screenInfo.height))
		$y:=($screenInfo.y+$screenInfo.height)-$inHeight-10
	: ($y<($screenInfo.y+5))
		$y:=$screenInfo.y+5
End case 

If (Is Windows:C1573)
	If ($applicationInfo.SDIMode=False:C215 & $inModalDialog)
		CONVERT COORDINATES:C1365($x; $x; XY Screen:K27:7; XY Main window:K27:8)
	End if 
End if 

$ioPosX->:=$x
$ioPosY->:=$y