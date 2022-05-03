//%attributes = {"invisible":true,"shared":true}
//DatePicker Display Dialog

//ACI0099964

C_LONGINT:C283($1; $2)  //optional parameters for window position
C_DATE:C307($3)  // optional parameter for default date
C_DATE:C307($0)

C_DATE:C307($returnedDate)

C_BOOLEAN:C305($CalcXY)

C_LONGINT:C283($winLeft; $winTop; $winRight; $winBottom)
C_LONGINT:C283($Win)
C_LONGINT:C283($x1; $x2; $y1; $y2)
C_LONGINT:C283($mouseX; $mouseY; $mouseClic)
C_LONGINT:C283($Width; $Height)

C_TEXT:C284($formName)
C_OBJECT:C1216($form)

$formName:="DatePicker"

DatePicker__InitInter

FORM GET PROPERTIES:C674($formName; $Width; $Height)

$CalcXY:=False:C215
If (Count parameters:C259>=2)
	GET WINDOW RECT:C443($x1; $y1; $x2; $y2; Frontmost window:C447)
	If (($1>=0) & ($2>=0))
		$x1:=$x1+$1
		$y1:=$y1+$2
	Else 
		$CalcXY:=True:C214
	End if 
	
	
Else 
	$CalcXY:=True:C214
End if 

If ($CalcXY=True:C214)
	
	If (Is Windows:C1573)
		
		GET WINDOW RECT:C443($winLeft; $winTop; $winRight; $winBottom)  // front most window
		GET MOUSE:C468($mouseX; $mouseY; $mouseClic)  // front most window
		
		$x1:=$mouseX+$winLeft
		$y1:=$mouseY+$winTop
		
	Else   // macintosh
		
		GET MOUSE:C468($mouseX; $mouseY; $mouseClic; *)  // Global system
		$x1:=$mouseX
		$y1:=$mouseY
		
	End if 
	
End if 

Case of 
	: (($x1+$Width)>Screen width:C187)  // Screen on MAC, MDI window on WIN
		$x1:=Screen width:C187-$Width-5
	: ($x1<5)
		$x1:=5
End case 

Case of 
	: (($y1+$Height)>Screen height:C188)
		$y1:=Screen height:C188-$Height-10
	: ($y1<5)
		$y1:=5
End case 


$form:=New object:C1471  //ACI0099621 //ACI0099964
If (Count parameters:C259>=3)
	$form.displayDate:=$3  //ACI0099621
Else 
	$form.displayDate:=<>DatePicker_DefaultDate  // may have been set as default value
End if 


$Win:=Open form window:C675($formName; Pop up form window:K39:11; $x1; $y1)
//Open window($x1;$y1;$x1+$Width;$y1+$Height;Pop up form window)

<>DatePicker_CloseDial:=True:C214  //will close the dial on click on any date
<>DatePicker_ActivateArrows:=True:C214  // will allow the use of arrows (which is not the case when displayed inside a form)
DIALOG:C40($formName; $form)  //ACI0099621 use of form parameter when called as a dialog from another widget
<>DatePicker_CloseDial:=False:C215
<>DatePicker_ActivateArrows:=False:C215

If (ok=1)
	$returnedDate:=$form.displayDate
Else 
	$returnedDate:=!00-00-00!
End if 

$0:=$returnedDate
