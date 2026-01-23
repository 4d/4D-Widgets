//%attributes = {"invisible":true,"shared":true}
#DECLARE($widget : Text; $red : Integer; $green : Integer; $blue : Integer)

If (Count parameters:C259<2)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

If (Count parameters:C259=2)
	
	var $color:=$red
	$red:=($color & 0x00FF0000) >> 16
	$green:=($color & 0xFF00) >> 8
	$blue:=($color & 0x00FF) >> 0
	
End if 

var $rgb:="rgb("+String:C10($red)+","+String:C10($green)+","+String:C10($blue)+")"
EXECUTE METHOD IN SUBFORM:C1085($widget; Formula:C1597(OBJECT SET VALUE:C1742("color"; $rgb)))