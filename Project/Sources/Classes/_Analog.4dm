Class extends _widget

property withSeconds:=True:C214
property withAMPM:=True:C214
property mode : Integer:=12
property redraw : Boolean
property autorun : Boolean
property color:=""
property offset : Time
property currentTime : Time
property clock : Picture

// === === === === === === === === === === === === === === === === === === === === === === === === 
Class constructor
	
	Super:C1705()
	
	This:C1470.widget:="gClock"
	
	This:C1470.getTime()
	
	// === === === === === === === === === === === === === === === === === === === === === === === === 
Function getTime()
	
	var $variant:=OBJECT Get subform container value:C1785
	var $type:=Value type:C1509($variant)
	
	Case of 
			
			//----------------------------------
		: ($type=Is longint:K8:6)\
			 || ($type=Is real:K8:4)\
			 || ($variant=Null:C1517)
			
			This:C1470.autorun:=True:C214
			
			This:C1470.offset:=$variant#Null:C1517 ? $variant : ?00:00:00?
			This:C1470.currentTime:=Current time:C178+This:C1470.offset
			This:C1470.currentTime:=This:C1470.currentTime>?24:00:00? ? This:C1470.currentTime-?24:00:00? : This:C1470.currentTime
			
			//----------------------------------
		: ($type=Is time:K8:8)
			
			This:C1470.currentTime:=$variant
			
			//----------------------------------
		Else   // Any other type will TRY to provide a STATIC clock
			
			This:C1470.currentTime:=Time:C179(String:C10($variant))
			
			//----------------------------------
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === === 
Function getClock() : Picture
	
	var $file:=File:C1566("/RESOURCES/clockLCD.svg"; *)
	
	If ($file.exists)  // User clock
		
		var $pict : Picture
		READ PICTURE FILE:C678($file.platformPath; $pict)
		This:C1470.clock:=$pict
		
	Else 
		
		This:C1470.clock:=This:C1470.draw()
		
	End if 
	
	return This:C1470.clock
	
	// === === === === === === === === === === === === === === === === === === === === === === === === 
Function draw() : Picture
	
	If (Not:C34(Is compiled mode:C492))
		
		SVG_SET_OPTIONS(SVG_Get_options ?+ 5)
		
	End if 
	
	Case of 
			
			// ________________________________________________________________________________
		: (This:C1470.withSeconds & This:C1470.withAMPM)
			
			var $Dom_svg : Text:=SVG_New(1280; 240)
			
			// ________________________________________________________________________________
		: (This:C1470.withSeconds | This:C1470.withAMPM)
			
			$Dom_svg:=SVG_New(960; 240)
			
			// ________________________________________________________________________________
		Else 
			
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
		: (This:C1470.withSeconds & This:C1470.withAMPM)
			
			SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{3}; 40+640; 20)  // Sec
			SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{4}; 40+960+50; 60)  // AMPM
			SVG_SET_TRANSFORM_SCALE($_dualDigitRef{4}; 0.6; 0.6)
			
			//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
		: (This:C1470.withSeconds)  // Seconds but no AMPM
			
			SVG_SET_TRANSFORM_TRANSLATE($_dualDigitRef{3}; 40+640; 20)
			SVG_SET_VISIBILITY($_dualDigitRef{4}; False:C215)  // No AMPM
			
			//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
		: (This:C1470.withAMPM)  // No Seconds but AMPM
			
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
	
	If (This:C1470.withSeconds)
		
		SVG_Use($blinkRef; "BlinkSegment"; 630; 80; 20; 20)
		SVG_Use($blinkRef; "BlinkSegment"; 630; 140; 20; 20)
		
	End if 
	
	var $pict : Picture
	SVG EXPORT TO PICTURE:C1017($Dom_svg; $pict; Own XML data source:K45:18)
	
	return $pict
	
	// === === === === === === === === === === === === === === === === === === === === === === === === 
Function update()
	
	This:C1470.resize()
	
	If (This:C1470.redraw)
		
		If (This:C1470.color="")
			
			var $attribute : Text
			SVG GET ATTRIBUTE:C1056(*; This:C1470.widget; "globalClock"; "fill"; $attribute)
			This:C1470.color:=$attribute
			
		End if 
		
		OBJECT SET VALUE:C1742("gClock"; Form:C1466.getClock())
		
		This:C1470.redraw:=False:C215
		
	End if 
	
	// Apply display color
	If (This:C1470.color#"")
		
		SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "globalClock"; "fill"; This:C1470.color)
		
	Else 
		
		SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "globalClock"; "fill"; FORM Get color scheme:C1761="dark" ? "white" : "black")
		
	End if 
	
	This:C1470.getTime()
	
	var $time:=This:C1470.currentTime
	
	var $hours : Integer:=$time\3600
	$time:=$time-($hours*3600)
	
	var $minutes : Integer:=$time\60
	$time:=$time-($minutes*60)
	
	var $seconds : Integer:=$time+0
	
	var $AmPm:=This:C1470.withAMPM ? ($hours<12 ? "AM" : "PM") : ""
	
	If (This:C1470.mode=12)
		
		$hours:=$hours=0 ? 12 : ($hours>12 ? $hours-12 : $hours)
		
	End if 
	
