//%attributes = {"invisible":true,"shared":true}


var $1 : Text  //destination form (MUST be provided)

var $Form : Text
var $ErrorText : Text

If (Count parameters:C259=1)
	
	If (Type:C295($1)=Is text:K8:3)
		$Form:=$1
		
		DatePicker__InitInter  //just in case a "DISPOSE had been called before
		
		DatePicker SET MIN DATE($Form; <>DatePicker_DateMin)
		DatePicker SET MAX DATE($Form; <>DatePicker_DateMax)
		DatePicker SET WEEK FIRST DAY($Form; <>DatePicker_FirstDayOfWeek)
		DatePicker SET DAYS OFF($Form; 0; -><>_DatePicker_DaysOff0)
		DatePicker SET DAYS OFF($Form; 1; -><>_DatePicker_DaysOff1)
		DatePicker SET DAYS OFF($Form; 2; -><>_DatePicker_DaysOff2)
		
		EXECUTE METHOD IN SUBFORM:C1085($Form; "DatePicker__RedrawCalendar")
		
	Else 
		
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
