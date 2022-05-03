//%attributes = {"invisible":true}
C_BOOLEAN:C305($1)  //true = recalc time from POPUP zones (true by default)


C_BOOLEAN:C305($recalc)
C_BOOLEAN:C305($Exit)

C_LONGINT:C283($NbPopup)
C_LONGINT:C283($ValPopHours; $ValPopMinuts)
C_LONGINT:C283($safety)
C_LONGINT:C283($Id; $shift)

C_TIME:C306($minTime)
C_TIME:C306($maxTime)
C_TIME:C306($step)
C_TIME:C306($time)

C_POINTER:C301($ptrHours; $ptrMinuts)

If (Count parameters:C259>0)
	$recalc:=$1
Else 
	$recalc:=True:C214
End if 


//----------------- RÉCUPÉRATION DES POINTEURS VERS OBJETS --------------------------------------

$NbPopup:=0
$PtrHours:=Self:C308(Object named:K67:5; "Hours")
If (Not:C34(Is nil pointer:C315($PtrHours)))
	$NbPopup:=1
	$PtrMinuts:=Self:C308(Object named:K67:5; "Minuts")
	If (Not:C34(Is nil pointer:C315($PtrMinuts)))
		$NbPopup:=2
	End if 
End if 

If ($NbPopup>0)
	
	//----------------- RÉCUPÉRATION DESCONTRAINTES --------------------------------------
	
	TimePicker__GetTimeMin(->$minTime)
	TimePicker__GetTimeMax(->$maxTime)
	TimePicker__GetStep(->$step)
	
	//----------------- RECALCUL (OU NON) DE L'HEURE SAISIE --------------------------------------
	
	$time:=?00:00:00?
	If ($recalc)
		
		Case of 
				
			: ($NbPopup=1)
				
				
				//$ValPopHours:=Num($PtrHours->{$PtrHours->})
				//$time:=3600*$ValPopHours
				
				$ValPopHours:=($PtrHours->)-1
				$time:=$minTime+($step*$ValPopHours)
				
			: ($NbPopup=2)
				
				//$ValPopHours:=Num($PtrHours->{$PtrHours->})  // ca ne marche pas a cause de AM/PM   num("3am") = num("3pm")
				//$ValPopMinuts:=Num($PtrMinuts->{$PtrMinuts->})
				//$time:=(3600*$ValPopHours)+(60*$ValPopMinuts)
				
				$ValPopHours:=($ptrHours->)-1
				$ValPopMinuts:=($ptrMinuts->)-1
				//calcul de l'heure clicquée
				$time:=(3600*Int:C8($minTime/3600))+(3600*($ValPopHours))+($step*$ValPopMinuts)
				
		End case 
		
	Else 
		
		TimePicker__GetSelectedTime(->$time)
		
	End if 
	
	//-------------------- MISE EN CONFORMITÉ PAR RAPPORT AUX CONTRAINTES ------------------------
	
	$time:=($time+?24:00:00?)%(24*3600)
	
	Case of 
		: ($time<$minTime)
			$time:=$minTime
		: ($time>$maxTime) & ($maxTime#?00:00:00?)
			$time:=$maxTime
	End case 
	
	// ---------------------- RÉAFFECTATION DANS LES POPUPS DE SAISIE ----------------------------
	
	$safety:=0
	
	Repeat 
		$safety:=$safety+1
		
		Case of 
				
			: ($NbPopup=1)
				
				$Id:=Round:C94(($time-$minTime)/$step; 0)+1
				If ($Id<=Size of array:C274($PtrHours->))
					$PtrHours->:=$ID
				Else 
					$PtrHours->:=Size of array:C274($PtrHours->)
				End if 
				
				If (Not:C34($recalc))
					//dans le cas ou l'heure n'as pas été saissie dans les popup, il faut la recalculer
					// ca l'affectation des popup provoque un arrondi
					$ValPopHours:=($PtrHours->)-1
					$time:=$minTime+($step*$ValPopHours)
				End if 
				
			: ($NbPopup=2)
				
				$Id:=Round:C94(($time%3600)/$step; 0)+1
				If ($Id<=Size of array:C274($PtrMinuts->))
					$PtrMinuts->:=$ID
					$shift:=0
				Else 
					//passage a l'heure suivante
					$PtrMinuts->:=1
					$shift:=1
				End if 
				
				$Id:=Int:C8(($time-$minTime)/3600)+1+$shift
				If ($Id<=Size of array:C274($PtrHours->))
					$PtrHours->:=$ID
				Else 
					$PtrHours->:=Size of array:C274($PtrHours->)
				End if 
				
				// recalculation is mandatory because of rouds that may happen using dropdowns
				
				$ValPopHours:=($ptrHours->)-1
				$ValPopMinuts:=($ptrMinuts->)-1
				//calcul de l'heure clicquée
				$time:=(3600*Int:C8($minTime/3600))+(3600*$ValPopHours)+($step*$ValPopMinuts)
				
		End case 
		
		$Exit:=False:C215
		Case of 
			: ($time<$minTime)
				$time:=$time+$step
			: ($time>$maxTime) & ($maxTime#?00:00:00?)
				$time:=$time-$step
			Else 
				$Exit:=True:C214
		End case 
		
	Until ($Exit) | ($safety>10)
	
	$time:=TimePicker__SetSelectedTime($time; "")
	
Else 
	
	// Generic call, do nothing
	
End if 