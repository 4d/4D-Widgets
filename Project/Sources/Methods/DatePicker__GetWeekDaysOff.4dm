//%attributes = {"invisible":true}
C_POINTER:C301($1)  //pointer on boolean array to be filled
C_POINTER:C301($targetDaysOff)

C_TEXT:C284($2)

C_TEXT:C284($Form)
C_POINTER:C301($sourceDaysOff)

$targetDaysOff:=$1


If (Type:C295($1)=Is pointer:K8:14)
	If (Not:C34(Is nil pointer:C315($1)))
		If (Type:C295($1->)=Boolean array:K8:21)
			
			If (Count parameters:C259>=2)
				$Form:=$2
			Else 
				$Form:=""
			End if 
			
			$sourceDaysOff:=OBJECT Get pointer:C1124(Object named:K67:5; "_WeeklyDaysOff"; $Form)
			
			If (Is nil pointer:C315($sourceDaysOff))  // If NOT found in form, use default
				$sourceDaysOff:=-><>_DatePicker_DaysOff0
			End if 
			
			COPY ARRAY:C226($sourceDaysOff->; $targetDaysOff->)
			
		End if 
	End if 
End if 


