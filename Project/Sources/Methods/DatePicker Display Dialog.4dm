//%attributes = {"invisible":true,"shared":true}
//DatePicker Display Dialog

//ACI0099964

var $1; $2 : Integer  //optional parameters for window position
var $3 : Date  // optional parameter for default date
var $0 : Date

var $returnedDate : Date

var $CalcXY : Boolean

var $winLeft; $winTop; $winRight; $winBottom : Integer
var $Win : Integer
var $x1; $x2; $y1; $y2 : Integer
var $mouseX; $mouseY; $mouseClic : Integer
var $Width; $Height : Integer

var $formName : Text
var $form : Object

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
		MOUSE POSITION:C468($mouseX; $mouseY; $mouseClic)  // front most window
		
		$x1:=$mouseX+$winLeft
		$y1:=$mouseY+$winTop
		
	Else   // macintosh
		
		MOUSE POSITION:C468($mouseX; $mouseY; $mouseClic; *)  // Global system
		$x1:=$mouseX
		$y1:=$mouseY
		
	End if 
	
End if 

Tool_AdjustWindowPos(->$x1; ->$y1; $Width; $Height)

$form:=New object:C1471  //ACI0099621 //ACI0099964
If (Count parameters:C259>=3)
	$form.displayDate:=$3  //ACI0099621
Else 
	$form.displayDate:=<>DatePicker_DefaultDate  // may have been set as default value
End if 


$Win:=Open form window:C675($formName; Pop up form window:K39:11; $x1; $y1)
//Open window($x1;$y1;$x1+$Width;$y1+$Height;Pop up form window)

//<>DatePicker_CloseDial:=True  //will close the dial on click on any date
//<>DatePicker_ActivateArrows:=True  // will allow the use of arrows (which is not the case when displayed inside a form)
DIALOG:C40($formName; $form)  //ACI0099621 use of form parameter when called as a dialog from another widget
//<>DatePicker_CloseDial:=False
//<>DatePicker_ActivateArrows:=False

If (ok=1)
	
	$returnedDate:=$form.displayDate
	
	//mark:ACI0105847
	<>DatePicker_DefaultDate:=$returnedDate
	
Else 
	
	$returnedDate:=!00-00-00!
	
End if 

$0:=$returnedDate
