//%attributes = {"invisible":true}
//$PtrSearchMenu:=Object get pointer(Object named ;"SearchMenu")
//If ($PtrSearchMenu->#"")
//$ref:=Dynamic pop up menu($PtrSearchMenu->)
//If ($ref#"")

//  //useless
//PLATFORM PROPERTIES($PlateForm)
//If ($PlateForm=Windows ) 
//$searchObjectName:="SearchText_Win"
//$searchClose:="CloseButton_Mac"
//Else   //macintosh
//$searchObjectName:="SearchText_Mac"
//$searchClose:="CloseButton_Mac"
//End if 
//$PtrSearchText:=Object get pointer(Object named ;$searchObjectName)
//  // \useless


//ARRAY POINTER($_ParentParameters;0)
//SearchPicker__GetParentParams (->$_ParentParameters)
//$n:=Size of array($_ParentParameters)
//If ($n>=4)
//$searchPicker_UserArrayPtr:=$_ParentParameters{4}
//  // the sent array MUST still exist
//If (Not(Nil($searchPicker_UserArrayPtr)))
//$n:=Find in array($searchPicker_UserArrayPtr->;$ref)

//If ($n>0)

//$mode:=""
//Tool_ObjectToVar ("SearchMode";->$mode)

//Case of 
//: ($mode="Scope")
//: ($mode="Values")
//Else 
//$mode:="Scope"
//End case 

//Case of 
//: ($mode="Scope")
//  // default
//$searchPicker_UserArrayPtr->:=$n
//: ($mode="Values")
//  // Values mode
//SearchPicker__SET_TEXT ($ref;"")

//End case 

//End if 

//Else 
//  //The user array does not exist anymore
//End if 
//Else 
//  //this should NEVER happend (size or array used for params has been changed by user)
//End if 
//End if 
//Else 
//  //impossible en principe
//  //(dans ce cas il n'y a pas de flêche)
//End if 
