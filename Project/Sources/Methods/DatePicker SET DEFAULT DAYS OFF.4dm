//%attributes = {"invisible":true,"shared":true}
//$1 = selecteur = 0 week, 1 year (recurents), 2 year (non recurents)
//$2 pointer on array tableau…
//   … of booleans if $1 = 0 … of dates if $1 = 1 ou 2

C_LONGINT:C283($1)  //number of the day (as contant like monday)
C_POINTER:C301($2)

C_LONGINT:C283($selector)
C_POINTER:C301($ptrArray)
C_BOOLEAN:C305($Error)

C_LONGINT:C283($i; $n)

C_TEXT:C284($ErrorText)

DatePicker__InitInter


If (Count parameters:C259=2)
	
	If (Type:C295($1)=Is longint:K8:6)
		$selector:=$1
		If (Type:C295($2)=Is pointer:K8:14)
			$ptrArray:=$2
			
			
			Case of 
				: ($selector=0)
					
					$Error:=True:C214
					
					If (Not:C34(Is nil pointer:C315($ptrArray)))
						If (Type:C295($ptrArray->)=Boolean array:K8:21)
							If (Size of array:C274($ptrArray->)=7)
								$Error:=False:C215
								COPY ARRAY:C226($ptrArray->; <>_DatePicker_DaysOff0)
							End if 
						End if 
					End if 
					
					If ($Error)
						$ErrorText:=Get localized string:C991("Errors_ArrayPtrParameter")
						$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
						ALERT:C41($ErrorText)
					End if 
					
				: ($selector=1) | ($selector=2)
					
					$Error:=True:C214
					
					If (Not:C34(Is nil pointer:C315($ptrArray)))
						If (Type:C295($ptrArray->)=Date array:K8:20)
							$Error:=False:C215
							
							Case of 
								: ($selector=1)  //repeated every year
									COPY ARRAY:C226($ptrArray->; <>_DatePicker_DaysOff1)
									$n:=Size of array:C274(<>_DatePicker_DaysOff1)
									For ($i; 1; $n)  //reformat for year 2000 (quick code later)
										<>_DatePicker_DaysOff1{$i}:=Add to date:C393(!00-00-00!; 2000; Month of:C24(<>_DatePicker_DaysOff1{$i}); Day of:C23(<>_DatePicker_DaysOff1{$i}))
									End for 
								: ($selector=2)  //only once
									COPY ARRAY:C226($ptrArray->; <>_DatePicker_DaysOff2)
							End case 
							
						End if 
					End if 
					
					If ($Error)
						$ErrorText:=Get localized string:C991("Errors_DateArrayPtrParameter")
						$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
						ALERT:C41($ErrorText)
					End if 
					
			End case 
			
		Else 
			$ErrorText:=Get localized string:C991("Errors_PointerParameter")
			$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
			ALERT:C41($ErrorText)
		End if 
	Else 
		$ErrorText:=Get localized string:C991("Errors_LongIntParameter")
		$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
		ALERT:C41($ErrorText)
	End if 
	
Else 
	//incorrect number of parameters
	$ErrorText:=Get localized string:C991("Errors_IncorrectParamNumbers")
	$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
	ALERT:C41($ErrorText)
	
End if 
