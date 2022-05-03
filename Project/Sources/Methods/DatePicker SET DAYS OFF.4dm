//%attributes = {"invisible":true,"shared":true}

C_TEXT:C284($1)  //form name (if provided)
C_LONGINT:C283($2)  //type of days off (0 = repeated each week, 1 = repeated earch year , 2 = only once)
C_POINTER:C301($3)  // pointer on booelan or date array

C_TEXT:C284($Form)  //form name
C_TEXT:C284($ErrorText)

C_LONGINT:C283($selector)  //type of days off (0 = repeated each week, 1 = repeated earch year , 2 = only once)
C_LONGINT:C283($i; $n)


C_POINTER:C301($ptrArray)  // pointer on booelan or date array
C_POINTER:C301($Ptr_WeeklyDaysoff)
C_POINTER:C301($PtrLocalArray)

C_BOOLEAN:C305($Error)


If (Count parameters:C259=3)
	
	If (Type:C295($1)=Is text:K8:3)
		$Form:=$1
		If (Type:C295($2)=Is longint:K8:6)
			$selector:=$2
			If (Type:C295($3)=Is pointer:K8:14)
				$ptrArray:=$3
				
				
				Case of 
					: ($selector=0)
						
						$Error:=True:C214
						
						If (Not:C34(Is nil pointer:C315($ptrArray)))
							If (Type:C295($ptrArray->)=Boolean array:K8:21)
								If (Size of array:C274($ptrArray->)=7)
									$Error:=False:C215
									
									$Ptr_WeeklyDaysoff:=OBJECT Get pointer:C1124(Object named:K67:5; "_WeeklyDaysOff"; $Form)
									
									If (Not:C34(Is nil pointer:C315($Ptr_WeeklyDaysoff)))
										COPY ARRAY:C226($ptrArray->; $Ptr_WeeklyDaysoff->)
									Else 
										// this should NEVER happend
										//ALERT("“_WeeklyDaysOff” Object not found")
									End if 
									
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
								
								DatePicker__InitInter
								
								Case of 
									: ($selector=1)  //repeated every year
										$PtrLocalArray:=Self:C308(Object named:K67:5; "_DaysOff1"; $Form)
										If (Not:C34(Is nil pointer:C315($PtrLocalArray)))
											COPY ARRAY:C226($ptrArray->; $PtrLocalArray->)
											$n:=Size of array:C274($PtrLocalArray->)  //reformat for year 2000 (quick code later)
											For ($i; 1; $n)
												$PtrLocalArray->{$i}:=Add to date:C393(!00-00-00!; 2000; Month of:C24($PtrLocalArray->{$i}); Day of:C23($PtrLocalArray->{$i}))
											End for 
										End if 
									: ($selector=2)  //only once
										$PtrLocalArray:=Self:C308(Object named:K67:5; "_DaysOff2"; $Form)
										If (Not:C34(Is nil pointer:C315($PtrLocalArray)))
											COPY ARRAY:C226($ptrArray->; $PtrLocalArray->)
										End if 
								End case 
								
								If ($Form#"")
									EXECUTE METHOD IN SUBFORM:C1085($Form; "DatePicker__RedrawCalendar")
								End if 
								
								$Error:=False:C215
							End if 
						End if 
						
				End case 
				
				If ($Error)
					$ErrorText:=Get localized string:C991("Errors_DateArrayPtrParameter")
					$ErrorText:=Replace string:C233($ErrorText; "[1]"; Current method name:C684)
					ALERT:C41($ErrorText)
				End if 
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