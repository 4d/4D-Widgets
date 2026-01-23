//%attributes = {"invisible":true}
var $1 : Pointer  //pointer on boolean array to be filled
var $targetDaysOff : Pointer

var $2 : Text

var $form : Text
var $sourceDaysOff : Pointer

$targetDaysOff:=$1


If (Type:C295($1)=Is pointer:K8:14)
	If (Not:C34(Is nil pointer:C315($1)))
		If (Type:C295($1->)=Boolean array:K8:21)
			
			If (Count parameters:C259>=2)
				$form:=$2
			Else 
				$form:=""
			End if 
			
			$sourceDaysOff:=OBJECT Get pointer:C1124(Object named:K67:5; "_WeeklyDaysOff"; $form)
			
			If (Is nil pointer:C315($sourceDaysOff))  // If NOT found in form, use default
				$sourceDaysOff:=-><>_DatePicker_DaysOff0
			End if 
			
			//%W-518.1
			COPY ARRAY:C226($sourceDaysOff->; $targetDaysOff->)
			//%W+518.1
			
		End if 
	End if 
End if 


