//%attributes = {"invisible":true}
#DECLARE($objectName : Text; $time : Time; $blink : Boolean; $mode : Integer; $format : Text)

var $hours : Integer:=$time\3600
$time:=$time-($hours*3600)

var $minuts : Integer:=$time\60
$time:=$time-($minuts*60)

var $seconds : Integer:=$time+0

If ($format="true")
	
	If ($hours<12)
		
		$AmPm:="AM"
		
	Else 
		
		$AmPm:="PM"
		
	End if 
	
Else 
	
	var $AmPm : Text
	
End if 

If ($mode=12)
	
	Case of 
			
			//________________________________________________________________________________
		: ($hours=0)
			
			$hours:=12
			
			//________________________________________________________________________________
		: ($hours>12)
			
			$hours:=$hours-12
			
			//________________________________________________________________________________
	End case 
End if 

var $time_t : Text:=String:C10($hours; "00")+String:C10($minuts; "00")+String:C10($seconds; "00")+$AmPm

//0 : ABCDEF
//1 : BC
//2 : ABEDG
//3 : ABGCD
//4 : FGBC
//5 : AFGCD
//6 : AFEDCG
//7 : ABC
//8 : ABCDEFG
//9 : FABGCD
//10 : EFABC (A)
//11 : EFABG (P)
//12 : EFABCH (M)

ARRAY LONGINT:C221($Decoder; 12; 8)

$Decoder{0}{1}:=1
$Decoder{0}{2}:=1
$Decoder{0}{3}:=1
$Decoder{0}{4}:=1
$Decoder{0}{5}:=1
$Decoder{0}{6}:=1
$Decoder{0}{7}:=0
$Decoder{0}{8}:=0

$Decoder{1}{1}:=0
$Decoder{1}{2}:=1
$Decoder{1}{3}:=1
$Decoder{1}{4}:=0
$Decoder{1}{5}:=0
$Decoder{1}{6}:=0
$Decoder{1}{7}:=0
$Decoder{1}{8}:=0

$Decoder{2}{1}:=1
$Decoder{2}{2}:=1
$Decoder{2}{3}:=0
$Decoder{2}{4}:=1
$Decoder{2}{5}:=1
$Decoder{2}{6}:=0
$Decoder{2}{7}:=1
$Decoder{2}{8}:=0

$Decoder{3}{1}:=1
$Decoder{3}{2}:=1
$Decoder{3}{3}:=1
$Decoder{3}{4}:=1
$Decoder{3}{5}:=0
$Decoder{3}{6}:=0
$Decoder{3}{7}:=1
$Decoder{3}{8}:=0

$Decoder{4}{1}:=0
$Decoder{4}{2}:=1
$Decoder{4}{3}:=1
$Decoder{4}{4}:=0
$Decoder{4}{5}:=0
$Decoder{4}{6}:=1
$Decoder{4}{7}:=1
$Decoder{4}{8}:=0

$Decoder{5}{1}:=1
$Decoder{5}{2}:=0
$Decoder{5}{3}:=1
$Decoder{5}{4}:=1
$Decoder{5}{5}:=0
$Decoder{5}{6}:=1
$Decoder{5}{7}:=1
$Decoder{5}{8}:=0

$Decoder{6}{1}:=1
$Decoder{6}{2}:=0
$Decoder{6}{3}:=1
$Decoder{6}{4}:=1
$Decoder{6}{5}:=1
$Decoder{6}{6}:=1
$Decoder{6}{7}:=1
$Decoder{6}{8}:=0

$Decoder{7}{1}:=1
$Decoder{7}{2}:=1
$Decoder{7}{3}:=1
$Decoder{7}{4}:=0
$Decoder{7}{5}:=0
$Decoder{7}{6}:=0
$Decoder{7}{7}:=0
$Decoder{7}{8}:=0

$Decoder{8}{1}:=1
$Decoder{8}{2}:=1
$Decoder{8}{3}:=1
$Decoder{8}{4}:=1
$Decoder{8}{5}:=1
$Decoder{8}{6}:=1
$Decoder{8}{7}:=1
$Decoder{8}{8}:=0

$Decoder{9}{1}:=1
$Decoder{9}{2}:=1
$Decoder{9}{3}:=1
$Decoder{9}{4}:=1
$Decoder{9}{5}:=0
$Decoder{9}{6}:=1
$Decoder{9}{7}:=1
$Decoder{9}{8}:=0

$Decoder{10}{1}:=1  // A
$Decoder{10}{2}:=1
$Decoder{10}{3}:=1
$Decoder{10}{4}:=0
$Decoder{10}{5}:=1
$Decoder{10}{6}:=1
$Decoder{10}{7}:=1
$Decoder{10}{8}:=0

$Decoder{11}{1}:=1  // P
$Decoder{11}{2}:=1
$Decoder{11}{3}:=0
$Decoder{11}{4}:=0
$Decoder{11}{5}:=1
$Decoder{11}{6}:=1
$Decoder{11}{7}:=1
$Decoder{11}{8}:=0

$Decoder{12}{1}:=1  // M
$Decoder{12}{2}:=1
$Decoder{12}{3}:=1
$Decoder{12}{4}:=0
$Decoder{12}{5}:=1
$Decoder{12}{6}:=1
$Decoder{12}{7}:=0
$Decoder{12}{8}:=1


var $digit : Integer
For ($digit; 1; Length:C16($time_t); 1)
	
	var $Value_t : Text:=$time_t[[$digit]]
	
	Case of 
			
			//________________________________________________________________________________
		: ($Value_t>="0")\
			 & ($Value_t<="9")
			
			var $index : Integer:=Num:C11($Value_t)
			
			//________________________________________________________________________________
		: ($Value_t="A")
			
			$index:=10
			
			//________________________________________________________________________________
		: ($Value_t="P")
			
			$index:=11
			
			//________________________________________________________________________________
		: ($Value_t="M")
			
			$index:=12
			
			//________________________________________________________________________________
	End case 
	
	var $segment : Integer
	For ($segment; 1; 8; 1)
		
		var $id : Text:="dig"+String:C10($digit)+"_seg"+Char:C90(Character code:C91("A")+$segment-1)
		
		If ($Decoder{$index}{$segment}=1)
			
			SVG SET ATTRIBUTE:C1055(*; $objectName; $id; "fill-opacity"; "1")
			SVG SET ATTRIBUTE:C1055(*; $objectName; $id; "stroke-opacity"; "1")
			
		Else 
			
			If ($segment#8)  // Barre vertical du M (exception)
				
				SVG SET ATTRIBUTE:C1055(*; $objectName; $id; "fill-opacity"; "0.05")
				SVG SET ATTRIBUTE:C1055(*; $objectName; $id; "stroke-opacity"; "0.05")
				
			Else 
				
				SVG SET ATTRIBUTE:C1055(*; $objectName; $id; "fill-opacity"; "0")
				SVG SET ATTRIBUTE:C1055(*; $objectName; $id; "stroke-opacity"; "0")
				
			End if 
		End if 
	End for 
End for 

If (((Milliseconds:C459%1000)>500)\
 | (Not:C34($blink)))
	
	SVG SET ATTRIBUTE:C1055(*; $objectName; "blink"; "fill-opacity"; "1")
	SVG SET ATTRIBUTE:C1055(*; $objectName; "blink"; "stroke-opacity"; "1")
	
Else 
	
	SVG SET ATTRIBUTE:C1055(*; $objectName; "blink"; "fill-opacity"; "0.05")
	SVG SET ATTRIBUTE:C1055(*; $objectName; "blink"; "stroke-opacity"; "0.05")
	
End if 