/*
 0 : ABCDEF
 1 : BC
 2 : ABEDG
 3 : ABGCD
 4 : FGBC
 5 : AFGCD
 6 : AFEDCG
 7 : ABC
 8 : ABCDEFG
 9 : FABGCD
10 : EFABC (A)
11 : EFABG (P)
/12 : EFABCH (M)
*/
	
	ARRAY LONGINT:C221($decoder; 12; 8)
	
	$decoder{0}{1}:=1
	$decoder{0}{2}:=1
	$decoder{0}{3}:=1
	$decoder{0}{4}:=1
	$decoder{0}{5}:=1
	$decoder{0}{6}:=1
	$decoder{0}{7}:=0
	$decoder{0}{8}:=0
	
	$decoder{1}{1}:=0
	$decoder{1}{2}:=1
	$decoder{1}{3}:=1
	$decoder{1}{4}:=0
	$decoder{1}{5}:=0
	$decoder{1}{6}:=0
	$decoder{1}{7}:=0
	$decoder{1}{8}:=0
	
	$decoder{2}{1}:=1
	$decoder{2}{2}:=1
	$decoder{2}{3}:=0
	$decoder{2}{4}:=1
	$decoder{2}{5}:=1
	$decoder{2}{6}:=0
	$decoder{2}{7}:=1
	$decoder{2}{8}:=0
	
	$decoder{3}{1}:=1
	$decoder{3}{2}:=1
	$decoder{3}{3}:=1
	$decoder{3}{4}:=1
	$decoder{3}{5}:=0
	$decoder{3}{6}:=0
	$decoder{3}{7}:=1
	$decoder{3}{8}:=0
	
	$decoder{4}{1}:=0
	$decoder{4}{2}:=1
	$decoder{4}{3}:=1
	$decoder{4}{4}:=0
	$decoder{4}{5}:=0
	$decoder{4}{6}:=1
	$decoder{4}{7}:=1
	$decoder{4}{8}:=0
	
	$decoder{5}{1}:=1
	$decoder{5}{2}:=0
	$decoder{5}{3}:=1
	$decoder{5}{4}:=1
	$decoder{5}{5}:=0
	$decoder{5}{6}:=1
	$decoder{5}{7}:=1
	$decoder{5}{8}:=0
	
	$decoder{6}{1}:=1
	$decoder{6}{2}:=0
	$decoder{6}{3}:=1
	$decoder{6}{4}:=1
	$decoder{6}{5}:=1
	$decoder{6}{6}:=1
	$decoder{6}{7}:=1
	$decoder{6}{8}:=0
	
	$decoder{7}{1}:=1
	$decoder{7}{2}:=1
	$decoder{7}{3}:=1
	$decoder{7}{4}:=0
	$decoder{7}{5}:=0
	$decoder{7}{6}:=0
	$decoder{7}{7}:=0
	$decoder{7}{8}:=0
	
	$decoder{8}{1}:=1
	$decoder{8}{2}:=1
	$decoder{8}{3}:=1
	$decoder{8}{4}:=1
	$decoder{8}{5}:=1
	$decoder{8}{6}:=1
	$decoder{8}{7}:=1
	$decoder{8}{8}:=0
	
	$decoder{9}{1}:=1
	$decoder{9}{2}:=1
	$decoder{9}{3}:=1
	$decoder{9}{4}:=1
	$decoder{9}{5}:=0
	$decoder{9}{6}:=1
	$decoder{9}{7}:=1
	$decoder{9}{8}:=0
	
	$decoder{10}{1}:=1  // A
	$decoder{10}{2}:=1
	$decoder{10}{3}:=1
	$decoder{10}{4}:=0
	$decoder{10}{5}:=1
	$decoder{10}{6}:=1
	$decoder{10}{7}:=1
	$decoder{10}{8}:=0
	
	$decoder{11}{1}:=1  // P
	$decoder{11}{2}:=1
	$decoder{11}{3}:=0
	$decoder{11}{4}:=0
	$decoder{11}{5}:=1
	$decoder{11}{6}:=1
	$decoder{11}{7}:=1
	$decoder{11}{8}:=0
	
	$decoder{12}{1}:=1  // M
	$decoder{12}{2}:=1
	$decoder{12}{3}:=1
	$decoder{12}{4}:=0
	$decoder{12}{5}:=1
	$decoder{12}{6}:=1
	$decoder{12}{7}:=0
	$decoder{12}{8}:=1
	
	
	var $timeString : Text:=String:C10($hours; "00")+String:C10($minutes; "00")+String:C10($seconds; "00")+$AmPm
	
	var $digit : Integer
	For ($digit; 1; Length:C16($timeString); 1)
		
		var $t : Text:=$timeString[[$digit]]
		var $indx : Integer:=$t="M" ? 12 : $t="P" ? 11 : $t="A" ? 10 : Num:C11($t)
		
		var $segment : Integer
		For ($segment; 1; 8; 1)
			
			var $id : Text:="dig"+String:C10($digit)+"_seg"+Char:C90(Character code:C91("A")+$segment-1)
			
			If ($decoder{$indx}{$segment}=1)
				
				SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; $id; "fill-opacity"; "1")
				SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; $id; "stroke-opacity"; "1")
				
			Else 
				
				If ($segment#8)  // Vertical bar of the M (exception)
					
					SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; $id; "fill-opacity"; "0.05")
					SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; $id; "stroke-opacity"; "0.05")
					
				Else 
					
					SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; $id; "fill-opacity"; "0")
					SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; $id; "stroke-opacity"; "0")
					
				End if 
			End if 
		End for 
	End for 
	
	If (This:C1470.autorun) && (($seconds%2)=0)
		
		SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "blink"; "fill-opacity"; "1")
		SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "blink"; "stroke-opacity"; "1")
		
	Else 
		
		SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "blink"; "fill-opacity"; "0")
		SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "blink"; "stroke-opacity"; "0.05")
		
	End if 
	
	SET TIMER:C645(This:C1470.autorun ? 10 : 0)