
// ----------------------------------------------------
// Form method : clock
// Created 26/09/08 by vdl
// ----------------------------------------------------

// Modified #06-5-2013 by Roland Lannuzel
// variables renames
// test of bound variable type
// added to widgets and picture library

var $AutoRun; $blinck; $ok : Boolean

var $formEvent : Integer
var $width; $height : Integer
var $type : Integer
var $timer : Integer

var $Gmt_Current_Time; $Gmt_offset : Time

var $File_clock : Text

var $attribute : Text

var $Ptr_container : Pointer
var $PtrSeconds : Pointer
var $PtrColor : Pointer
var $ptrPict : Pointer
var $ptrMode : Pointer
var $ptrAmPm : Pointer
var $PtrRebuild : Pointer

var $variant

// ----------------------------------------------------
// Initialisations
$formEvent:=Form event code:C388

// ----------------------------------------------------
Case of 
		
		//__________________________________________________________________________________
	: ($formEvent=On Load:K2:1)
		
		$ptrPict:=OBJECT Get pointer:C1124(Object named:K67:5; "gClock")
		
		
		$File_clock:=Get 4D folder:C485(Current resources folder:K5:16; *)+"clockLCD.svg"
		
		If (Test path name:C476($File_clock)=Is a document:K24:1) & Not:C34(Shift down:C543)
			READ PICTURE FILE:C678($File_clock; $ptrPict->)
		Else 
			
			$PtrSeconds:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplaySeconds")
			$PtrAmPm:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayAmPm")
			$PtrSeconds->:="true"
			$PtrAmPm->:="true"
			
			TimePicker__LCDcreatePict($ptrPict; True:C214; True:C214)  // seconds + AmPm
			
			$ptrMode:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayMode")
			$ptrMode->:=12
			
			$ptrAmPm:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayAmPm")
			$ptrAmPm->:="true"
			
		End if 
		
		OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
		OBJECT MOVE:C664(*; "gClock"; 1; 1; $width-1; $height-1; *)
		
		CALL SUBFORM CONTAINER:C1086((-1)*On Load:K2:1)
		
		SET TIMER:C645(-1)
		
		//__________________________________________________________________________________
		
	: ($formEvent=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-1)
		
		//__________________________________________________________________________________
	: ($formEvent=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		$timer:=0
		
		OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
		OBJECT MOVE:C664(*; "gClock"; 1; 1; $width-1; $height-1; *)
		
		// change of display type (with or without seconds, with or without AMPM)
		
		If ($timer=0)
			
			$PtrRebuild:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdRebuild")
			
			If ($PtrRebuild->#"")
				
				$PtrSeconds:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplaySeconds")
				$PtrAmPm:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayAmPm")
				
				
				// before rebuild image we get the color and we save it
				$PtrColor:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayColor")
				If (Not:C34(Is nil pointer:C315($PtrColor)))
					If ($PtrColor->="")
						// if there is already something, that means the LCD SET COLOR command has been called just before of juste after TimePicker LCD DISPLAY SECONDS
						// in this case it's useless to save the current color because it will changed anyway !
						$attribute:=""
						SVG GET ATTRIBUTE:C1056(*; "gClock"; "globalClock"; "fill"; $attribute)
						
						$PtrColor->:=$attribute
					End if 
				End if 
				
				// Then the image can be rebuilt !!!
				$ptrPict:=OBJECT Get pointer:C1124(Object named:K67:5; "gClock")
				
				TimePicker__LCDcreatePict($ptrPict; (($PtrSeconds->)="true"); (($PtrAmPm->)="true"))
				
				$PtrRebuild->:=""
				
				$timer:=-1  // in case there is something else
			End if 
			
		End if 
		
		
		// change display color 
		If ($timer=0)
			$PtrColor:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayColor")
			If (Not:C34(Is nil pointer:C315($PtrColor)))
				If ($PtrColor->#"")
					SVG SET ATTRIBUTE:C1055(*; "gClock"; "globalClock"; "fill"; $PtrColor->)
					$PtrColor->:=""
					$timer:=-1  // in case there is something else
				End if 
			End if 
		End if 
		
		
		If ($timer=0)
			
			$variant:=OBJECT Get subform container value:C1785
			$type:=Value type:C1509($variant)
			
			Case of 
					
				: ($type=Is longint:K8:6) | ($type=Is real:K8:4)
					
					$AutoRun:=True:C214
					
					$Gmt_offset:=$variant
					$Gmt_Current_Time:=Current time:C178+$Gmt_offset
					$Gmt_Current_Time:=Choose:C955($Gmt_Current_Time>?24:00:00?; $Gmt_Current_Time-?24:00:00?; $Gmt_Current_Time)
					$blinck:=True:C214
					
				: ($type=Is time:K8:8)
					
					$AutoRun:=False:C215
					$Gmt_Current_Time:=$variant
					$blinck:=False:C215
					
				: (True:C214)  // any other type will TRY to provide a STATIC clock
					
					$AutoRun:=False:C215
					$Gmt_Current_Time:=Time:C179(String:C10($variant))
					$blinck:=False:C215
					
			End case 
			
			$ptrAmPm:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayAmPm")
			$ptrMode:=OBJECT Get pointer:C1124(Object named:K67:5; "lcdDisplayMode")
			
			TimePicker__LCDdisplayTime("gClock"; $Gmt_Current_Time; $Blinck; $ptrMode->; $ptrAmPm->)
			
			If ($AutoRun=True:C214)
				$timer:=10  // 6 X PER SECOND
			End if 
			
			
		End if 
		
		SET TIMER:C645($timer)  // maybe zero
		
		//__________________________________________________________________________________
End case 