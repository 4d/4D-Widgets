//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)  // form name
C_LONGINT:C283($2)  // color (RGB or R)
C_LONGINT:C283($3)  // {color G}
C_LONGINT:C283($4)  // {color B}

C_TEXT:C284($subFormName)
C_TEXT:C284($ErrorText)
C_TEXT:C284($rgb)

C_LONGINT:C283($red; $blue; $green)

If (Count parameters:C259>=2)
	
	$subFormName:=$1
	
	If (Count parameters:C259>=4)
		$red:=$2
		$green:=$3
		$blue:=$4
	Else 
		$red:=($2 & 0x00FF0000) >> 16
		$green:=($2 & 0xFF00) >> 8
		$blue:=($2 & 0x00FF) >> 0
	End if 
	
	$rgb:="rgb("+String:C10($red)+","+String:C10($green)+","+String:C10($blue)+")"
	EXECUTE METHOD IN SUBFORM:C1085($subFormName; "TimePicker__LCD SET COLOR"; *; $rgb)
	
Else 
	//incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
End if 





