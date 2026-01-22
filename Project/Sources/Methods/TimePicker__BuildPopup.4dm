//%attributes = {"invisible":true}
var $minTime : Time
var $maxTime : Time
var $step : Time
TimePicker__GetTimeMin(->$minTime)
TimePicker__GetTimeMax(->$maxTime)
TimePicker__GetStep(->$step)

var $AMlabel : Text
var $PMlabel : Text
TimePicker__GetLabelAM(->$AMlabel)  // Local label or default label
TimePicker__GetLabelPM(->$PMlabel)  // Local label or default label

$AMlabel:=$AMLabel="<none>" ? "" : $AMLabel
$PMlabel:=$PMlabel="<none>" ? "" : $PMlabel

ARRAY TEXT:C222($_TimePickerHours; 0)
ARRAY TEXT:C222($_TimePickerMinutes; 0)

var $Localisation1 : Text:=Get database localization:C1009(User system localization:K5:23)
var $Localisation2 : Text:=Get database localization:C1009(Current localization:K5:22)

ARRAY TEXT:C222($widgets; 0)
FORM GET OBJECTS:C898($widgets)
var $NbPopup : Integer:=Num:C11(Find in array:C230($widgets; "Hours")>0)+Num:C11(Find in array:C230($widgets; "Minutes")>0)

Case of 
		
		//________________________________________________________________________________
	: ($NbPopup=0)
		
		return   // Do nothing - Method called from a global
		
		//________________________________________________________________________________
	: ($NbPopup=1)
		
		If (Find in array:C230($widgets; "am_pm")=0)
			
			If ($step#?00:00:00?)
				
				var $pickerTime : Time:=$minTime
				
				Repeat 
					
					APPEND TO ARRAY:C911($_TimePickerHours; String:C10($pickerTime; HH MM:K7:2))
					$pickerTime:=$pickerTime+$step
					
				Until ($pickerTime>$maxTime)
			End if 
			
		Else 
			
			If ($step#?00:00:00?)
				
				$pickerTime:=$minTime
				
				Repeat 
					
					Case of 
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($pickerTime<?01:00:00?)
							
							var $Label:=$AMLabel
							var $hours : Integer:=12  // 12 AM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($pickerTime<?12:00:00?)  // 01 AM to 11 AM
							
							$Label:=$AMLabel
							$hours:=Int:C8($pickerTime/3600)
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($pickerTime<?13:00:00?)
							
							$Label:=$PMLabel
							$hours:=12  // 12 PM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($pickerTime<?24:00:00?)
							
							$Label:=$PMLabel
							$hours:=Int:C8(($pickerTime-?12:00:00?)/3600)
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($pickerTime>=?24:00:00?)
							
							$Label:=$AMLabel
							$hours:=12  // 12 AM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
					End case 
					
					var $minutes : Integer:=Int:C8(($pickerTime%3600)\60)
					
					If ($Localisation1#"ja")\
						 & ($Localisation2#"ja")
						
						APPEND TO ARRAY:C911($_TimePickerHours; String:C10($hours; "00")+":"+String:C10($minutes; "00")+" "+$Label)
						
					Else 
						
						APPEND TO ARRAY:C911($_TimePickerHours; $Label+" "+String:C10($hours; "00")+":"+String:C10($minutes; "00"))
						
					End if 
					
					$pickerTime:=$pickerTime+$step
					
				Until ($pickerTime>$maxTime)
			End if 
		End if 
		
		//%W-518.1
		COPY ARRAY:C226($_TimePickerHours; (OBJECT Get pointer:C1124(Object named:K67:5; "Hours"))->)
		//%W+518.1
		
		//________________________________________________________________________________
	: ($NbPopup=2)
		
		If ($step#?00:00:00?)
			
			$pickerTime:=$minTime
			
			// Populate Hours array
			If (Find in array:C230($widgets; "am_pm")=0)
				
				Repeat 
					
					var $time : Integer:=Int:C8($pickerTime/3600)
					APPEND TO ARRAY:C911($_TimePickerHours; String:C10($time; "00"))
					$pickerTime:=$pickerTime+?01:00:00?
					
				Until ($pickerTime>$maxTime)
				
			Else 
				
				Repeat 
					
					$time:=Int:C8($pickerTime/3600)
					
					Case of 
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($time<1)
							
							$Label:=$AMLabel
							$hours:=12  // 12 AM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($time<12)
							
							$Label:=$AMLabel
							$hours:=Int:C8($pickerTime/3600)
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($time<13)
							
							$Label:=$PMLabel
							$hours:=12  // 12 PM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($time<24)
							
							$Label:=$PMLabel
							$hours:=Int:C8($pickerTime/3600)-12
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($time>=24)
							
							$hours:=12  // 12 PM
							$Label:=$AMLabel
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
					End case 
					
					If ($Localisation1#"ja")\
						 & ($Localisation2#"ja")
						
						APPEND TO ARRAY:C911($_TimePickerHours; String:C10($hours; "00")+" "+$Label)
						
					Else 
						
						APPEND TO ARRAY:C911($_TimePickerHours; $Label+" "+String:C10($hours; "00"))
						
					End if 
					
					$pickerTime:=$pickerTime+?01:00:00?
					
				Until ($pickerTime>$maxTime)
			End if 
			
			// Populate Minutes array (common)
			$pickerTime:=?00:00:00?
			
			Repeat 
				
				$time:=Int:C8($pickerTime/60)
				APPEND TO ARRAY:C911($_TimePickerMinutes; String:C10($time; "00"))
				$pickerTime:=$pickerTime+$step
				
			Until ($pickerTime>=?01:00:00?)
		End if 
		
		//%W-518.1
		COPY ARRAY:C226($_TimePickerHours; (OBJECT Get pointer:C1124(Object named:K67:5; "Hours"))->)
		COPY ARRAY:C226($_TimePickerMinutes; (OBJECT Get pointer:C1124(Object named:K67:5; "Minutes"))->)
		//%W+518.1
		
		//________________________________________________________________________________
End case 