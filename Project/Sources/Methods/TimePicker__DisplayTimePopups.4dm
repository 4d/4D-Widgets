//%attributes = {"invisible":true}
C_BOOLEAN:C305($1)  //true = recalc time from POPUP zones (true by default)


C_BOOLEAN:C305($Recalc)
C_BOOLEAN:C305($Exit)

C_LONGINT:C283($NbPopup)
C_LONGINT:C283($ValPopHours;$ValPopMinuts)
C_LONGINT:C283($Safety)
C_LONGINT:C283($Id;$Shift)

C_TIME:C306($MinTime)
C_TIME:C306($MaxTime)
C_TIME:C306($Step)
C_TIME:C306($Time)

C_POINTER:C301($ptrHours;$ptrMinuts)

If (Count parameters:C259>0)
	$Recalc:=$1
Else 
	$Recalc:=True:C214
End if 


  //----------------- RÉCUPÉRATION DES POINTEURS VERS OBJETS --------------------------------------

$NbPopup:=0
$PtrHours:=Self:C308(Object named:K67:5;"Hours")
If (Not:C34(Is nil pointer:C315($PtrHours)))
	$NbPopup:=1
	$PtrMinuts:=Self:C308(Object named:K67:5;"Minuts")
	If (Not:C34(Is nil pointer:C315($PtrMinuts)))
		$NbPopup:=2
	End if 
End if 

If ($NbPopup>0)
	
	  //----------------- RÉCUPÉRATION DESCONTRAINTES --------------------------------------
	
	TimePicker__GetTimeMin (->$MinTime)
	TimePicker__GetTimeMax (->$MaxTime)
	TimePicker__GetStep (->$Step)
	
	  //----------------- RECALCUL (OU NON) DE L'HEURE SAISIE --------------------------------------
	
	$Time:=?00:00:00?
	If ($Recalc)
		
		Case of 
				
			: ($NbPopup=1)
				
				
				  //$ValPopHours:=Num($PtrHours->{$PtrHours->})
				  //$Time:=3600*$ValPopHours
				
				$ValPopHours:=($PtrHours->)-1
				$Time:=$MinTime+($Step*$ValPopHours)
				
			: ($NbPopup=2)
				
				  //$ValPopHours:=Num($PtrHours->{$PtrHours->})  // ca ne marche pas a cause de AM/PM   num("3am") = num("3pm")
				  //$ValPopMinuts:=Num($PtrMinuts->{$PtrMinuts->})
				  //$Time:=(3600*$ValPopHours)+(60*$ValPopMinuts)
				
				$ValPopHours:=($ptrHours->)-1
				$ValPopMinuts:=($ptrMinuts->)-1
				  //calcul de l'heure clicquée
				$Time:=(3600*Int:C8($MinTime/3600))+(3600*($ValPopHours))+($Step*$ValPopMinuts)
				
		End case 
		
	Else 
		
		TimePicker__GetSelectedTime (->$Time)
		
	End if 
	
	  //-------------------- MISE EN CONFORMITÉ PAR RAPPORT AUX CONTRAINTES ------------------------
	
	$Time:=($Time+?24:00:00?)%(24*3600)
	
	Case of 
		: ($Time<$MinTime)
			$Time:=$MinTime
		: ($Time>$MaxTime) & ($MaxTime#?00:00:00?)
			$Time:=$MaxTime
	End case 
	
	  // ---------------------- RÉAFFECTATION DANS LES POPUPS DE SAISIE ----------------------------
	
	$Safety:=0
	
	Repeat 
		$Safety:=$Safety+1
		
		Case of 
				
			: ($NbPopup=1)
				
				$Id:=Round:C94(($Time-$MinTime)/$Step;0)+1
				If ($Id<=Size of array:C274($PtrHours->))
					$PtrHours->:=$ID
				Else 
					$PtrHours->:=Size of array:C274($PtrHours->)
				End if 
				
				If (Not:C34($Recalc))
					  //dans le cas ou l'heure n'as pas été saissie dans les popup, il faut la recalculer
					  // ca l'affectation des popup provoque un arrondi
					$ValPopHours:=($PtrHours->)-1
					$Time:=$MinTime+($Step*$ValPopHours)
				End if 
				
			: ($NbPopup=2)
				
				$Id:=Round:C94(($Time%3600)/$Step;0)+1
				If ($Id<=Size of array:C274($PtrMinuts->))
					$PtrMinuts->:=$ID
					$Shift:=0
				Else 
					  //passage a l'heure suivante
					$PtrMinuts->:=1
					$Shift:=1
				End if 
				
				$Id:=Int:C8(($Time-$MinTime)/3600)+1+$Shift
				If ($Id<=Size of array:C274($PtrHours->))
					$PtrHours->:=$ID
				Else 
					$PtrHours->:=Size of array:C274($PtrHours->)
				End if 
				
				  // recalculation is mandatory because of rouds that may happen using dropdowns
				
				$ValPopHours:=($ptrHours->)-1
				$ValPopMinuts:=($ptrMinuts->)-1
				  //calcul de l'heure clicquée
				$Time:=(3600*Int:C8($MinTime/3600))+(3600*$ValPopHours)+($Step*$ValPopMinuts)
				
		End case 
		
		$Exit:=False:C215
		Case of 
			: ($Time<$MinTime)
				$Time:=$Time+$Step
			: ($Time>$MaxTime) & ($MaxTime#?00:00:00?)
				$Time:=$Time-$Step
			Else 
				$Exit:=True:C214
		End case 
		
	Until ($Exit) | ($Safety>10)
	
	$Time:=TimePicker__SetSelectedTime ($Time;"")
	
Else 
	
	  // Generic call, do nothing
	
End if 