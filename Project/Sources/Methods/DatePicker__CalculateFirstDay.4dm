//%attributes = {"invisible":true}
  //Calculate the first displayed day of a month
  // usually this day belongs to the previous month

C_DATE:C307($1)
C_TEXT:C284($2)

C_DATE:C307($Date)

C_REAL:C285($FirstDayOfWeek)
C_REAL:C285($FirstDayOfWeek)

C_LONGINT:C283($CurrentMonth)
C_LONGINT:C283($CurrentYear)
C_LONGINT:C283($JapaneseYearCode)

C_DATE:C307($FirstDisplayedDay)

C_POINTER:C301($Ptr_MonthesArray;$PtrDisplayedMonth)

C_TEXT:C284($Form)
C_TEXT:C284($PositionMonth_t;$PositionYear_t)
C_TEXT:C284($DateLongPattern)
C_TEXT:C284($Separator)


If (Count parameters:C259>=1)
	$Date:=$1
	If (Count parameters:C259>=2)
		$Form:=$2
	End if 
Else 
	Tool_ObjectToVar ("SelectedDate";->$Date)
End if 

If ($Date=!00-00-00!)
	$Date:=Current date:C33
End if 

$CurrentMonth:=Month of:C24($Date)
$CurrentYear:=Year of:C25($Date)

$Ptr_MonthesArray:=OBJECT Get pointer:C1124(Object named:K67:5;"_ListMonthes";$Form)
If (Not:C34(Is nil pointer:C315($Ptr_MonthesArray)))
	If (Size of array:C274($Ptr_MonthesArray->)>=12)
		$PtrDisplayedMonth:=Self:C308(Object named:K67:5;"DisplayedMonth";$Form)
		If (Not:C34(Is nil pointer:C315($PtrDisplayedMonth)))
			
			  // Affichage de l'entete (yyyy MMM ou MMM yyyy)
			
			GET SYSTEM FORMAT:C994(Short date month position:K60:13;$PositionMonth_t)
			GET SYSTEM FORMAT:C994(Short date year position:K60:14;$PositionYear_t)
			
			If (Num:C11($PositionMonth_t)<Num:C11($PositionYear_t))  // cas standard
				
				$PtrDisplayedMonth->:=$Ptr_MonthesArray->{$CurrentMonth}+" "+String:C10($CurrentYear;"0000")  //\n
				
			Else   // cas -vraisemblablement- japonais (voir le si / sinon / fin de si)
				
				GET SYSTEM FORMAT:C994(System date long pattern:K60:9;$DateLongPattern)
				$JapaneseYearCode:=24180
				If (Position:C15(Char:C90($JapaneseYearCode);$DateLongPattern)>0)
					$Separator:=Char:C90($JapaneseYearCode)
				Else 
					$Separator:=" "  // pas japonais finalement !!! ;o)
				End if 
				
				$PtrDisplayedMonth->:=String:C10($CurrentYear;"0000")+$Separator+$Ptr_MonthesArray->{$CurrentMonth}
				
			End if 
			
			
			$FirstDisplayedDay:=Add to date:C393(!00-00-00!;$CurrentYear;$CurrentMonth;1)  //1er du mois affich
			
			DatePicker__GetWeekFirstDay (->$FirstDayOfWeek;$Form)  //1-2-3-4-5-6-7
			Tool_VarToObject (->$FirstDisplayedDay;"FirstOfCurrentMonth";$Form)
			
			If ($FirstDayOfWeek>=1) & ($FirstDayOfWeek<=7)
				  //décrémente le 1er jour affichjusqu'tomber sur le jour semaine souhaitéô
				While (Day number:C114($FirstDisplayedDay)#$FirstDayOfWeek)
					$FirstDisplayedDay:=$FirstDisplayedDay-1
				End while 
			End if 
			
			Tool_VarToObject (->$FirstDisplayedDay;"FirstDisplayedDay";$Form)
			
		Else 
			  //ALERT("Object "+"“DisplayedMonth”"+"not found")
		End if 
	Else 
		  //array not initialised (normal in some cases)
	End if 
Else 
	  //ALERT("Object "+"“_ListMonthes”"+"not found")
End if 
