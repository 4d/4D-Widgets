//%attributes = {"invisible":true,"shared":true}

var $1 : Integer  //number of the day (as contant like monday)

var $FirstDayOfWeek : Integer
var $ErrorText : Text

DatePicker__InitInter


If (Count parameters:C259=1)
	
	If (Type:C295($1)=Is longint:K8:6)
		$FirstDayOfWeek:=$1
		
		If ($FirstDayOfWeek>=1) & ($FirstDayOfWeek<=7)
			
			<>DatePicker_FirstDayOfWeek:=$FirstDayOfWeek
		Else 
			//invalid parameter
		End if 
		
	Else 
		$ErrorText:=Localized string:C991("Errors_LongIntParameter")
		$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
	
Else 
	//incorrect number of parameters
	$ErrorText:=Localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 