C_POINTER:C301($target)
C_TIME:C306($CurrentTime)
C_TEXT:C284($localisation1; $localisation2)
C_LONGINT:C283($i; $n)
C_LONGINT:C283($x1; $y1; $x2; $y2; $width; $start)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		CALL SUBFORM CONTAINER:C1086(On Load:K2:1*(-1))  //usefull when the widget is not in page 1 of the main form
		
		TimePicker__InitInter
		TimePicker__InitForm
		
		// objects order
		
		$Localisation1:=Get database localization:C1009(User system localization:K5:23)
		$Localisation2:=Get database localization:C1009(Current localization:K5:22)
		
		If ($Localisation1="ja") | ($Localisation2="ja")  // special settings for japaneese
			// reorder objects
			ARRAY TEXT:C222($_objectNames; 0)
			APPEND TO ARRAY:C911($_objectNames; "AmPmEntry")
			APPEND TO ARRAY:C911($_objectNames; "HoursEntry")
			APPEND TO ARRAY:C911($_objectNames; "Separator1")
			APPEND TO ARRAY:C911($_objectNames; "MinutsEntry")
			APPEND TO ARRAY:C911($_objectNames; "Separator2")
			APPEND TO ARRAY:C911($_objectNames; "SecondsEntry")
			
			$n:=Size of array:C274($_objectNames)
			OBJECT GET COORDINATES:C663(*; "FocusRingBackGround"; $x1; $y1; $x2; $y2)
			$start:=$x1
			For ($i; 1; $n)
				OBJECT GET COORDINATES:C663(*; $_objectNames{$i}; $x1; $y1; $x2; $y2)
				$width:=$x2-$x1
				OBJECT MOVE:C664(*; $_objectNames{$i}; $start; $y1; $start+$width; $y2; *)
				$start:=$start+$width
			End for 
		End if 
		
		$CurrentTime:=TimePicker__GetTarget
		$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime; "")
		TimePicker__DisplayTimeInputs(False:C215)
		
		OBJECT SET FOCUS RECTANGLE INVISIBLE:C1177(*; "@"; True:C214)
		
	: (Form event code:C388=On Activate:K2:9) | (Form event code:C388=On Deactivate:K2:10)
		
		TimeEntry__ManageFocus(Form event code:C388)
		
	: (Form event code:C388=On Bound Variable Change:K2:52)
		
		$CurrentTime:=TimePicker__GetTarget
		$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime; "")
		TimePicker__DisplayTimeInputs(False:C215)
		
End case 

