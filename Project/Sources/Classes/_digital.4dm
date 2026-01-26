Class extends _clock

property withAMPM:=True:C214
property mode : Integer:=12
property color:=""

// === === === === === === === === === === === === === === === === === === === === === === === === 
Class constructor
	
	Super:C1705()
	
	// === === === === === === === === === === === === === === === === === === === === === === === === 
Function getClock() : Picture
	
	var $file:=File:C1566("/RESOURCES/clockLCD.svg"; *)
	
	Case of 
			
			//________________________________________________________________________________
		: ($file.exists)
			
			// User clock
			
			// ______________________________________________________
		: (This:C1470.withSeconds & This:C1470.withAMPM)
			
			$file:=File:C1566("/RESOURCES/LCD full.svg")
			
			// ______________________________________________________
		: (This:C1470.withSeconds)
			
			$file:=File:C1566("/RESOURCES/LCD seconds.svg")
			
			// ______________________________________________________
		: (This:C1470.withAMPM)
			
			$file:=File:C1566("/RESOURCES/LCD ampm.svg")
			
			// ______________________________________________________
		Else 
			
			$file:=File:C1566("/RESOURCES/LCD mini.svg")
			
			// ______________________________________________________
	End case 
	
	return This:C1470.loadClock($file)
	
	// === === === === === === === === === === === === === === === === === === === === === === === === 
Function update()
	
	This:C1470.resize()
	
	If (This:C1470.redraw)
		
		If (This:C1470.color="")
			
			var $attribute : Text
			SVG GET ATTRIBUTE:C1056(*; This:C1470.widget; "globalClock"; "fill"; $attribute)
			This:C1470.color:=$attribute
			
		End if 
		
		OBJECT SET VALUE:C1742(This:C1470.widget; Form:C1466.getClock())
		This:C1470.redraw:=False:C215  // Done
		
	End if 
	
	// MARK: Apply display color
	If (This:C1470.color#"")
		
		SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "globalClock"; "fill"; This:C1470.color)
		
	Else 
		
		SVG SET ATTRIBUTE:C1055(*; This:C1470.widget; "globalClock"; "fill"; FORM Get color scheme:C1761="dark" ? "white" : "black")
		
	End if 
	
	var $o:=This:C1470.getTime()
	var $hours : Integer:=Num:C11($o.hours)
	var $minutes : Integer:=Num:C11($o.minutes)
	var $seconds : Integer:=Num:C11($o.seconds)
	
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