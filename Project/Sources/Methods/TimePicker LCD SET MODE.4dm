//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)  // form name
C_LONGINT:C283($2)  // mode 12 ou 24

C_TEXT:C284($subFormName)
C_TEXT:C284($ErrorText)
C_LONGINT:C283($mode)

If (Count parameters:C259>=2)
	
	$subFormName:=$1
	$mode:=$2
	
	EXECUTE METHOD IN SUBFORM:C1085($subFormName; "TimePicker__LCD SET MODE"; *; $mode)
	
Else 
	//incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
End if 





