//%attributes = {"invisible":true}
#DECLARE($PtrPict : Pointer; $withSeconds : Boolean; $withAmPm : Boolean)

$withSeconds:=Count parameters:C259>=2 ? $withSeconds : True:C214
$withAmPm:=Count parameters:C259>=3 ? $withAmPm : True:C214

SVG_SET_OPTIONS(SVG_Get_options ?+ 5)

Case of 
		
		// ________________________________________________________________________________
	: ($withSeconds & $withAmPm)
		
		var $Dom_svg : Text:=SVG_New(1280; 240)
		
		// ________________________________________________________________________________
	: ($withSeconds | $withAmPm)
		
		$Dom_svg:=SVG_New(960; 240)
		
		// ________________________________________________________________________________
	: (True:C214)
		
		$Dom_svg:=SVG_New(640; 240)
		
		// ________________________________________________________________________________
End case 

var $LCDsegment : Text:=SVG_Define_symbol($Dom_svg; "LCDsegmentH")  // ;0;0;80;20)
var $Path : Text:=SVG_New_path($LCDsegment; 0; 10; ""; "")
SVG_PATH_LINE_TO($Path; 10; 0; 70; 0; 80; 10; 70; 20; 10; 20)
SVG_PATH_CLOSE($Path)

$LCDsegment:=SVG_Define_symbol($Dom_svg; "LCDsegmentV")  // ;0;0;20;90)
$Path:=SVG_New_path($LCDsegment; 10; 0; ""; "")
SVG_PATH_LINE_TO($Path; 20; 10; 20; 80; 10; 90; 0; 80; 0; 10)
SVG_PATH_CLOSE($Path)

var $BlinkSegment : Text:=SVG_Define_symbol($Dom_svg; "BlinkSegment"; 0; 0; 20; 20)
$Path:=SVG_New_path($BlinkSegment; 0; 10; ""; "")
SVG_PATH_LINE_TO($Path; 10; 0; 20; 10; 10; 20)
SVG_PATH_CLOSE($Path)

var $globalClockRef : Text:=SVG_New_group($Dom_svg)
SVG_SET_ID($globalClockRef; "globalClock")
SVG_SET_FILL_BRUSH($globalClockRef; "rgb(10,10,10)")
SVG_SET_STROKE_BRUSH($globalClockRef; "rgb(50,50,50)")  // "rgb(20,20,20)")
SVG_SET_STROKE_WIDTH($globalClockRef; 1)

ARRAY TEXT:C222($_dualDigitRef; 4)
var $digit; $shift : Integer
For ($digit; 1; 8; 1)
	
	If (($digit%2)=1)
		
		var $dualDigitRef : Text:=SVG_New_group($globalClockRef)
		
		Case of 
				
				// ________________________________________________________________________________
			: ($digit=1)
				
				$_dualDigitRef{1}:=$dualDigitRef
				SVG_SET_ID($dualDigitRef; "HH")
				
				// ________________________________________________________________________________
			: ($digit=3)
				
				$_dualDigitRef{2}:=$dualDigitRef
				SVG_SET_ID($dualDigitRef; "MM")
				
				// ________________________________________________________________________________
			: ($digit=5)  // & ($withSeconds)
				
				$_dualDigitRef{3}:=$dualDigitRef
				SVG_SET_ID($dualDigitRef; "SS")
				
				// ________________________________________________________________________________
			: ($digit=7)
				
				$_dualDigitRef{4}:=$dualDigitRef
				SVG_SET_ID($dualDigitRef; "AM")
				
				// ________________________________________________________________________________
		End case 
		
		$shift:=0
		
	Else 
		
		$shift+=140
		
	End if 
	
	var $digitRef : Text:=SVG_New_group($dualDigitRef)
	SVG_SET_ID($digitRef; "digit"+String:C10($digit))
	SVG_SET_TRANSFORM_TRANSLATE($digitRef; $shift; 0)
	
	ARRAY TEXT:C222($refSeg; 8)
	$refSeg{1}:=SVG_Use($digitRef; "LCDsegmentH"; 10; 0; 80; 20)
	$refSeg{2}:=SVG_Use($digitRef; "LCDsegmentV"; 80; 10; 20; 90)
	$refSeg{3}:=SVG_Use($digitRef; "LCDsegmentV"; 80; 100; 20; 90)
	$refSeg{4}:=SVG_Use($digitRef; "LCDsegmentH"; 10; 180; 80; 20)
	$refSeg{5}:=SVG_Use($digitRef; "LCDsegmentV"; 0; 100; 20; 90)
	$refSeg{6}:=SVG_Use($digitRef; "LCDsegmentV"; 0; 10; 20; 90)
	$refSeg{7}:=SVG_Use($digitRef; "LCDsegmentH"; 10; 90; 80; 20)
	$refSeg{8}:=SVG_Use($digitRef; "LCDsegmentV"; 40; 10; 20; 90)
	
	var $segment : Integer
	For ($segment; 1; 8; 1)
		
		SVG_SET_ID($refSeg{$segment}; "dig"+String:C10($digit)+"_"+"seg"+Char:C90(Character code:C91("A")-1+$segment))
		
	End for 
End for 

// HH:MM always present
SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{1}; 40+0; 20)
SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{2}; 40+320; 20)

Case of 
		
		//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
	: ($withSeconds & $withAmPm)
		
		SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{3}; 40+640; 20)  // Sec
		SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{4}; 40+960+50; 60)  // AMPM
		SVG_SET_TRANSFORM_SCALE($_dualDigitRef{4}; 0.6; 0.6)
		
		//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
	: ($withSeconds)  // Seconds but no AMPM
		
		SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{3}; 40+640; 20)
		SVG_SET_VISIBILITY($_dualDigitRef{4}; False:C215)  // No AMPM
		
		//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
	: ($withAmPm)  // No Seconds but AMPM
		
		SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{4}; 40+640+50; 60)
		SVG_SET_TRANSFORM_SCALE($_dualDigitRef{4}; 0.6; 0.6)
		SVG_SET_VISIBILITY($_dualDigitRef{3}; False:C215)
		
		//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
	Else   // No secs, no ampm
		
		SVG_SET_VISIBILITY($_dualDigitRef{3}; False:C215)
		SVG_SET_VISIBILITY($_dualDigitRef{4}; False:C215)
		
		//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
End case 

var $blinkRef : Text:=SVG_New_group($globalClockRef)
SVG_SET_ID($blinkRef; "blink")
SVG_SET_OPACITY($blinkRef; 100; 100)

SVG_Use($blinkRef; "BlinkSegment"; 310; 80; 20; 20)
SVG_Use($blinkRef; "BlinkSegment"; 310; 140; 20; 20)

If ($withSeconds)
	
	SVG_Use($blinkRef; "BlinkSegment"; 630; 80; 20; 20)
	SVG_Use($blinkRef; "BlinkSegment"; 630; 140; 20; 20)
	
End if 

SVG EXPORT TO PICTURE:C1017($Dom_svg; $PtrPict->; Own XML data source:K45:18)