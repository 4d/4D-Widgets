//%attributes = {"invisible":true}
C_BOOLEAN:C305($1)  //true = recalc time from HH MM SS AM  input zones (true by default)

C_BOOLEAN:C305($Recalc)

C_TIME:C306($Time)
C_TIME:C306($MinTime;$MaxTime)

C_LONGINT:C283($Mode)
C_LONGINT:C283($h;$m;$s)

C_POINTER:C301($PtrAmPm;$PtrHours;$PtrMinuts;$PtrSeconds)
C_TEXT:C284($AMlabel;$PMlabel)

If (Count parameters:C259>0)
	$Recalc:=$1
Else 
	$Recalc:=True:C214
End if 

  //----------------- GET POINTERS ON FORM OBJECTS --------------------------------------

$PtrHours:=Self:C308(Object named:K67:5;"HoursEntry")
$PtrMinuts:=Self:C308(Object named:K67:5;"MinutsEntry")
$PtrSeconds:=Self:C308(Object named:K67:5;"SecondsEntry")
$PtrAmPm:=Self:C308(Object named:K67:5;"AmPmEntry")

If (Not:C34(Is nil pointer:C315($PtrHours))) & (Not:C34(Is nil pointer:C315($PtrMinuts))) & (Not:C34(Is nil pointer:C315($PtrSeconds)))
	
	$AMlabel:=""
	$PMlabel:=""
	
	If (Not:C34(Is nil pointer:C315($PtrAmPm)))
		
		$PtrAmPm->:=""
		TimePicker__GetLabelAM (->$AMlabel;"")
		TimePicker__GetLabelPM (->$PMlabel;"")
		
		If ($AMlabel#"") | ($PMlabel#"")  //One or the other must contain something to draw in 12 hours mode
			$Mode:=1
		Else 
			$Mode:=0  //otherwhise draw in 24 hours mode
		End if 
	Else 
		$Mode:=0
	End if 
	
	TimePicker__GetTimeMin (->$MinTime;"")
	TimePicker__GetTimeMax (->$MaxTime;"")
	
	  //----------------- RECALCULATION (OR NOT) OF THE ENTERED DATE --------------------------------------
	
	$Time:=?00:00:00?
	If ($Recalc)
		
		$Time:=(3600*Num:C11($PtrHours->))+(60*Num:C11($PtrMinuts->))+Num:C11($PtrSeconds->)
		If ($Mode=1)  //12:00:00 PM
			If ($PtrAmPm->=$PMlabel) & ($Time<?13:00:00?) & (($Time+(12*3600))<=($MaxTime+0))  //if label = PM
				$Time:=$Time+(12*3600)  //ADD 12 hours to time (11 = 23)
			End if 
		End if 
		
	Else 
		TimePicker__GetSelectedTime (->$Time)
	End if 
	
	  //-------------------- CHECK CONSTRAINTS ------------------------
	
	$Time:=($Time+?24:00:00?)%(24*3600)
	
	Case of 
		: ($Time<$MinTime)
			$Time:=$MinTime
		: ($Time>$MaxTime) & ($MaxTime#?00:00:00?)
			$Time:=$MaxTime
	End case 
	
	  // ---------------------- SETUP INPUT ZONES ----------------------------
	
	$H:=Int:C8($Time/3600)
	$M:=Int:C8(($Time-($H*3600))/60)
	$S:=Int:C8($Time-(3600*$H)-(60*$M))
	
	If ($Mode=0)  // 24 hours mode
		
		$PtrHours->:=String:C10($H;"00")
		
	Else   // 12 hours am/pm mode
		
		Case of 
			: ($H=0)
				$PtrAmPm->:=$AMlabel
				$PtrHours->:="12"
			: ($H<=11)
				$PtrAmPm->:=$AMlabel
				$PtrHours->:=String:C10($H;"00")
			: ($H=12)
				$PtrAmPm->:=$PMlabel
				$PtrHours->:="12"
			: ($H>12)
				$PtrAmPm->:=$PMlabel
				$PtrHours->:=String:C10($H-12;"00")
		End case 
		
	End if 
	
	$PtrMinuts->:=String:C10($M;"00")
	$PtrSeconds->:=String:C10($S;"00")
	
	
	$Time:=TimePicker__SetSelectedTime ($Time;"")
	
	
Else 
	  // Generic call, do nothing
	
End if 
