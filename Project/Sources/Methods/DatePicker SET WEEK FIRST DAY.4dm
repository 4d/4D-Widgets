//%attributes = {"invisible":true,"shared":true}

var $1 : Text  //destination form if provided
var $2 : Integer  //number of the day (as contant like monday)

var $FirstDayOfWeek : Integer
var $FirstDisplayedDay : Date

var $Form : Text
var $ErrorText : Text

DatePicker__InitInter


If (Count parameters:C259=2)
	
	If (Type:C295($1)=Is text:K8:3)
		$Form:=$1
		
		If (Type:C295($2)=Is longint:K8:6)
			$FirstDayOfWeek:=$2
			
			If ($FirstDayOfWeek>=1) & ($FirstDayOfWeek<=7)
				
				Tool_VarToObject(->$FirstDayOfWeek; "FirstDayOfWeek"; $Form)  //specific form
				
				//loads the 1st day currently displayed
				Tool_ObjectToVar("FirstDisplayedDay"; ->$FirstDisplayedDay; $Form)
				
				If ($FirstDisplayedDay=!00-00-00!)
					$FirstDisplayedDay:=Current date:C33
				End if 
				
				$FirstDisplayedDay:=Add to date:C393($FirstDisplayedDay; 0; 0; 15)
				DatePicker__CalculateFirstDay($FirstDisplayedDay; $Form)
				
				If ($Form#"")
					EXECUTE METHOD IN SUBFORM:C1085($Form; "DatePicker__RedrawCalendar")
				End if 
				
			Else 
				//invalid parameter
			End if 
			
		Else 
			$ErrorText:=Localized string:C991("Errors_LongIntParameter")
			$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
			ALERT:C41($ErrorText)
		End if 
		
	Else 
		//not a text in first
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