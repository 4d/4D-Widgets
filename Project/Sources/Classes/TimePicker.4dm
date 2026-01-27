Class extends _time

property name : Text

// === === === === === === === === === === === === === === === === === === === === === === === ===
Class constructor($name : Text)
	
	Super:C1705()
	
	This:C1470.name:=$name
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function get minTime() : Time
	
	var $time : Time
	EXECUTE METHOD IN SUBFORM:C1085(This:C1470.name; Formula:C1597(Form:C1466.minTime); $time)
	return $time
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function set minTime($time : Time)
	
	// Set the min time only if <= to maxtime
	var $maxTime:=This:C1470.maxTime
	
	If (($time<=$maxTime)\
		 || ($maxTime=?00:00:00?))
		
		EXECUTE METHOD IN SUBFORM:C1085(This:C1470.name; Formula:C1597(Form:C1466.minTime:=$1); *; $time)
		EXECUTE METHOD IN SUBFORM:C1085(This:C1470.name; Formula:C1597(Form:C1466.Display()))
		
	End if 
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function get maxTime() : Time
	
	var $time : Time
	EXECUTE METHOD IN SUBFORM:C1085(This:C1470.name; Formula:C1597(Form:C1466.maxTime); $time)
	return $time
	
	// === === === === === === === === === === === === === === === === === === === === === === === ===
Function set maxTime($time : Time)
	
	// Set the max time only if >= to mintime
	var $minTime:=This:C1470.minTime
	
	If (($time>=$minTime)\
		 || ($minTime=?00:00:00?))
		
		EXECUTE METHOD IN SUBFORM:C1085(This:C1470.name; Formula:C1597(Form:C1466.maxTime:=$1); *; $time)
		EXECUTE METHOD IN SUBFORM:C1085(This:C1470.name; Formula:C1597(Form:C1466.Display()))
		
	End if 