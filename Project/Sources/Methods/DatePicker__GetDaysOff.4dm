//%attributes = {"invisible":true}
C_LONGINT:C283($1)  // type of days off (0 = repeated, 1 = only once)
C_POINTER:C301($2)  // pointer on date array
C_TEXT:C284($3)  // form name (if provided)

C_LONGINT:C283($Type)  // type of days off (0 = repeated, 1 = only once)

C_POINTER:C301($ptrArray)  // pointer on date array
C_POINTER:C301($PtrLocalArray)

C_TEXT:C284($Form)  // form name (if provided)

$Type:=$1
$ptrArray:=$2

If (Count parameters:C259>=3)
	$Form:=$3
	
	Case of 
		: ($Type=0)
			$PtrLocalArray:=Self:C308(Object named:K67:5;"_DaysOff1";$Form)
			If (Not:C34(Is nil pointer:C315($PtrLocalArray)))
				COPY ARRAY:C226($PtrLocalArray->;$ptrArray->)
			End if 
		: ($Type=1)
			$PtrLocalArray:=Self:C308(Object named:K67:5;"_DaysOff2";$Form)
			If (Not:C34(Is nil pointer:C315($PtrLocalArray)))
				COPY ARRAY:C226($PtrLocalArray->;$ptrArray->)
			End if 
	End case 
	
Else   //default values
	
	Case of 
		: ($Type=0)
			COPY ARRAY:C226(<>_DatePicker_DaysOff1;$ptrArray->)
		: ($Type=1)
			COPY ARRAY:C226(<>_DatePicker_DaysOff2;$ptrArray->)
	End case 
	
End if 

