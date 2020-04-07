//%attributes = {"invisible":true,"shared":true}

C_TEXT:C284($1)  //destination form MUST be provided
C_DATE:C307($2)  //max date

C_TEXT:C284($Form)
C_TEXT:C284($ErrorText)

C_DATE:C307($MinDate)
C_DATE:C307($MaxDate)

DatePicker__InitInter 

If (Count parameters:C259=2)
	
	If (Type:C295($1)=Is text:K8:3)
		$Form:=$1
		
		If (Type:C295($2)=Is date:K8:7)
			$MaxDate:=$2
			
			  // get the Min date of the form
			Tool_ObjectToVar ("MinDate";->$MinDate;$Form)
			
			If (($MaxDate>=$MinDate) | ($MinDate=!00-00-00!))
				Tool_VarToObject (->$MaxDate;"MaxDate";$Form)
				
				If ($Form#"")
					EXECUTE METHOD IN SUBFORM:C1085($Form;"DatePicker__RedrawCalendar")
					EXECUTE METHOD IN SUBFORM:C1085($Form;"DateEntry__Redraw")
				End if 
				
			End if 
		Else 
			  //pas une date en 2eme
			$ErrorText:=Get localized string:C991("Errors_DateParameter")
			$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
			ALERT:C41($ErrorText)
		End if 
		
	Else 
		  //Pas un texte en 1er
		$ErrorText:=Get localized string:C991("Errors_TextParameter")
		$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
	
Else 
	  //incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText;"[1]";Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
