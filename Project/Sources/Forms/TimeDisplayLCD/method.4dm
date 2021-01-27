
  // ----------------------------------------------------
  // Form method : clock
  // Created 26/09/08 by vdl
  // ----------------------------------------------------

  // Modified #06-5-2013 by Roland Lannuzel
  // variables renames
  // test of bound variable type
  // added to widgets and picture library

C_BOOLEAN:C305($AutoRun;$blinck)

C_LONGINT:C283($formEvent)
C_LONGINT:C283($width;$height)
C_LONGINT:C283($Type)
C_LONGINT:C283($Timer)

C_TIME:C306($Gmt_Current_Time;$Gmt_offset)

C_TEXT:C284($File_clock)

C_TEXT:C284($attribute)

C_POINTER:C301($Ptr_container)
C_POINTER:C301($PtrSeconds)
C_POINTER:C301($PtrColor)
C_POINTER:C301($ptrPict)
C_POINTER:C301($ptrMode)
C_POINTER:C301($ptrAmPm)
C_POINTER:C301($PtrRebuild)

  // ----------------------------------------------------
  // Initialisations
$formEvent:=Form event code:C388

  // ----------------------------------------------------
Case of 
		
		  //__________________________________________________________________________________
	: ($formEvent=On Load:K2:1)
		
		$ptrPict:=OBJECT Get pointer:C1124(Object named:K67:5;"gClock")
		
		
		$File_clock:=Get 4D folder:C485(Current resources folder:K5:16;*)+"clockLCD.svg"
		
		If (Test path name:C476($File_clock)=Is a document:K24:1) & Not:C34(Shift down:C543)
			READ PICTURE FILE:C678($File_clock;$ptrPict->)
		Else 
			
			$PtrSeconds:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplaySeconds")
			$PtrAmPm:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplayAmPm")
			$PtrSeconds->:="true"
			$PtrAmPm->:="true"
			
			TimePicker__LCDcreatePict ($ptrPict;True:C214;True:C214)  // seconds + AmPm
			
			$ptrMode:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplayMode")
			$ptrMode->:=12
			
			$ptrAmPm:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplayAmPm")
			$ptrAmPm->:="true"
			
		End if 
		
		OBJECT GET SUBFORM CONTAINER SIZE:C1148($width;$height)
		OBJECT MOVE:C664(*;"gClock";1;1;$width-1;$height-1;*)
		
		CALL SUBFORM CONTAINER:C1086((-1)*On Load:K2:1)
		
		SET TIMER:C645(-1)
		
		  //__________________________________________________________________________________
		
	: ($formEvent=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-1)
		
		  //__________________________________________________________________________________
	: ($formEvent=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$Timer:=0
		
		OBJECT GET SUBFORM CONTAINER SIZE:C1148($width;$height)
		OBJECT MOVE:C664(*;"gClock";1;1;$width-1;$height-1;*)
		
		  // change of display type (with or without seconds, with or without AMPM)
		
		If ($Timer=0)
			
			$PtrRebuild:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdRebuild")
			
			If ($PtrRebuild->#"")
				
				$PtrSeconds:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplaySeconds")
				$PtrAmPm:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplayAmPm")
				
				
				  // before rebuild image we get the color and we save it
				$PtrColor:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplayColor")
				If (Not:C34(Is nil pointer:C315($PtrColor)))
					If ($PtrColor->="")
						  // if there is already something, that means the LCD SET COLOR command has been called just before of juste after TimePicker LCD DISPLAY SECONDS
						  // in this case it's useless to save the current color because it will changed anyway !
						$attribute:=""
						SVG GET ATTRIBUTE:C1056(*;"gClock";"globalClock";"fill";$attribute)
						
						$PtrColor->:=$attribute
					End if 
				End if 
				
				  // Then the image can be rebuilt !!!
				$ptrPict:=OBJECT Get pointer:C1124(Object named:K67:5;"gClock")
				
				TimePicker__LCDcreatePict ($ptrPict;(($PtrSeconds->)="true");(($PtrAmPm->)="true"))
				
				$PtrRebuild->:=""
				
				$Timer:=-1  // in case there is something else
			End if 
			
		End if 
		
		
		  // change display color 
		If ($Timer=0)
			$PtrColor:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplayColor")
			If (Not:C34(Is nil pointer:C315($PtrColor)))
				If ($PtrColor->#"")
					SVG SET ATTRIBUTE:C1055(*;"gClock";"globalClock";"fill";$PtrColor->)
					$PtrColor->:=""
					$Timer:=-1  // in case there is something else
				End if 
			End if 
		End if 
		
		
		If ($Timer=0)
			$Ptr_container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
			
			If (Not:C34(Is nil pointer:C315($Ptr_container)))
				$Type:=Type:C295($Ptr_container->)
				
				Case of 
						
					: ($Type=Is time:K8:8)
						
						$AutoRun:=False:C215
						$Gmt_Current_Time:=$Ptr_container->
						$blinck:=False:C215
						
					: ($type=Is longint:K8:6) | ($type=Is real:K8:4)
						
						$AutoRun:=True:C214
						
						$Gmt_offset:=$Ptr_container->
						$Gmt_Current_Time:=Current time:C178+$Gmt_offset
						$Gmt_Current_Time:=Choose:C955($Gmt_Current_Time>?24:00:00?;$Gmt_Current_Time-?24:00:00?;$Gmt_Current_Time)
						$blinck:=True:C214
						
					: (True:C214)
						
						$AutoRun:=True:C214
						
						$Gmt_offset:=0
						$Gmt_Current_Time:=Current time:C178+$Gmt_offset
						$Gmt_Current_Time:=Choose:C955($Gmt_Current_Time>?24:00:00?;$Gmt_Current_Time-?24:00:00?;$Gmt_Current_Time)
						$blinck:=True:C214
						
				End case 
				
				$ptrAmPm:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplayAmPm")
				$ptrMode:=OBJECT Get pointer:C1124(Object named:K67:5;"lcdDisplayMode")
				
				TimePicker__LCDdisplayTime ("gClock";$Gmt_Current_Time;$Blinck;$ptrMode->;$ptrAmPm->)
				
				If ($AutoRun=True:C214)
					$Timer:=10  // 6 X PER SECOND
				End if 
				
			End if 
			
		End if 
		
		SET TIMER:C645($Timer)  // maybe zero
		
		  //__________________________________________________________________________________
End case 