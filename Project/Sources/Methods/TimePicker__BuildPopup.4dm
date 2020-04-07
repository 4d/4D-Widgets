//%attributes = {"invisible":true}
C_LONGINT:C283($NbPopup)
C_LONGINT:C283($IntHours;$IntMinuts;$IntTime)

C_POINTER:C301($PtrAmPm;$PtrHours;$PtrMinuts)

C_BOOLEAN:C305($AmPm)

C_TIME:C306($MinTime)
C_TIME:C306($MaxTime)
C_TIME:C306($Step)
C_TIME:C306($TimePicker_Time)

C_TEXT:C284($Label)
C_TEXT:C284($AMlabel)
C_TEXT:C284($PMlabel)
C_TEXT:C284($localisation1;$localisation2)

TimePicker__GetTimeMin (->$MinTime)
TimePicker__GetTimeMax (->$MaxTime)
TimePicker__GetStep (->$Step)

TimePicker__GetLabelAM (->$AMlabel)  //label local ou label par defaut
TimePicker__GetLabelPM (->$PMlabel)  //label local ou label par defaut


ARRAY TEXT:C222($_TimePickerHours;0)
ARRAY TEXT:C222($_TimePickerMinuts;0)

$Localisation1:=Get database localization:C1009(User system localization:K5:23)
$Localisation2:=Get database localization:C1009(Current localization:K5:22)

$NbPopup:=0
$PtrHours:=OBJECT Get pointer:C1124(Object named:K67:5;"Hours")
If (Not:C34(Is nil pointer:C315($PtrHours)))
	$NbPopup:=1
	$PtrMinuts:=Self:C308(Object named:K67:5;"Minuts")
	If (Not:C34(Is nil pointer:C315($PtrMinuts)))
		$NbPopup:=2
	End if 
End if 

  // check is the form is designed for AM/PM
  // if it is, it will contain an object named AmPmEntry wich is just an indicator
$PtrAmPm:=Self:C308(Object named:K67:5;"AmPmEntry")
If (Not:C34(Is nil pointer:C315($PtrAmPm)))
	$AmPm:=True:C214
Else 
	$AmPm:=False:C215
End if 

Case of 
	: ($NbPopup=0)
		
		  //do nothing
		  // method called from a global
		
	: ($NbPopup=1)
		
		If ($AmPm=False:C215)
			
			If ($Step#?00:00:00?)
				$TimePicker_Time:=$MinTime
				Repeat 
					APPEND TO ARRAY:C911($_TimePickerHours;String:C10($TimePicker_Time;HH MM:K7:2))
					$TimePicker_Time:=$TimePicker_Time+$Step
				Until ($TimePicker_Time>$MaxTime)
			End if 
			
		Else 
			
			If ($Step#?00:00:00?)
				$TimePicker_Time:=$MinTime
				Repeat 
					Case of 
						: ($TimePicker_Time<?01:00:00?)
							$Label:=$AMLabel
							$IntHours:=12  //12 AM
						: ($TimePicker_Time<?12:00:00?)  //01 AM to 11 AM
							$Label:=$AMLabel
							$IntHours:=Int:C8($TimePicker_Time/3600)
						: ($TimePicker_Time<?13:00:00?)
							$Label:=$PMLabel
							$IntHours:=12  //12 PM
						: ($TimePicker_Time<?24:00:00?)
							$Label:=$PMLabel
							$IntHours:=Int:C8(($TimePicker_Time-?12:00:00?)/3600)
						: ($TimePicker_Time>=?24:00:00?)
							$Label:=$AMLabel
							$IntHours:=12  //12 AM
					End case 
					$IntMinuts:=Int:C8(($TimePicker_Time%3600)\60)
					
					If ($Localisation1#"ja") & ($Localisation2#"ja")
						APPEND TO ARRAY:C911($_TimePickerHours;String:C10($IntHours;"00")+":"+String:C10($IntMinuts;"00")+" "+$Label)
					Else 
						APPEND TO ARRAY:C911($_TimePickerHours;$Label+" "+String:C10($IntHours;"00")+":"+String:C10($IntMinuts;"00"))
					End if 
					
					$TimePicker_Time:=$TimePicker_Time+$Step
				Until ($TimePicker_Time>$MaxTime)
			End if 
			
		End if 
		
		COPY ARRAY:C226($_TimePickerHours;$PtrHours->)
		
	: ($NbPopup=2)
		
		If ($Step#?00:00:00?)
			
			$TimePicker_Time:=$MinTime
			
			If ($AmPm=False:C215)
				  //populate Hours array
				Repeat 
					$IntTime:=Int:C8($TimePicker_Time/3600)
					APPEND TO ARRAY:C911($_TimePickerHours;String:C10($IntTime;"00"))
					$TimePicker_Time:=$TimePicker_Time+?01:00:00?
				Until ($TimePicker_Time>$MaxTime)
				
			Else 
				  //populate Hours array
				Repeat 
					$IntTime:=Int:C8($TimePicker_Time/3600)
					Case of 
						: ($IntTime<1)
							$Label:=$AMLabel
							$IntHours:=12  //12 AM
						: ($IntTime<12)
							$Label:=$AMLabel
							$IntHours:=Int:C8($TimePicker_Time/3600)
						: ($IntTime<13)
							$Label:=$PMLabel
							$IntHours:=12  //12 PM
						: ($IntTime<24)
							$Label:=$PMLabel
							$IntHours:=Int:C8($TimePicker_Time/3600)-12
						: ($IntTime>=24)
							$IntHours:=12  //12 PM
							$Label:=$AMLabel
					End case 
					
					If ($Localisation1#"ja") & ($Localisation2#"ja")
						APPEND TO ARRAY:C911($_TimePickerHours;String:C10($IntHours;"00")+" "+$Label)
					Else 
						APPEND TO ARRAY:C911($_TimePickerHours;$Label+" "+String:C10($IntHours;"00"))
					End if 
					
					$TimePicker_Time:=$TimePicker_Time+?01:00:00?
				Until ($TimePicker_Time>$MaxTime)
				
			End if 
			
			  //populate Minuts array  (common)
			
			$TimePicker_Time:=?00:00:00?
			Repeat 
				$IntTime:=Int:C8($TimePicker_Time/60)
				APPEND TO ARRAY:C911($_TimePickerMinuts;String:C10($IntTime;"00"))
				$TimePicker_Time:=$TimePicker_Time+$Step
			Until ($TimePicker_Time>=?01:00:00?)
			
		End if 
		
		COPY ARRAY:C226($_TimePickerHours;$PtrHours->)
		COPY ARRAY:C226($_TimePickerMinuts;$PtrMinuts->)
		
End case 