//%attributes = {"invisible":true,"shared":true}

var $1 : Text  //destination form MUST be provided
var $2 : Date  //max date

var $Form : Text
var $ErrorText : Text

var $minDate : Date
var $maxDate : Date

DatePicker__InitInter

If (Count parameters:C259=2)
	
	If (Type:C295($1)=Is text:K8:3)
		$Form:=$1
		
		If (Type:C295($2)=Is date:K8:7)
			$maxDate:=$2
			
			// get the Min date of the form
			Tool_ObjectToVar("MinDate"; ->$minDate; $Form)
			
			If (($maxDate>=$minDate) | ($minDate=!00-00-00!))
				Tool_VarToObject(->$maxDate; "MaxDate"; $Form)
				
				If ($Form#"")
					EXECUTE METHOD IN SUBFORM:C1085($Form; "DatePicker__RedrawCalendar")
					EXECUTE METHOD IN SUBFORM:C1085($Form; "DateEntry__Redraw")
				End if 
				
			End if 
		Else 
			//pas une date en 2eme
			$ErrorText:=Localized string:C991("Errors_DateParameter")
			$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
			ALERT:C41($ErrorText)
		End if 
		
	Else 
		//Pas un texte en 1er
		$ErrorText:=Localized string:C991("Errors_TextParameter")
		$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
	
Else 
	//incorrect number of parameters
	$ErrorText:=Localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
