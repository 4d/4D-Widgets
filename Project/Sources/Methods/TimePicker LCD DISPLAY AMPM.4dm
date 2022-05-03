//%attributes = {"invisible":true,"shared":true}

C_TEXT:C284($1)  // form name
C_BOOLEAN:C305($2)  // true = display AMPM, false : do not display AMPM

C_TEXT:C284($subFormName)
C_TEXT:C284($ErrorText)
C_BOOLEAN:C305($withAmPm)


If (Count parameters:C259>=2)
	
	$subFormName:=$1
	$withAmPm:=$2
	
	EXECUTE METHOD IN SUBFORM:C1085($subFormName; "TimePicker__LCD DISPLAY AMPM"; *; $withAmPm)
	
	
Else 
	//incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 




