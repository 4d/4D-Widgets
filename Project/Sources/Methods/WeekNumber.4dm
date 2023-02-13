//%attributes = {}
#DECLARE($date : Date)->$weekNumber : Integer
var $startDate : Date
$startDate:=Date:C102(String:C10(Year of:C25($date))+"-01-01T00:00:00")
var $days : Real
$days:=/*floor?(*/(GetTimestamp($date)-GetTimestamp($startDate))/(24*60*60)/*)*/
$weekNumber:=$days/7+1  // ceil