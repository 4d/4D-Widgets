//%attributes = {"invisible":true}
  //
C_BOOLEAN:C305(<>SearchPicher_DefaultInited)
  //

  //  //this part will NOT be "deinited" or reset automatically
  //
If (Not:C34(<>SearchPicher_DefaultInited))
	
	<>SearchPicher_DefaultInited:=True:C214
	
	C_TEXT:C284(<>SearchPicker_SearchText)
	C_TEXT:C284(<>SearchPicker_PopupFunction)
	
	C_TEXT:C284(<>SearchPicker_Menu)
	
	<>SearchPicker_SearchText:=""
	<>SearchPicker_PopupFunction:="Scope"  //(or "Values")
	
	RELEASE MENU:C978(<>SearchPicker_Menu)
	<>SearchPicker_Menu:=""
	
	C_TEXT:C284(<>SearchPicker_DummyText)
	C_POINTER:C301(<>SearchPicker_Target)
	<>SearchPicker_Target:=-><>SearchPicker_DummyText
	
End if 