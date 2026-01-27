Class extends _time

property nbPopup : Integer
property isJA:=(Get database localization:C1009(User system localization:K5:23)="ja") || (Get database localization:C1009(Current localization:K5:22)="ja")

property selectedItem : Text

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor
	
	Super:C1705()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function Init($withMeridien : Boolean)
	
	This:C1470.withMeridien:=$withMeridien
	This:C1470.nbPopup:=Num:C11(This:C1470.withWidget("Hours"))+Num:C11(This:C1470.withWidget("Minutes"))
	
	This:C1470.buildPopup()
	
	//var $CurrentTime : Time:=TimePicker__GetTarget
	//$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime)
	
/*
var $time : Time:=Time(This.getContainerValue().value)
This.setContainerValue($time)
*/
	
	//TimePicker__DisplayTimePopups(False)
	
	This:C1470.Update()
	
	This:C1470.callParent()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function Update()
	
	var $time : Time:=Time:C179(This:C1470.getContainerValue().value)
	This:C1470.setSelectedTime($time)
	This:C1470.Display()
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function buildPopup()
	
	var $AM:=This:C1470.withMeridien ? This:C1470.AM : ""
	var $PM:=This:C1470.withMeridien ? This:C1470.PM : ""
	
	Case of 
			
			//________________________________________________________________________________
		: (This:C1470.nbPopup=0)
			
			return   // Do nothing - Method called from a global
			
			//________________________________________________________________________________
		: (This:C1470.nbPopup=1)
			
			var $picker : Time:=This:C1470.minTime
			var $values:=[]
			
			If (This:C1470.withMeridien)
				
				If (This:C1470.step#?00:00:00?)
					
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
							
							$values.push($Label+" "+String:C10($hours; "00")+<>Time_separator+String:C10($minutes; "00"))
							
						Else 
							
							$values.push(String:C10($hours; "00")+<>Time_separator+String:C10($minutes; "00")+" "+$Label)
							
						End if 
						
						$picker:=$picker+This:C1470.step
						
					Until ($picker>This:C1470.maxTime)
				End if 
				
			Else 
				
				This:C1470.selectedItem:=String:C10(Time:C179($picker); HH MM:K7:2)
				
				If (This:C1470.step#?00:00:00?)
					
					Repeat 
						
						$values.push(String:C10(Time:C179($picker); HH MM:K7:2))
						$picker+=This:C1470.step
						
					Until ($picker>This:C1470.maxTime)
				End if 
			End if 
			
			OBJECT SET VALUE:C1742("Hours"; {values: $values})
			
			//________________________________________________________________________________
		: (This:C1470.nbPopup=2)
			
			//******************************************************************************************************
			ARRAY TEXT:C222($_TimePickerHours; 0)
			ARRAY TEXT:C222($_TimePickerMinutes; 0)
			//******************************************************************************************************
			
			If (This:C1470.step#?00:00:00?)
				
				$picker:=This:C1470.minTime
				
				// Populate Hours array
				If (This:C1470.withMeridien)
					
					Repeat 
						
						$time:=Int:C8($picker/3600)
						
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
							
							APPEND TO ARRAY:C911($_TimePickerHours; $Label+" "+String:C10($hours; "00"))
							
						Else 
							
							APPEND TO ARRAY:C911($_TimePickerHours; String:C10($hours; "00")+" "+$Label)
							
						End if 
						
						$picker:=$picker+?01:00:00?
						
					Until ($picker>This:C1470.maxTime)
					
				Else 
					
					Repeat 
						
						var $time : Integer:=Int:C8($picker/3600)
						APPEND TO ARRAY:C911($_TimePickerHours; String:C10($time; "00"))
						$picker:=$picker+?01:00:00?
						
					Until ($picker>This:C1470.maxTime)
				End if 
				
				// Populate Minutes array (common)
				$picker:=?00:00:00?
				
				Repeat 
					
					$time:=Int:C8($picker/60)
					APPEND TO ARRAY:C911($_TimePickerMinutes; String:C10($time; "00"))
					$picker:=$picker+This:C1470.step
					
				Until ($picker>=?01:00:00?)
			End if 
			
/*******************************************************************************************************
//%W-518.1
var $ptr:=OBJECT Get pointer(Object named; "Hours")
COPY ARRAY($_TimePickerHours; $ptr->)
$ptr:=OBJECT Get pointer(Object named; "Minutes")
COPY ARRAY($_TimePickerMinutes; $ptr->)
//%W+518.1
*/
			
			
			//________________________________________________________________________________
	End case 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function Display($recalculation : Boolean)
	
	var $pop1 : Object:=OBJECT Get value:C1743("Hours")
	
	// MARK: Recalculation (or not) of the entered date
	If ($recalculation)
		
		Case of 
				
				//________________________________________________________________________________
			: (This:C1470.nbPopup=1)
				
				$time:=Time:C179($pop1.currentValue)
				
				//________________________________________________________________________________
			: (This:C1470.nbPopup=2)
				
/*
$ValPopHours:=($ptrHours->)-1
var $ValPopMinutes : Integer:=($ptrMinutes->)-1
				
// Calcul de l'heure clicquée
$time:=(3600*Int($minTime/3600))+(3600*($ValPopHours))+($step*$ValPopMinutes)
*/
				
				//________________________________________________________________________________
		End case 
		
	Else 
		
		var $time:=This:C1470.time
		
	End if 
	
	$time:=This:C1470.constraints(($time+?24:00:00?)%(24*3600))
	This:C1470.time:=$time
	
	Case of 
			
			//________________________________________________________________________________
		: (This:C1470.nbPopup=1)
			
			var $t:=String:C10(Time:C179($time); HH MM:K7:2)
			$pop1.index:=$pop1.values.indexOf($t)
			$pop1.currentValue:=$t
			
			OBJECT SET VALUE:C1742("Hours"; $pop1)
			
			//var $ValPopHours : Integer:=($PtrHours->)-1
			//$time:=$minTime+($step*$ValPopHours)
			
			
			
			//________________________________________________________________________________
		: (This:C1470.nbPopup=2)
			
/*
$ValPopHours:=($ptrHours->)-1
var $ValPopMinutes : Integer:=($ptrMinutes->)-1
			
// Calcul de l'heure clicquée
$time:=(3600*Int($minTime/3600))+(3600*($ValPopHours))+($step*$ValPopMinutes)
*/
			
			
			//________________________________________________________________________________
	End case 
	
	
	
	
	
	