//%attributes = {"invisible":true}
  //$PtrSearchMenu:=Object get pointer(Object named ;"SearchMenu")
  //If ($PtrSearchMenu->#"")
  //$Ref:=Dynamic pop up menu($PtrSearchMenu->)
  //If ($Ref#"")

  //  //useless
  //PLATFORM PROPERTIES($PlateForm)
  //If ($PlateForm=Windows ) 
  //$SearchObjectName:="SearchText_Win"
  //$SearchClose:="CloseButton_Mac"
  //Else   //macintosh
  //$SearchObjectName:="SearchText_Mac"
  //$SearchClose:="CloseButton_Mac"
  //End if 
  //$PtrSearchText:=Object get pointer(Object named ;$SearchObjectName)
  //  // \useless


  //ARRAY POINTER($_ParentParameters;0)
  //SearchPicker__GetParentParams (->$_ParentParameters)
  //$n:=Size of array($_ParentParameters)
  //If ($n>=4)
  //$SearchPicker_UserArrayPtr:=$_ParentParameters{4}
  //  // the sent array MUST still exist
  //If (Not(Nil($SearchPicker_UserArrayPtr)))
  //$n:=Find in array($SearchPicker_UserArrayPtr->;$Ref)

  //If ($n>0)

  //$Mode:=""
  //Tool_ObjectToVar ("SearchMode";->$Mode)

  //Case of 
  //: ($Mode="Scope")
  //: ($Mode="Values")
  //Else 
  //$Mode:="Scope"
  //End case 

  //Case of 
  //: ($Mode="Scope")
  //  // default
  //$SearchPicker_UserArrayPtr->:=$n
  //: ($Mode="Values")
  //  // Values mode
  //SearchPicker__SET_TEXT ($Ref;"")

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
