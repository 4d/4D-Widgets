//%attributes = {"invisible":true}
var $1 : Integer  // type of days off (0 = repeated, 1 = only once)
var $2 : Pointer  // pointer on date array
var $3 : Text  // form name (if provided)

var $type : Integer  // type of days off (0 = repeated, 1 = only once)

var $ptrArray : Pointer  // pointer on date array
var $PtrLocalArray : Pointer

var $form : Text  // form name (if provided)

$type:=$1
$ptrArray:=$2

If (Count parameters:C259>=3)
	$form:=$3
	
	Case of 
		: ($type=0)
			$PtrLocalArray:=OBJECT Get pointer:C1124(Object named:K67:5; "_DaysOff1"; $form)
			If (Not:C34(Is nil pointer:C315($PtrLocalArray)))
				//%W-518.1
				COPY ARRAY:C226($PtrLocalArray->; $ptrArray->)
				//%W+518.1
			End if 
		: ($type=1)
			$PtrLocalArray:=OBJECT Get pointer:C1124(Object named:K67:5; "_DaysOff2"; $form)
			If (Not:C34(Is nil pointer:C315($PtrLocalArray)))
				//%W-518.1
				COPY ARRAY:C226($PtrLocalArray->; $ptrArray->)
				//%W+518.1
			End if 
	End case 
	
Else   //default values
	
	Case of 
		: ($type=0)
			//%W-518.1
			COPY ARRAY:C226(<>_DatePicker_DaysOff1; $ptrArray->)
			//%W+518.1
		: ($type=1)
			//%W-518.1
			COPY ARRAY:C226(<>_DatePicker_DaysOff2; $ptrArray->)
			//%W+518.1
	End case 
	
End if 

