//%attributes = {"invisible":true}
C_POINTER:C301($1)  // pointer on picture to be filled
C_BOOLEAN:C305($2)  // true : with seconds, false : without seconds
C_BOOLEAN:C305($3)  // true : with AmPm, false : without AmPm

C_BOOLEAN:C305($withSeconds; $withAmPm)
C_TEXT:C284($Dom_svg)
C_TEXT:C284($LCDsegment)
C_POINTER:C301($PtrPict)

C_TEXT:C284($Dom_svg)
C_TEXT:C284($LCDsegment; $BlinkSegment; $Path)
C_TEXT:C284($globalClockRef; $blinkRef)
C_TEXT:C284($segmentA; $segmentB; $segmentC; $segmentD; $segmentE; $segmentF; $segmentG; $segmentH)
C_TEXT:C284($digitRef; $dualDigitRef)

C_LONGINT:C283($digit; $segment)
C_LONGINT:C283($NbDigits)
C_LONGINT:C283($shift)

$withSeconds:=True:C214
$withAmPm:=True:C214

If (Count parameters:C259>0)
	$PtrPict:=$1
	
	If (Count parameters:C259>=2)
		$withSeconds:=$2
		If (Count parameters:C259>=3)
			$withAmPm:=$3
		End if 
	End if 
End if 

SVG_SET_OPTIONS(SVG_Get_options ?+ 5)

Case of 
	: ($withSeconds & $withAmPm)
		$Dom_svg:=SVG_New(1280; 240)
		
	: ($withSeconds | $withAmPm)
		$Dom_svg:=SVG_New(960; 240)
		
	: (True:C214)
		$Dom_svg:=SVG_New(640; 240)
		
End case 


$LCDsegment:=SVG_Define_symbol($Dom_svg; "LCDsegmentH")  //;0;0;80;20)
$Path:=SVG_New_path($LCDsegment; 0; 10; ""; "")
SVG_PATH_LINE_TO($Path; 10; 0; 70; 0; 80; 10; 70; 20; 10; 20)
SVG_PATH_CLOSE($Path)

$LCDsegment:=SVG_Define_symbol($Dom_svg; "LCDsegmentV")  //;0;0;20;90)
$Path:=SVG_New_path($LCDsegment; 10; 0; ""; "")
SVG_PATH_LINE_TO($Path; 20; 10; 20; 80; 10; 90; 0; 80; 0; 10)
SVG_PATH_CLOSE($Path)

$BlinkSegment:=SVG_Define_symbol($Dom_svg; "BlinkSegment"; 0; 0; 20; 20)
$Path:=SVG_New_path($BlinkSegment; 0; 10; ""; "")
SVG_PATH_LINE_TO($Path; 10; 0; 20; 10; 10; 20)
SVG_PATH_CLOSE($Path)

$globalClockRef:=SVG_New_group($Dom_svg)
SVG_SET_ID($globalClockRef; "globalClock")
SVG_SET_FILL_BRUSH($globalClockRef; "rgb(10,10,10)")
SVG_SET_STROKE_BRUSH($globalClockRef; "rgb(50,50,50)")  //"rgb(20,20,20)")
SVG_SET_STROKE_WIDTH($globalClockRef; 1)

ARRAY TEXT:C222($_dualDigitRef; 4)

