//%attributes = {"invisible":true}
//Calculate the first displayed day of a month
// usually this day belongs to the previous month

var $1 : Date
var $2 : Text

var $date : Date

var $FirstDayOfWeek : Real

var $CurrentMonth : Integer
var $CurrentYear : Integer
var $JapaneseYearCode : Integer

var $FirstDisplayedDay : Date

var $Ptr_MonthesArray; $PtrDisplayedMonth : Pointer

var $Form : Text
var $PositionMonth_t; $PositionYear_t : Text
var $dateLongPattern : Text
var $separator : Text


If (Count parameters:C259>=1)
	$date:=$1
	If (Count parameters:C259>=2)
		$Form:=$2
	End if 
Else 
	Tool_ObjectToVar("SelectedDate"; ->$date)
End if 

If ($date=!00-00-00!)
	$date:=Current date:C33
End if 

$CurrentMonth:=Month of:C24($date)
$CurrentYear:=Year of:C25($date)

$Ptr_MonthesArray:=OBJECT Get pointer:C1124(Object named:K67:5; "_ListMonthes"; $Form)
If (Not:C34(Is nil pointer:C315($Ptr_MonthesArray)))
	If (Size of array:C274($Ptr_MonthesArray->)>=12)
		$PtrDisplayedMonth:=Self:C308(Object named:K67:5; "DisplayedMonth"; $Form)
		If (Not:C34(Is nil pointer:C315($PtrDisplayedMonth)))
			
			// Affichage de l'entete (yyyy MMM ou MMM yyyy)
			
			GET SYSTEM FORMAT:C994(Short date month position:K60:13; $PositionMonth_t)
			GET SYSTEM FORMAT:C994(Short date year position:K60:14; $PositionYear_t)
			
			If (Num:C11($PositionMonth_t)<Num:C11($PositionYear_t))  // cas standard
				
				$PtrDisplayedMonth->:=$Ptr_MonthesArray->{$CurrentMonth}+" "+String:C10($CurrentYear; "0000")  //\n
				
			Else   // cas -vraisemblablement- japonais (voir le si / sinon / fin de si)
				
				GET SYSTEM FORMAT:C994(System date long pattern:K60:9; $dateLongPattern)
				$JapaneseYearCode:=24180
				If (Position:C15(Char:C90($JapaneseYearCode); $dateLongPattern)>0)
					$separator:=Char:C90($JapaneseYearCode)
				Else 
					$separator:=" "  // pas japonais finalement !!! ;o)
				End if 
				
				$PtrDisplayedMonth->:=String:C10($CurrentYear; "0000")+$separator+$Ptr_MonthesArray->{$CurrentMonth}
				
			End if 
			
			
			$FirstDisplayedDay:=Add to date:C393(!00-00-00!; $CurrentYear; $CurrentMonth; 1)  //1er du mois affich
			
			DatePicker__GetWeekFirstDay(->$FirstDayOfWeek; $Form)  //1-2-3-4-5-6-7
			Tool_VarToObject(->$FirstDisplayedDay; "FirstOfCurrentMonth"; $Form)
			
			If ($FirstDayOfWeek>=1) & ($FirstDayOfWeek<=7)
				//décrémente le 1er jour affichjusqu'tomber sur le jour semaine souhaitéô
				While (Day number:C114($FirstDisplayedDay)#$FirstDayOfWeek)
					$FirstDisplayedDay:=$FirstDisplayedDay-1
				End while 
			End if 
			
			Tool_VarToObject(->$FirstDisplayedDay; "FirstDisplayedDay"; $Form)
			
		Else 
			//ALERT("Object "+"“DisplayedMonth”"+"not found")
		End if 
	Else 
		//array not initialised (normal in some cases)
	End if 
Else 
	//ALERT("Object "+"“_ListMonthes”"+"not found")
End if 
