//%attributes = {"invisible":true,"shared":true}
#DECLARE($selector : Integer; $values : Pointer)

// Selecteur = 0 week, 1 year (recurents), 2 year (non recurents)

If (Count parameters:C259=0)
	
	ALERT:C41(Replace string:C233(Localized string:C991("Errors_IncorrectParamNumbers"); "[1]"; Current method name:C684))
	
	return 
	
End if 

Case of 
		
		//________________________________________________________________________________
	: (Is nil pointer:C315($values))
		
		ALERT:C41(Replace string:C233(Localized string:C991("Errors_PointerParameter"); "[1]"; Current method name:C684))
		
		//________________________________________________________________________________
	: ($selector=0)  // Must be a boolean array
		
		If (Type:C295($values->)=Boolean array:K8:21)\
			 && (Size of array:C274($values->)=7)
			
			//%W-518.1
			COPY ARRAY:C226($values->; <>_DatePicker_DaysOff0)
			//%W+518.1
			
		Else 
			
			ALERT:C41(Replace string:C233(Localized string:C991("Errors_ArrayPtrParameter"); "[1]"; Current method name:C684))
			
		End if 
		
		//________________________________________________________________________________
	: ($selector=1)  // Repeated every year
		
		If (Type:C295($values->)=Date array:K8:20)
			
			//%W-518.1
			COPY ARRAY:C226($values->; <>_DatePicker_DaysOff1)
			//%W+518.1
			
			// Reformat for year 2000 (quick code later;1)
			var $i : Integer
			For ($i; 1; Size of array:C274(<>_DatePicker_DaysOff1))
				
				<>_DatePicker_DaysOff1{$i}:=Add to date:C393(!00-00-00!; 2000; Month of:C24(<>_DatePicker_DaysOff1{$i}); Day of:C23(<>_DatePicker_DaysOff1{$i}))
				
			End for 
			
		Else 
			
			ALERT:C41(Replace string:C233(Localized string:C991("Errors_DateArrayPtrParameter"); "[1]"; Current method name:C684))
			
		End if 
		
		//________________________________________________________________________________
	: ($selector=2)  // Only once
		
		If (Type:C295($values->)=Date array:K8:20)
			
			//%W-518.1
			COPY ARRAY:C226($values->; <>_DatePicker_DaysOff2)
			//%W+518.1
			
		Else 
			
			ALERT:C41(Replace string:C233(Localized string:C991("Errors_DateArrayPtrParameter"); "[1]"; Current method name:C684))
			
		End if 
		
		//________________________________________________________________________________
End case 