$NbDigits:=8  // always
For ($digit; 1; $NbDigits)
	
	If (($digit%2)=1)
		
		$dualDigitRef:=SVG_New_group($globalClockRef)
		
		Case of 
			: ($digit=1)
				$_dualDigitRef{1}:=$dualDigitRef
				SVG_SET_ID($dualDigitRef; "HH")
				
			: ($digit=3)
				$_dualDigitRef{2}:=$dualDigitRef
				SVG_SET_ID($dualDigitRef; "MM")
				
			: ($digit=5)  // & ($withSeconds)
				$_dualDigitRef{3}:=$dualDigitRef
				SVG_SET_ID($dualDigitRef; "SS")
				
			: ($digit=7)
				$_dualDigitRef{4}:=$dualDigitRef
				SVG_SET_ID($dualDigitRef; "AM")
				
		End case 
		
		$shift:=0
		
	Else 
		
		$shift:=$shift+140
		
	End if 
	
	$digitRef:=SVG_New_group($dualDigitRef)
	SVG_SET_ID($digitRef; "digit"+String:C10($digit))
	
	SVG_SET_TRANSFORM_TRANSLATE($digitRef; $shift; 0)  //-(($digit+1)%2)*20))
	
	$segmentA:=SVG_Use($digitRef; "LCDsegmentH"; 10; 0; 80; 20)
	$segmentG:=SVG_Use($digitRef; "LCDsegmentH"; 10; 90; 80; 20)
	$segmentD:=SVG_Use($digitRef; "LCDsegmentH"; 10; 180; 80; 20)
	
	$segmentF:=SVG_Use($digitRef; "LCDsegmentV"; 0; 10; 20; 90)
	$segmentH:=SVG_Use($digitRef; "LCDsegmentV"; 40; 10; 20; 90)
	$segmentB:=SVG_Use($digitRef; "LCDsegmentV"; 80; 10; 20; 90)
	
	$segmentE:=SVG_Use($digitRef; "LCDsegmentV"; 0; 100; 20; 90)
	$segmentC:=SVG_Use($digitRef; "LCDsegmentV"; 80; 100; 20; 90)
	
	ARRAY TEXT:C222($refSeg; 8)
	$refSeg{1}:=$segmentA
	$refSeg{2}:=$segmentB
	$refSeg{3}:=$segmentC
	$refSeg{4}:=$segmentD
	$refSeg{5}:=$segmentE
	$refSeg{6}:=$segmentF
	$refSeg{7}:=$segmentG
	$refSeg{8}:=$segmentH
	
	For ($segment; 1; 8)
		
		SVG_SET_ID($refSeg{$segment}; "dig"+String:C10($digit)+"_"+"seg"+Char:C90(Character code:C91("A")-1+$segment))
		
	End for 
	
End for 

// 40+0----------40+320----------40+640----------40+960+50

//HH:MM always present

SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{1}; 40+0; 20)
SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{2}; 40+320; 20)

Case of 
		
	: ($withSeconds & $withAmPm)
		
		SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{3}; 40+640; 20)  // sec
		//SVG_SET_TRANSFORM_SCALE ($_dualDigitRef{3};0,4;0,6)
		
		SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{4}; 40+960+50; 60)  // AMPM
		SVG_SET_TRANSFORM_SCALE($_dualDigitRef{4}; 0.6; 0.6)
		
		
	: ($withSeconds)  // Seconds but no AMPM
		SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{3}; 40+640; 20)
		
		SVG_SET_VISIBILITY($_dualDigitRef{4}; False:C215)  // no AMPM
		
		
	: ($withAmPm)  // no Seconds but AMPM
		SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{4}; 40+640+50; 60)
		SVG_SET_TRANSFORM_SCALE($_dualDigitRef{4}; 0.6; 0.6)
		
		SVG_SET_VISIBILITY($_dualDigitRef{3}; False:C215)
		
	Else   // no secs, no ampm
		
		SVG_SET_VISIBILITY($_dualDigitRef{3}; False:C215)
		SVG_SET_VISIBILITY($_dualDigitRef{4}; False:C215)
		
End case 

If (True:C214)
	$blinkRef:=SVG_New_group($globalClockRef)
	SVG_SET_ID($blinkRef; "blink")
	SVG_SET_OPACITY($blinkRef; 100; 100)
	
	SVG_Use($blinkRef; "BlinkSegment"; 310; 80; 20; 20)
	SVG_Use($blinkRef; "BlinkSegment"; 310; 140; 20; 20)
	If ($withSeconds)  // | $withAmPm)
		SVG_Use($blinkRef; "BlinkSegment"; 630; 80; 20; 20)
		SVG_Use($blinkRef; "BlinkSegment"; 630; 140; 20; 20)
	End if 
	
End if 

SVG EXPORT TO PICTURE:C1017($Dom_svg; $PtrPict->; Own XML data source:K45:18)
