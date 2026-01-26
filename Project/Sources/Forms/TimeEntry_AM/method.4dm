var $e:=FORM Event:C1606

Case of 
		
		//________________________________________________________________________________
	: ($e.code=On Load:K2:1)
		
		Form:C1466.init()
		
		//________________________________________________________________________________
	: ($e.codee=On Bound Variable Change:K2:52)
		
		Form:C1466.update()
		
		//________________________________________________________________________________
	: ($e.code=On Activate:K2:9)\
		 || ($e.code=On Deactivate:K2:10)
		
		Form:C1466.manageFocus($e)
		
		//________________________________________________________________________________
End case 

return 

Case of 
		
		// ________________________________________________________________________________
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  // Usefull when the widget is not in page 1 of the main form
		
		TimePicker__InitInter
		TimePicker__InitForm
		
		// MARK: Special settings for japaneese
		If (Get database localization:C1009(User system localization:K5:23)="ja")\
			 || (Get database localization:C1009(Current localization:K5:22)="ja")
			
			// Reorder objects
			ARRAY TEXT:C222($_objectNames; 0)
			APPEND TO ARRAY:C911($_objectNames; "am_pm")
			APPEND TO ARRAY:C911($_objectNames; "hours")
			APPEND TO ARRAY:C911($_objectNames; "Separator1")
			APPEND TO ARRAY:C911($_objectNames; "minutes")
			APPEND TO ARRAY:C911($_objectNames; "Separator2")
			APPEND TO ARRAY:C911($_objectNames; "seconds")
			
			var $left; $top; $right; $bottom : Integer
			OBJECT GET COORDINATES:C663(*; "FocusRingBackGround"; $left; $top; $right; $bottom)
			var $start:=$left
			
			var $i : Integer
			For ($i; 1; Size of array:C274($_objectNames); 1)
				
				OBJECT GET COORDINATES:C663(*; $_objectNames{$i}; $left; $top; $right; $bottom)
				var $width : Integer:=$right-$left
				OBJECT MOVE:C664(*; $_objectNames{$i}; $start; $top; $start+$width; $bottom; *)
				$start+=$width
				
			End for 
		End if 
		
		var $CurrentTime : Time:=TimePicker__GetTarget
		$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime)
		TimePicker__DisplayTimeInputs(False:C215)
		
		OBJECT SET FOCUS RECTANGLE INVISIBLE:C1177(*; "@"; True:C214)
		
		// ________________________________________________________________________________
	: (Form event code:C388=On Activate:K2:9)\
		 | (Form event code:C388=On Deactivate:K2:10)
		
		TimeEntry__ManageFocus(Form event code:C388)
		
		// ________________________________________________________________________________
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		$CurrentTime:=TimePicker__GetTarget
		$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime)
		TimePicker__DisplayTimeInputs(False:C215)
		
		// ________________________________________________________________________________
End case 