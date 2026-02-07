Class extends _time

property nbPopup : Integer
property isJA:=(Get database localization:C1009(User system localization:K5:23)="ja") || (Get database localization:C1009(Current localization:K5:22)="ja")

property selectedItem : Text

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor
	
	Super:C1705()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function init()
	
	Super:C1706.init()
	
	OBJECT SET TITLE:C194(*; "separator"; This:C1470.separator)
	
	This:C1470.withMeridien:=This:C1470.currentForm="@_AM"
	This:C1470.nbPopup:=Num:C11(This:C1470.withWidget("Hours"))+Num:C11(This:C1470.withWidget("Minutes"))
	
	This:C1470.buildPopup()
	This:C1470.display()
	
	OBJECT SET FOCUS RECTANGLE INVISIBLE:C1177(*; "@"; True:C214)
	
	This:C1470.callParent()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function handleEvents($e : Object)
	
	$e:=$e || FORM Event:C1606
	
	// MARK:Form Method
	If ($e.objectName=Null:C1517)
		
		Case of 
				
				// __________________________________________________________________________________
			: ($e.code=On Load:K2:1)
				
				Form:C1466.init()
				
				// __________________________________________________________________________________
			: ($e.code=On Bound Variable Change:K2:52)
				
				SET TIMER:C645(-1)
				
				// __________________________________________________________________________________
			: ($e.code=On Timer:K2:25)
				
				SET TIMER:C645(0)
				
				Form:C1466.update()
				
				// __________________________________________________________________________________
		End case 
		
		return 
		
	End if 
	
	// MARK: Widget Methods
	Case of 
			
			// ______________________________________________________
		: ($e.objectName="Hours")\
			 || ($e.objectName="Minutes")
			
			This:C1470.display(True:C214)
			
			// ______________________________________________________
		: (False:C215)
			
			// ______________________________________________________
		Else 
			
			// A "Case of" statement should never omit "Else"
			
			// ______________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function update()
	
	var $time : Time:=Time:C179(This:C1470.getContainerValue().value)
	This:C1470.setSelectedTime($time)
	This:C1470.display()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function buildPopup()
	
	If (This:C1470.step=?00:00:00?)
		
		return 
		
	End if 
	
	var $AM:=This:C1470.withMeridien ? This:C1470.AM : ""
	var $PM:=This:C1470.withMeridien ? This:C1470.PM : ""
	var $picker : Time:=This:C1470.minTime
	var $values:=[]
	
	Case of 
			
			//________________________________________________________________________________
		: (This:C1470.nbPopup=1)
			
			If (This:C1470.withMeridien)
				
				This:C1470.selectedItem:=String:C10(Time:C179($picker); HH MM AM PM:K7:5)
				
				Repeat 
					
					Case of 
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($picker<?01:00:00?)
							
							var $Label:=$AM
							var $hours : Integer:=12  // 12 AM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($picker<?12:00:00?)  // 01 AM to 11 AM
							
							$Label:=$AM
							$hours:=Int:C8($picker/3600)
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($picker<?13:00:00?)
							
							$Label:=$PM
							$hours:=12  // 12 PM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($picker<?24:00:00?)
							
							If ($PM#"")
								
								$Label:=$PM
								$hours:=Int:C8(($picker-?12:00:00?)/3600)
								
							Else 
								
								$hours:=Int:C8(($picker)/3600)
								
							End if 
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($picker>=?24:00:00?)
							
							$Label:=$AM
							$hours:=12  // 12 AM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
					End case 
					
					var $minutes : Integer:=Int:C8(($picker%3600)\60)
					
					If (This:C1470.isJA)
						
						$values.push($Label+" "+String:C10($hours; "00")+This:C1470.separator+String:C10($minutes; "00"))
						
					Else 
						
						$values.push(String:C10($hours; "00")+This:C1470.separator+String:C10($minutes; "00")+" "+$Label)
						
					End if 
					
					$picker:=$picker+This:C1470.step
					
				Until ($picker>This:C1470.maxTime)
				
			Else 
				
				This:C1470.selectedItem:=String:C10(Time:C179($picker); HH MM:K7:2)
				
				Repeat 
					
					$values.push(String:C10(Time:C179($picker); HH MM:K7:2))
					$picker+=This:C1470.step
					
				Until ($picker>This:C1470.maxTime)
			End if 
			
			OBJECT SET VALUE:C1742("Hours"; {values: $values})
			
			//________________________________________________________________________________
		: (This:C1470.nbPopup=2)
			
			// Hours with meridien or not
			If (This:C1470.withMeridien)
				
				Repeat 
					
					var $time : Integer:=Int:C8($picker/3600)
					
					Case of 
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($time<1)
							
							$Label:=$AM
							$hours:=12  // 12 AM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($time<12)
							
							$Label:=$AM
							$hours:=Int:C8($picker/3600)
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($time<13)
							
							$Label:=$PM
							$hours:=12  // 12 PM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($time<24)
							
							$Label:=$PM
							$hours:=Int:C8($picker/3600)-12
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
						: ($time>=24)
							
							$hours:=12  // 12 PM
							$Label:=$AM
							
							//┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅
					End case 
					
					If (This:C1470.isJA)
						
						$values.push($Label+" "+String:C10($hours; "00"))
						
					Else 
						
						$values.push(String:C10($hours; "00")+" "+$Label)
						
					End if 
					
					$picker:=$picker+?01:00:00?
					
				Until ($picker>This:C1470.maxTime)
				
			Else 
				
				Repeat 
					
					$time:=Int:C8($picker/3600)
					$values.push(String:C10($time; "00"))
					$picker+=?01:00:00?
					
				Until ($picker>This:C1470.maxTime)
			End if 
			
			OBJECT SET VALUE:C1742("Hours"; {values: $values})
			
			// Minutes (common)
			$picker:=?00:00:00?
			$values:=[]
			
			Repeat 
				
				$time:=Int:C8($picker/60)
				$values.push(String:C10($time; "00"))
				$picker+=This:C1470.step
				
			Until ($picker>=?01:00:00?)
			
			OBJECT SET VALUE:C1742("Minutes"; {values: $values})
			
			//________________________________________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function display($recalculation : Boolean)
	
	var $time:=?00:00:00?
	var $hours : Object:=OBJECT Get value:C1743("Hours")
	var $minutes : Object:=OBJECT Get value:C1743("Minutes")
	
	// MARK: Recalculation (or not) of the entered date
	If ($recalculation)
		
		Case of 
				
				//________________________________________________________________________________
			: (This:C1470.nbPopup=1)
				
				$time:=Time:C179($hours.currentValue)
				
				//________________________________________________________________________________
			: (This:C1470.nbPopup=2)
				
				$time:=Time:C179($hours.currentValue+This:C1470.separator+$minutes.currentValue)
				
				//________________________________________________________________________________
		End case 
		
	Else 
		
		$time:=This:C1470.time
		
	End if 
	
	$time:=This:C1470.constraints(($time+?24:00:00?)%(24*3600))
	This:C1470.time:=$time
	
	Case of 
			
			//________________________________________________________________________________
		: (This:C1470.nbPopup=1)
			
			var $t:=String:C10(Time:C179($time); This:C1470.withMeridien ? HH MM AM PM:K7:5 : HH MM:K7:2)
			$hours.index:=$hours.values.indexOf($t)
			$hours.currentValue:=$t
			
			OBJECT SET VALUE:C1742("Hours"; $hours)
			
			//________________________________________________________________________________
		: (This:C1470.nbPopup=2)
			
			// Start with the minutes
			var $indx : Integer:=Round:C94(($time%3600)/This:C1470.step; 0)
			$indx:=$indx=$minutes.values.length ? $indx-1 : $indx
			
			If ($indx<=$minutes.values.length)
				
				$minutes.index:=$indx
				var $shift : Integer:=0
				
			Else 
				
				$minutes.index:=0
				$shift:=1
				
			End if 
			
			OBJECT SET VALUE:C1742("Minutes"; $minutes)
			
			// Then compute hours
			$indx:=Int:C8(($time-This:C1470.minTime)/3600)+$shift
			
			If ($indx<=$hours.values.length)
				
				$hours.index:=$indx
				
			Else 
				
				$hours.index:=$hours.values[$hours.values.length-1]
				
			End if 
			
			//________________________________________________________________________________
	End case 
	
	This:C1470.setSelectedTime($time)
	
	