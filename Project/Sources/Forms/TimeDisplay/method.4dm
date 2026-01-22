// ----------------------------------------------------
// Form method : clock
// Created 26/09/08 by vdl
// ----------------------------------------------------
// Modified 06-5-2013 by Roland Lannuzel
// variables renamed
// test of bound variable type
// added to widgets and picture library
// ----------------------------------------------------
// Modified 22-01-2025 by vdl
// Code modernization
// ----------------------------------------------------
var $e:=FORM Event:C1606

Case of 
		
		//__________________________________________________________________________________
	: ($e.code=On Load:K2:1)
		
		OBJECT SET VALUE:C1742("redraw"; False:C215)
		OBJECT SET VALUE:C1742("withSeconds"; True:C214)
		
		var $file:=File:C1566("/RESOURCES/clock.svg"; *)
		
		If ($file.exists)  // User clock
			
			var $root:=DOM Parse XML source:C719($file.getText())
			
		Else 
			
			var $svg:="<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?>"
			$svg:=$svg+"<svg xmlns=\"http://www.w3.org/2000/svg\" height=\"400\" width=\"400\" xmlns:d4=\"http://www.4d.com/d4-ns\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">"
			$svg:=$svg+"  <metadata xmlns=\"http://www.4D.com/4DSVG\">"
			$svg:=$svg+"    <generator>4D SVG Component version 13.0 hotfix 3 ©2008-2013 4D SAS.</generator>"
			$svg:=$svg+"    <about>4D SVG is the quintessential vector drawing tool for 4D developers.</about>"
			$svg:=$svg+"    <generation date=\"2013-05-06Z\" system=\"Mac OSX 10.8.3\" time=\"PT11H23M6S\"/>"
			$svg:=$svg+"  </metadata>"
			$svg:=$svg+"  <defs id=\"4D\">"
			$svg:=$svg+"    <style type=\"text/css\">text{font-size:28;font-family:'Lucida grande' 'ArialMT';}</style>"
			$svg:=$svg+"    <clipPath id=\"theClip\">"
			$svg:=$svg+"      <circle cx=\"200\" cy=\"200\" fill=\"white\" r=\"186\" stroke=\"black\"/>"
			$svg:=$svg+"    </clipPath>"
			$svg:=$svg+"  </defs>"
			$svg:=$svg+"  <g id=\"theClock\">"
			$svg:=$svg+"    <circle cx=\"200\" cy=\"200\" d4:day-fill=\"RGB(200,200,200)\" d4:day-stroke=\"black\" d4:night-fill=\"black\" d4:night-stroke=\"RGB(100,100,100)\" fill=\"RGB(200,200,200)\" id=\"watch-dial\" r=\"190\" stroke=\"black\" stroke-width=\"8\"/>"
			$svg:=$svg+"    <g d4:day-fill=\"black\" d4:night-fill=\"white\" fill=\"black\" id=\"labels\" letter-spacing=\"-1\" stroke=\"black\">"
			$svg:=$svg+"      <text font-size=\"24\" x=\"273.53557754288\" y=\"66.302445055623\">1</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"335.97923935197\" y=\"128.78631156573\">2</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"357.13445946819\" y=\"207.48450280371\">3</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"333.92031289858\" y=\"289.31730087157\">4</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"274\" y=\"352.1717597601\">5</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"192.14960656356\" y=\"373.79443021319\">6</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"110.52207592924\" y=\"351.78771890908\">7</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"50.178544946613\" y=\"290.70480946443\">8</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"27.658317230128\" y=\"208.92205650466\">9</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"44.807198403374\" y=\"127.02477464532\">10</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"103.02477464532\" y=\"68.807198403374\">11</text>"
			$svg:=$svg+"      <text font-size=\"24\" x=\"185.95582186472\" y=\"45.55179726177\">12</text>"
			$svg:=$svg+"    </g>"
			$svg:=$svg+"    <rect d4:cx=\"200\" d4:cy=\"200\" d4:day-fill=\"black\" d4:night-fill=\"white\" fill=\"black\" height=\"115\" id=\"hours-hand\" rx=\"0\" ry=\"0\" stroke=\"black\" width=\"6\" x=\"197\" y=\"180\"/>"
			$svg:=$svg+"    <g d4:cx=\"200\" d4:cy=\"200\" d4:day-fill=\"black\" d4:night-fill=\"white\" fill=\"black\" id=\"minutes-hand\" stroke=\"black\">"
			$svg:=$svg+"      <rect height=\"150\" rx=\"0\" ry=\"0\" width=\"6\" x=\"197\" y=\"180\"/>"
			$svg:=$svg+"      <circle cx=\"200\" cy=\"200\" r=\"10\" stroke-width=\"1\"/>"
			$svg:=$svg+"    </g>"
			$svg:=$svg+"    <g d4:cx=\"200\" d4:cy=\"200\" fill=\"red\" id=\"seconds-hand\" stroke=\"red\" visibility=\"visible\">"
			$svg:=$svg+"      <rect height=\"170\" rx=\"0\" ry=\"0\" width=\"2\" x=\"199\" y=\"180\"/>"
			$svg:=$svg+"      <circle cx=\"200\" cy=\"330\" r=\"8\"/>"
			$svg:=$svg+"      <circle cx=\"200\" cy=\"200\" r=\"4\" stroke-width=\"1\"/>"
			$svg:=$svg+"    </g>"
			$svg:=$svg+"    <g clip-path=\"url(#theClip)\" d4:day-fill=\"white\" d4:night-fill=\"white\" fill=\"white\" fill-opacity=\"0.3\" id=\"clock-glass\">"
			$svg:=$svg+"      <circle cx=\"200\" cy=\"-400\" r=\"600\" stroke-width=\"0\"/>"
			$svg:=$svg+"    </g>"
			$svg:=$svg+"  </g>"
			$svg:=$svg+"</svg>"
			
			$root:=DOM Parse XML variable:C720($svg)
			
		End if 
		
		If (Bool:C1537(OK))
			
			// Ensures that that attribute "transform" will be available for the 3 hands
			var $id : Text
			For each ($id; ["hours-hand"; "minutes-hand"; "seconds-hand"])
				
				var $node:=DOM Find XML element by ID:C1010($root; $id)
				
				If (Bool:C1537(OK))
					
					DOM SET XML ATTRIBUTE:C866($node; "transform"; "")
					
				End if 
				
			End for each 
			
			// Load the picture once for all
			var $pict : Picture
			SVG EXPORT TO PICTURE:C1017($root; $pict; Get XML data source:K45:16)
			OBJECT SET VALUE:C1742("gClock"; $pict)
			
			SET TIMER:C645(-1)
			
		End if 
		
		// Adapt to the size of the container
		var $width; $height : Integer
		OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
		OBJECT MOVE:C664(*; "gClock"; 1; 1; $width-1; $height-1; *)
		
		CALL SUBFORM CONTAINER:C1086((-1)*On Load:K2:1)
		
		//__________________________________________________________________________________
	: ($e.code=On Bound Variable Change:K2:52)
		
		SET TIMER:C645(-1)
		
		//__________________________________________________________________________________
	: ($e.code=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		OBJECT GET SUBFORM CONTAINER SIZE:C1148($width; $height)
		OBJECT MOVE:C664(*; "gClock"; 1; 1; $width-1; $height-1; *)
		
		If (OBJECT Get value:C1743("redraw"))
			
			SVG SET ATTRIBUTE:C1055(*; "gClock"; "seconds-hand"; "visibility"; OBJECT Get value:C1743("withSeconds") ? "visible" : "hidden")
			OBJECT SET VALUE:C1742("redraw"; False:C215)  // Done
			
			return 
			
		End if 
		
		var $variant:=OBJECT Get subform container value:C1785
		var $type:=Value type:C1509($variant)
		var $AutoRun : Boolean
		
		Case of 
				
				//________________________________________________________________________________
			: ($type=Is longint:K8:6)\
				 || ($type=Is real:K8:4)\
				 || ($variant=Null:C1517)
				
				$AutoRun:=True:C214
				var $offset : Time:=$variant
				var $currentTime : Time:=Current time:C178+$offset
				$currentTime:=$currentTime>?24:00:00? ? $currentTime-?24:00:00? : $currentTime
				
				//________________________________________________________________________________
			: ($type=Is time:K8:8)
				
				$currentTime:=$variant
				
				//________________________________________________________________________________
			Else   // Any other type will TRY to provide a STATIC clock
				
				$currentTime:=Time:C179(String:C10($variant))
				
				//________________________________________________________________________________
		End case 
		
		var $secondes : Integer:=$currentTime%60
		var $minutes_r:=(($currentTime\60)%60)+($secondes/60)
		var $hours_r:=$currentTime/3600
		
		var $secondAngle : Integer:=($secondes*6)+180
		var $minuteAngle:=($minutes_r*6)+180
		var $hourAngle:=(($hours_r-(12*Num:C11($hours_r>12)))*30)+180
		
		// Modifie the rotation of the 3 hands : according to the user value of cx cy if any
		var $cx_r; $cy_r : Real
		SVG GET ATTRIBUTE:C1056(*; "gClock"; "seconds-hand"; "d4:cx"; $cx_r)
		SVG GET ATTRIBUTE:C1056(*; "gClock"; "seconds-hand"; "d4:cy"; $cy_r)
		$cx_r:=Choose:C955($cx_r=0; 200; $cx_r)
		$cy_r:=Choose:C955($cy_r=0; 200; $cy_r)
		SVG SET ATTRIBUTE:C1055(*; "gClock"; "seconds-hand"; "transform"; "rotate("+String:C10($secondAngle; "&xml")+","+String:C10($cx_r; "&xml")+","+String:C10($cy_r; "&xml")+")")
		
		SVG GET ATTRIBUTE:C1056(*; "gClock"; "minutes-hand"; "d4:cx"; $cx_r)
		SVG GET ATTRIBUTE:C1056(*; "gClock"; "minutes-hand"; "d4:cy"; $cy_r)
		$cx_r:=Choose:C955($cx_r=0; 200; $cx_r)
		$cy_r:=Choose:C955($cy_r=0; 200; $cy_r)
		SVG SET ATTRIBUTE:C1055(*; "gClock"; "minutes-hand"; "transform"; "rotate("+String:C10($minuteAngle; "&xml")+","+String:C10($cx_r; "&xml")+","+String:C10($cy_r; "&xml")+")")
		
		SVG GET ATTRIBUTE:C1056(*; "gClock"; "hours-hand"; "d4:cx"; $cx_r)
		SVG GET ATTRIBUTE:C1056(*; "gClock"; "hours-hand"; "d4:cy"; $cy_r)
		$cx_r:=Choose:C955($cx_r=0; 200; $cx_r)
		$cy_r:=Choose:C955($cy_r=0; 200; $cy_r)
		SVG SET ATTRIBUTE:C1055(*; "gClock"; "hours-hand"; "transform"; "rotate("+String:C10($hourAngle; "&xml")+","+String:C10($cx_r; "&xml")+","+String:C10($cy_r; "&xml")+")")
		
		// Set the background according to the daylight if any
		If ($currentTime>=?08:00:00?)\
			 & ($currentTime<?20:00:00?)
			
			var $attributeFill:="d4:day-fill"
			var $attributeStroke:="d4:day-stroke"
			
		Else 
			
			$attributeFill:="d4:night-fill"
			$attributeStroke:="d4:night-stroke"
			
		End if 
		
		var $fillColor; $strokeColor : Text
		For each ($id; ["watch-dial"; "hours-hand"; "minutes-hand"; "seconds-hand"; "labels"; "clock-glass"])
			
			SVG GET ATTRIBUTE:C1056(*; "gClock"; $id; $attributeFill; $fillColor)
			
			If (Length:C16($fillColor)#0)
				
				SVG SET ATTRIBUTE:C1055(*; "gClock"; $id; "fill"; $fillColor)
				
			End if 
			
			SVG GET ATTRIBUTE:C1056(*; "gClock"; $id; $attributeStroke; $strokeColor)
			
			If (Length:C16($strokeColor)#0)
				
				SVG SET ATTRIBUTE:C1055(*; "gClock"; $id; "stroke"; $strokeColor)
				
			End if 
			
		End for each 
		
		SET TIMER:C645($AutoRun ? 10 : 0)
		
		//__________________________________________________________________________________
End case 