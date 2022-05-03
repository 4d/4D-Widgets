//%attributes = {"invisible":true,"shared":true}

C_TEXT:C284($1)  //destination form if provided
C_DATE:C307($2)  //max date

C_TEXT:C284($Form)
C_TEXT:C284($ErrorText)

C_DATE:C307($minDate)
C_DATE:C307($maxDate)

DatePicker__InitInter

If (Count parameters:C259=2)
	
	If (Type:C295($1)=Is text:K8:3)
		$Form:=$1
		
		If (Type:C295($2)=Is date:K8:7)
			$minDate:=$2
			
			// get the Max date of the form
			Tool_ObjectToVar("MaxDate"; ->$maxDate; $Form)
			
			If (($minDate<=$maxDate) | ($maxDate=!00-00-00!))
				Tool_VarToObject(->$minDate; "MinDate"; $Form)
				
				If ($Form#"")
					EXECUTE METHOD IN SUBFORM:C1085($Form; "DatePicker__RedrawCalendar")
					EXECUTE METHOD IN SUBFORM:C1085($Form; "DateEntry__Redraw")
				End if 
				
			End if 
			
		Else 
			
			$ErrorText:=Get localized string:C991("Errors_DateParameter")
			$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
			ALERT:C41($ErrorText)
		End if 
		
	Else 
		
		$ErrorText:=Get localized string:C991("Errors_TextParameter")
		$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
	
Else 
	//incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
