Case of 
		
		// ________________________________________________________________________________
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  // Usefull when the widget is not in page 1 of the main form
		
		TimePicker__InitInter
		TimePicker__InitForm
		
		// Objects order
		var $Localisation1 : Text:=Get database localization:C1009(User system localization:K5:23)
		var $Localisation2 : Text:=Get database localization:C1009(Current localization:K5:22)
		
		If ($Localisation1="ja")\
			 || ($Localisation2="ja")  // Special settings for japaneese
			
			// Reorder objects
			ARRAY TEXT:C222($_objectNames; 0)
			APPEND TO ARRAY:C911($_objectNames; "AmPmEntry")
			APPEND TO ARRAY:C911($_objectNames; "HoursEntry")
			APPEND TO ARRAY:C911($_objectNames; "Separator1")
			APPEND TO ARRAY:C911($_objectNames; "MinutsEntry")
			APPEND TO ARRAY:C911($_objectNames; "Separator2")
			APPEND TO ARRAY:C911($_objectNames; "SecondsEntry")
			
			var $n:=Size of array:C274($_objectNames)
			var $left; $top; $right; $bottom : Integer
			OBJECT GET COORDINATES:C663(*; "FocusRingBackGround"; $left; $top; $right; $bottom)
			var $start:=$left
			
			var $i : Integer
			
			For ($i; 1; $n; 1)
				
				OBJECT GET COORDINATES:C663(*; $_objectNames{$i}; $left; $top; $right; $bottom)
				var $width : Integer:=$right-$left
				OBJECT MOVE:C664(*; $_objectNames{$i}; $start; $top; $start+$width; $bottom; *)
				$start+=$width
				
			End for 
		End if 
		
		var $CurrentTime : Time:=TimePicker__GetTarget
		$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime; "")
		TimePicker__DisplayTimeInputs(False:C215)
		
		OBJECT SET FOCUS RECTANGLE INVISIBLE:C1177(*; "@"; True:C214)
		
		// ________________________________________________________________________________
	: (Form event code:C388=On Activate:K2:9)\
		 | (Form event code:C388=On Deactivate:K2:10)
		
		TimeEntry__ManageFocus(Form event code:C388)
		
		// ________________________________________________________________________________
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		$CurrentTime:=TimePicker__GetTarget
		$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime; "")
		TimePicker__DisplayTimeInputs(False:C215)
		
		// ________________________________________________________________________________
End case 