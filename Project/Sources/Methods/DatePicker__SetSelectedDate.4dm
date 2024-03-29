//%attributes = {"invisible":true}
//the method DatePicker__SetSelectedDate does the actions below

// it receives a date as parameter

// ••• IF a formname is passed
// it makes this date conform with local constraints (min/max)
// it saves this date localy
// if the result is different from the binded variable, then the bind variable is uapdated
// if the date is not !00-00-00!   -- RL 2017/08/02

// ••• IF a formname is NOT passed
// it makes this date conform with local constraints (min/max)
// it becames the default date

C_DATE:C307($1)  // date
C_TEXT:C284($2)  //destination parent form if provided

C_DATE:C307($0)  // returned date (that MAY be different from received one)

C_DATE:C307($date)
C_DATE:C307($returnedDate)
C_TEXT:C284($Form)
C_TEXT:C284($ErrorText)
//C_POINTER($datePicker_Target)
C_DATE:C307($datePicker_Target)

DatePicker__InitInter

If (Type:C295($1)=Is date:K8:7)
	
	$date:=$1
	
	If (Count parameters:C259>=2)  //for a specific parent subform object OR current form 
		$Form:=$2
		
		C_DATE:C307($minDate)
		C_DATE:C307($maxDate)
		
		DatePicker__GetMinDate(->$minDate; $Form)
		DatePicker__GetMaxDate(->$maxDate; $Form)
		
		Case of 
			: ($date<$minDate) & ($minDate#!00-00-00!)
				$date:=$minDate
			: ($date>$maxDate) & ($maxDate#!00-00-00!)
				$date:=$maxDate
		End case 
		
		Tool_VarToObject(->$date; "SelectedDate"; $Form)
		
		$datePicker_Target:=DatePicker__GetTarget
		// TM 2019-05-24 - don't use process variables to allow two instances.
		
		If ($datePicker_Target#$date)  //ACI0097346
			If ($date#!00-00-00!)  //-- RL 2017/08/02
				$datePicker_Target:=$date
				DatePicker__SetTarget($datePicker_Target)
			End if 
		End if 
		
	Else   // Default value
		
		Case of 
			: ($date<<>DatePicker_DateMin)
				$date:=<>DatePicker_DateMin
			: ($date><>DatePicker_DateMax) & (<>DatePicker_DateMax#!00-00-00!)
				$date:=<>DatePicker_DateMax
		End case 
		
		DatePicker SET DEFAULT DATE($date)
		
	End if 
	
	$returnedDate:=$date
	
Else 
	
	$ErrorText:=Get localized string:C991("Errors_DateParameter")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
	$returnedDate:=!00-00-00!
	
End if 

$0:=$returnedDate
