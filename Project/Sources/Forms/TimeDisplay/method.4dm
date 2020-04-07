
  // ----------------------------------------------------
  // Form method : clock
  // Created 26/09/08 by vdl
  // ----------------------------------------------------

  // Modified #06-5-2013 by Roland Lannuzel
  // variables renamed
  // test of bound variable type
  // added to widgets and picture library

C_BOOLEAN:C305($AutoRun)

C_LONGINT:C283($formEvent;$i)
C_LONGINT:C283($secondes;$secondAngle)
C_LONGINT:C283($width;$height)
C_LONGINT:C283($Type)
C_LONGINT:C283($Timer)

C_TIME:C306($Gmt_Current_Time;$Gmt_offset)

C_POINTER:C301($Ptr_container)
C_POINTER:C301($PtrRebuild)
C_POINTER:C301($PtrSecondHand)

C_REAL:C285($cx_r;$cy_r)

C_REAL:C285($hours_r;$minutes_r)
C_REAL:C285($hourAngle_r;$minuteAngle_r)


C_TEXT:C284($Dom_node;$Dom_root;$File_clock;$SVG_t)

C_TEXT:C284($attributeFill;$attributeStroke)
C_TEXT:C284($fillColor;$strokeColor)

  // ----------------------------------------------------
  // Initialisations
$formEvent:=Form event code:C388

  // ----------------------------------------------------
