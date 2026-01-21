//%attributes = {"invisible":true}
//
var <>SearchPicher_DefaultInited : Boolean
//

//  //this part will NOT be "deinited" or reset automatically
//
If (Not:C34(<>SearchPicher_DefaultInited))
	
	<>SearchPicher_DefaultInited:=True:C214
	
	var <>SearchPicker_SearchText : Text
	var <>SearchPicker_PopupFunction : Text
	
	var <>SearchPicker_Menu : Text
	
	<>SearchPicker_SearchText:=""
	<>SearchPicker_PopupFunction:="Scope"  //(or "Values")
	
	RELEASE MENU:C978(<>SearchPicker_Menu)
	<>SearchPicker_Menu:=""
	
	var <>SearchPicker_DummyText : Text
	var <>SearchPicker_Target : Pointer
	<>SearchPicker_Target:=-><>SearchPicker_DummyText
	
End if 