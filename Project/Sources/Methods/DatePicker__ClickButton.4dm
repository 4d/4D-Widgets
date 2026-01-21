//%attributes = {"invisible":true}
var $1 : Text

If ($1#"")
	var $PtrFirstDisplayedDay : Pointer
	var $FirstDisplayedDay : Date
	var $ClickedDate : Date
	
	$PtrFirstDisplayedDay:=Self:C308(Object named:K67:5; "FirstDisplayedDay")
	If (Not:C34(Is nil pointer:C315($PtrFirstDisplayedDay)))
		
		$FirstDisplayedDay:=$PtrFirstDisplayedDay->
		$ClickedDate:=$FirstDisplayedDay+Num:C11($1)-1
		
		$ClickedDate:=DatePicker__SetSelectedDate($ClickedDate; "")
		DatePicker__CalculateFirstDay($ClickedDate; "")
		DatePicker__RedrawCalendar
		
		If (<>DatePicker_CloseDial)
			Form:C1466.displayDate:=$ClickedDate
			ACCEPT:C269
		End if 
		
	Else 
		//ALERT("Debug: no FirstDisplayedDay local var")
	End if 
Else 
	//ALERT("Debug: "+Current method name+" $1 is empty")
End if 
