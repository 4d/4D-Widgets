//%attributes = {"invisible":true}
#DECLARE($recalc : Boolean)  // True = recalc time from POPUP zones

$recalc:=Count parameters:C259>0 ? $recalc : True:C214  // True by default

//----------------- RÉCUPÉRATION DES POINTEURS VERS OBJETS --------------------------------------
var $NbPopup : Integer
var $PtrHours:=OBJECT Get pointer:C1124(Object named:K67:5; "Hours")

If (Not:C34(Is nil pointer:C315($PtrHours)))
	
	$NbPopup:=1
	var $ptrMinutes:=OBJECT Get pointer:C1124(Object named:K67:5; "Minutes")
	
	If (Not:C34(Is nil pointer:C315($PtrMinutes)))
		
		$NbPopup:=2
		
	End if 
End if 

If ($NbPopup=0)
	
	return   // Generic call, do nothing
	
End if 

//----------------- RÉCUPÉRATION DES CONTRAINTES --------------------------------------
var $minTime : Time:=objectGetValue("MinTime")
var $maxTime : Time:=objectGetValue("MaxTime") || <>TimePicker_TimeMax
var $step : Time:=TimePicker__GetStep

//----------------- RECALCUL (OU NON) DE L'HEURE SAISIE --------------------------------------
If ($recalc)
	
	Case of 
			
			//________________________________________________________________________________
		: ($NbPopup=1)
			
			var $ValPopHours : Integer:=($PtrHours->)-1
			$time:=$minTime+($step*$ValPopHours)
			
			//________________________________________________________________________________
		: ($NbPopup=2)
			
			$ValPopHours:=($ptrHours->)-1
			var $ValPopMinutes : Integer:=($ptrMinutes->)-1
			
			// Calcul de l'heure clicquée
			$time:=(3600*Int:C8($minTime/3600))+(3600*($ValPopHours))+($step*$ValPopMinutes)
			
			//________________________________________________________________________________
	End case 
	
Else 
	
	var $time:=TimePicker__GetSelectedTime
	
End if 

//-------------------- MISE EN CONFORMITÉ PAR RAPPORT AUX CONTRAINTES ------------------------
$time:=($time+?24:00:00?)%(24*3600)

Case of 
		
		//________________________________________________________________________________
	: ($time<$minTime)
		
		$time:=$minTime
		
		//________________________________________________________________________________
	: ($time>$maxTime)\
		 && ($maxTime#?00:00:00?)
		
		$time:=$maxTime
		
		//________________________________________________________________________________
End case 

// ---------------------- RÉAFFECTATION DANS LES POPUPS DE SAISIE ----------------------------
var $safety : Integer

Repeat 
	
	$safety+=1
	
	Case of 
			
			//________________________________________________________________________________
		: ($NbPopup=1)
			
			var $ID : Integer:=Round:C94(($time-$minTime)/$step; 0)+1
			
			If ($ID<=Size of array:C274($PtrHours->))
				
				$PtrHours->:=$ID
				
			Else 
				
				$PtrHours->:=Size of array:C274($PtrHours->)
				
			End if 
			
			If (Not:C34($recalc))
				
				// Dans le cas ou l'heure n'as pas été saissie dans les popup, il faut la recalculer
				// Car l'affectation des popup provoque un arrondi
				$ValPopHours:=($PtrHours->)-1
				$time:=$minTime+($step*$ValPopHours)
				
			End if 
			
			//________________________________________________________________________________
		: ($NbPopup=2)
			
			$ID:=Round:C94(($time%3600)/$step; 0)+1
			
			If ($ID<=Size of array:C274($PtrMinutes->))
				
				$PtrMinutes->:=$ID
				var $shift : Integer:=0
				
			Else 
				
				// Passage a l'heure suivante
				$PtrMinutes->:=1
				$shift:=1
				
			End if 
			
			$ID:=Int:C8(($time-$minTime)/3600)+1+$shift
			
			If ($ID<=Size of array:C274($PtrHours->))
				
				$PtrHours->:=$ID
				
			Else 
				
				$PtrHours->:=Size of array:C274($PtrHours->)
				
			End if 
			
			// Recalculation is mandatory due to rounding that may occur when using drop-down menus.
			$ValPopHours:=($ptrHours->)-1
			$ValPopMinutes:=($ptrMinutes->)-1
			
			// Calcul de l'heure clicquée
			$time:=(3600*Int:C8($minTime/3600))+(3600*$ValPopHours)+($step*$ValPopMinutes)
			
			//________________________________________________________________________________
	End case 
	
	Case of 
			
			//________________________________________________________________________________
		: ($time<$minTime)
			
			$time:=$time+$step
			
			//________________________________________________________________________________
		: ($time>$maxTime)\
			 & ($maxTime#?00:00:00?)
			
			$time:=$time-$step
			
			//________________________________________________________________________________
		Else 
			
			break
			
			//________________________________________________________________________________
	End case 
Until ($safety>10)

$time:=TimePicker__SetSelectedTime($time)