Case of 
		
		  //__________________________________________________________________________________
	: ($formEvent=On Load:K2:1)
		
		$File_clock:=Get 4D folder:C485(Current resources folder:K5:16;*)+"clock.svg"
		
		If (Test path name:C476($File_clock)=Is a document:K24:1) & Not:C34(Shift down:C543)
			
			  //User clock
			$Dom_root:=DOM Parse XML source:C719($File_clock)
			
		Else 
			
			$SVG_t:=""
			$SVG_t:=$SVG_t+"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>"
			$SVG_t:=$SVG_t+"<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"400\" width=\"400\" xmlns:d4=\"http://www.4d.com/d4-ns\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">"
			$SVG_t:=$SVG_t+""
			$SVG_t:=$SVG_t+"  <metadata xmlns=\"http://www.4D.com/4DSVG\">"
			$SVG_t:=$SVG_t+"    <generator>4D SVG Component version 13.0 hotfix 3 ©2008-2013 4D SAS.</generator>"
			$SVG_t:=$SVG_t+"    <about>4D SVG is the quintessential vector drawing tool for 4D developers.</about>"
			$SVG_t:=$SVG_t+"    <generation date=\"2013-05-06Z\" system=\"Mac OSX 10.8.3\" time=\"PT11H23M6S\"/>"
			$SVG_t:=$SVG_t+"  </metadata>"
			
			$SVG_t:=$SVG_t+"  <defs id=\"4D\">"
			$SVG_t:=$SVG_t+"    <style type=\"text/css\">text{font-size:28;font-family:'Lucida grande' 'ArialMT';}</style>"
			$SVG_t:=$SVG_t+"    <clipPath id=\"theClip\">"
			$SVG_t:=$SVG_t+"      <circle cx=\"200\" cy=\"200\" fill=\"white\" r=\"186\" stroke=\"black\"/>"
			$SVG_t:=$SVG_t+"    </clipPath>"
			$SVG_t:=$SVG_t+"  </defs>"
			
			$SVG_t:=$SVG_t+"  <g id=\"theClock\">"
			$SVG_t:=$SVG_t+"    <circle cx=\"200\" cy=\"200\" d4:day-fill=\"RGB(200,200,200)\" d4:day-stroke=\"black\" d4:night-fill=\"black\" d4:night-stroke=\"RGB(100,100,100)\" fill=\"RGB(200,200,200)\" id=\"watch-dial\" r=\"190\" stroke=\"black\" stroke-width=\"8\"/>"
			$SVG_t:=$SVG_t+"    <g d4:day-fill=\"black\" d4:night-fill=\"white\" fill=\"black\" id=\"labels\" letter-spacing=\"-1\" stroke=\"black\">"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"273.53557754288\" y=\"66.302445055623\">1</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"335.97923935197\" y=\"128.78631156573\">2</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"357.13445946819\" y=\"207.48450280371\">3</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"333.92031289858\" y=\"289.31730087157\">4</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"274\" y=\"352.1717597601\">5</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"192.14960656356\" y=\"373.79443021319\">6</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"110.52207592924\" y=\"351.78771890908\">7</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"50.178544946613\" y=\"290.70480946443\">8</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"27.658317230128\" y=\"208.92205650466\">9</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"44.807198403374\" y=\"127.02477464532\">10</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"103.02477464532\" y=\"68.807198403374\">11</text>"
			$SVG_t:=$SVG_t+"      <text font-size=\"24\" x=\"185.95582186472\" y=\"45.55179726177\">12</text>"
			$SVG_t:=$SVG_t+"    </g>"
			
			$SVG_t:=$SVG_t+"    <rect d4:cx=\"200\" d4:cy=\"200\" d4:day-fill=\"black\" d4:night-fill=\"white\" fill=\"black\" height=\"115\" id=\"hours-hand\" rx=\"0\" ry=\"0\" stroke=\"black\" width=\"6\" x=\"197\" y=\"180\"/>"
			$SVG_t:=$SVG_t+"    <g d4:cx=\"200\" d4:cy=\"200\" d4:day-fill=\"black\" d4:night-fill=\"white\" fill=\"black\" id=\"minutes-hand\" stroke=\"black\">"
			$SVG_t:=$SVG_t+"      <rect height=\"150\" rx=\"0\" ry=\"0\" width=\"6\" x=\"197\" y=\"180\"/>"
			$SVG_t:=$SVG_t+"      <circle cx=\"200\" cy=\"200\" r=\"10\" stroke-width=\"1\"/>"
			$SVG_t:=$SVG_t+"    </g>"
			$SVG_t:=$SVG_t+"    <g d4:cx=\"200\" d4:cy=\"200\" fill=\"red\" id=\"seconds-hand\" stroke=\"red\" visibility=\"visible\">"
			$SVG_t:=$SVG_t+"      <rect height=\"170\" rx=\"0\" ry=\"0\" width=\"2\" x=\"199\" y=\"180\"/>"
			$SVG_t:=$SVG_t+"      <circle cx=\"200\" cy=\"330\" r=\"8\"/>"
			$SVG_t:=$SVG_t+"      <circle cx=\"200\" cy=\"200\" r=\"4\" stroke-width=\"1\"/>"
			$SVG_t:=$SVG_t+"    </g>"
			$SVG_t:=$SVG_t+"    <g clip-path=\"url(#theClip)\" d4:day-fill=\"white\" d4:night-fill=\"white\" fill=\"white\" fill-opacity=\"0.3\" id=\"clock-glass\">"
			$SVG_t:=$SVG_t+"      <circle cx=\"200\" cy=\"-400\" r=\"600\" stroke-width=\"0\"/>"
			$SVG_t:=$SVG_t+"    </g>"
			$SVG_t:=$SVG_t+"  </g>"
			$SVG_t:=$SVG_t+""
			$SVG_t:=$SVG_t+"</svg>"
			
			
			$Dom_root:=DOM Parse XML variable:C720($SVG_t)
			
		End if 
		
		If (OK=1)
			
			  //Ensures that  that attribute "transform" will be available for the 3 hands {
			$Dom_node:=DOM Find XML element by ID:C1010($Dom_root;"hours-hand")
			If (OK=1)
				DOM SET XML ATTRIBUTE:C866($Dom_node;"transform";"")
			End if 
			
			$Dom_node:=DOM Find XML element by ID:C1010($Dom_root;"minutes-hand")
			If (OK=1)
				DOM SET XML ATTRIBUTE:C866($Dom_node;"transform";"")
			End if 
			
			$Dom_node:=DOM Find XML element by ID:C1010($Dom_root;"seconds-hand")
			If (OK=1)
				DOM SET XML ATTRIBUTE:C866($Dom_node;"transform";"")
			End if   //}
			
			  //Load the picture once for all
			SVG EXPORT TO PICTURE:C1017($Dom_root;(OBJECT Get pointer:C1124(Object named:K67:5;"gClock"))->;Get XML data source:K45:16)
			
			SET TIMER:C645(-1)
			
		End if 
		
		OBJECT GET SUBFORM CONTAINER SIZE:C1148($width;$height)
		OBJECT MOVE:C664(*;"gClock";1;1;$width-1;$height-1;*)
		
		CALL SUBFORM CONTAINER:C1086((-1)*On Load:K2:1)
		
		  //__________________________________________________________________________________
		
	: ($formEvent=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-1)
		
		  //__________________________________________________________________________________
	: ($formEvent=On Timer:K2:25)
		
		SET TIMER:C645(0)
		$Timer:=0
		
		OBJECT GET SUBFORM CONTAINER SIZE:C1148($width;$height)
		OBJECT MOVE:C664(*;"gClock";1;1;$width-1;$height-1;*)
		
		
		If ($Timer=0)
			$PtrRebuild:=OBJECT Get pointer:C1124(Object named:K67:5;"clockRebuild")
			
			If ($PtrRebuild->#"")
				
				$PtrSecondHand:=OBJECT Get pointer:C1124(Object named:K67:5;"clockDisplaySecondHand")
				
				If ($PtrSecondHand->="true")
					SVG SET ATTRIBUTE:C1055(*;"gClock";"seconds-hand";"visibility";"visible")
				Else 
					SVG SET ATTRIBUTE:C1055(*;"gClock";"seconds-hand";"visibility";"hidden")
				End if 
				
				$PtrRebuild->:=""
				
				$Timer:=-1  // in case there is something else
			End if 
			
		End if 
		
		
		If ($Timer=0)
			
			$Ptr_container:=OBJECT Get pointer:C1124(Object subform container:K67:4)
			
			If (Not:C34(Is nil pointer:C315($Ptr_container)))
				
				$Type:=Type:C295($Ptr_container->)
				
				Case of 
						
					: ($Type=Is time:K8:8)
						
						$AutoRun:=False:C215
						$Gmt_Current_Time:=$Ptr_container->
						
					: ($type=Is longint:K8:6) | ($type=Is real:K8:4)
						
						$AutoRun:=True:C214
						
						$Gmt_offset:=$Ptr_container->
						$Gmt_Current_Time:=Current time:C178+$Gmt_offset
						$Gmt_Current_Time:=Choose:C955($Gmt_Current_Time>?24:00:00?;$Gmt_Current_Time-?24:00:00?;$Gmt_Current_Time)
						
					: (True:C214)  // any other type will provide a dynamic clock too without time shift
						
						$AutoRun:=True:C214
						
						$Gmt_offset:=0
						$Gmt_Current_Time:=Current time:C178+$Gmt_offset
						$Gmt_Current_Time:=Choose:C955($Gmt_Current_Time>?24:00:00?;$Gmt_Current_Time-?24:00:00?;$Gmt_Current_Time)
						
				End case 
				
				
				$secondes:=$Gmt_Current_Time%60
				$minutes_r:=(($Gmt_Current_Time\60)%60)+($secondes/60)
				$hours_r:=$Gmt_Current_Time/3600
				
				$secondAngle:=($secondes*6)+180
				$minuteAngle_r:=($minutes_r*6)+180
				$hourAngle_r:=(($hours_r-(12*Num:C11($hours_r>12)))*30)+180
				
				  //Modifie the rotation of the 3 hands : according to the user value of cx cy if any
				SVG GET ATTRIBUTE:C1056(*;"gClock";"seconds-hand";"d4:cx";$cx_r)
				SVG GET ATTRIBUTE:C1056(*;"gClock";"seconds-hand";"d4:cy";$cy_r)
				$cx_r:=Choose:C955($cx_r=0;200;$cx_r)
				$cy_r:=Choose:C955($cy_r=0;200;$cy_r)
				SVG SET ATTRIBUTE:C1055(*;"gClock";"seconds-hand";"transform";"rotate("+String:C10($secondAngle;"&xml")+","+String:C10($cx_r;"&xml")+","+String:C10($cy_r;"&xml")+")")
				
				SVG GET ATTRIBUTE:C1056(*;"gClock";"minutes-hand";"d4:cx";$cx_r)
				SVG GET ATTRIBUTE:C1056(*;"gClock";"minutes-hand";"d4:cy";$cy_r)
				$cx_r:=Choose:C955($cx_r=0;200;$cx_r)
				$cy_r:=Choose:C955($cy_r=0;200;$cy_r)
				SVG SET ATTRIBUTE:C1055(*;"gClock";"minutes-hand";"transform";"rotate("+String:C10($minuteAngle_r;"&xml")+","+String:C10($cx_r;"&xml")+","+String:C10($cy_r;"&xml")+")")
				
				SVG GET ATTRIBUTE:C1056(*;"gClock";"hours-hand";"d4:cx";$cx_r)
				SVG GET ATTRIBUTE:C1056(*;"gClock";"hours-hand";"d4:cy";$cy_r)
				$cx_r:=Choose:C955($cx_r=0;200;$cx_r)
				$cy_r:=Choose:C955($cy_r=0;200;$cy_r)
				SVG SET ATTRIBUTE:C1055(*;"gClock";"hours-hand";"transform";"rotate("+String:C10($hourAngle_r;"&xml")+","+String:C10($cx_r;"&xml")+","+String:C10($cy_r;"&xml")+")")
				
				
				  //Set the background according to the daylight if any
				If ($Gmt_Current_Time>=?08:00:00?) & ($Gmt_Current_Time<?20:00:00?)
					$attributeFill:="d4:day-fill"
					$attributeStroke:="d4:day-stroke"
				Else 
					$attributeFill:="d4:night-fill"
					$attributeStroke:="d4:night-stroke"
				End if 
				
				ARRAY TEXT:C222($_objectsNames;6)
				$_objectsNames{1}:="watch-dial"
				$_objectsNames{2}:="hours-hand"
				$_objectsNames{3}:="minutes-hand"
				$_objectsNames{4}:="seconds-hand"
				$_objectsNames{5}:="labels"
				$_objectsNames{6}:="clock-glass"
				
				For ($i;1;Size of array:C274($_objectsNames);1)
					
					SVG GET ATTRIBUTE:C1056(*;"gClock";$_objectsNames{$i};$attributeFill;$fillColor)
					If ($fillColor#"")
						SVG SET ATTRIBUTE:C1055(*;"gClock";$_objectsNames{$i};"fill";$fillColor)
					End if 
					
					SVG GET ATTRIBUTE:C1056(*;"gClock";$_objectsNames{$i};$attributeStroke;$strokeColor)
					If ($strokeColor#"")
						SVG SET ATTRIBUTE:C1055(*;"gClock";$_objectsNames{$i};"stroke";$strokeColor)
					End if 
					
				End for 
				
				If ($AutoRun=True:C214)
					$Timer:=10  // 6 X PER SECOND
				End if 
				
			End if 
			
		End if 
		
		SET TIMER:C645($Timer)  // peut-etre zero
		
		
		  //__________________________________________________________________________________
End case 