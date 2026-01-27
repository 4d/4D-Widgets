Case of 
		
		//________________________________________________________________________________
	: (Form event code:C388=On Load:K2:1)
		
		//TimePicker__InitInter
		//TimePicker__InitForm
		
		//Form.AM:="<none>"
		//Form.PM:="<none>"
		Form:C1466.Init()
		
		//objectSetValue("AMlabel"; "<none>")
		//objectSetValue("PMlabel"; "<none>")
		
/*
TimePicker__BuildPopup
		
// Common code
var $CurrentTime : Time:=TimePicker__GetTarget
$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime)
TimePicker__DisplayTimePopups(False)
		
CALL SUBFORM CONTAINER(On Load*(-1))  // Usefull when the widget is not in page 1 of the main form
		
//________________________________________________________________________________
: (Form event code=On Bound Variable Change)
		
// Common code
$CurrentTime:=TimePicker__GetTarget
$CurrentTime:=TimePicker__SetSelectedTime($CurrentTime)
TimePicker__DisplayTimePopups(False)
*/
		
		//________________________________________________________________________________
End case 