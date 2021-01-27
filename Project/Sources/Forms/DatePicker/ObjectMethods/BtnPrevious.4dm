C_DATE:C307($FirstOfCurrentMonth)
Tool_ObjectToVar ("FirstOfCurrentMonth";->$FirstOfCurrentMonth)  //page 2
$FirstOfCurrentMonth:=$FirstOfCurrentMonth-1

$FirstOfCurrentMonth:=Add to date:C393(!00-00-00!;Year of:C25($FirstOfCurrentMonth);Month of:C24($FirstOfCurrentMonth);1)
Tool_VarToObject (->$FirstOfCurrentMonth;"FirstOfCurrentMonth";"")

DatePicker__CalculateFirstDay ($FirstOfCurrentMonth)

DatePicker__RedrawCalendar 

