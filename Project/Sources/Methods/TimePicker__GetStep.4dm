//%attributes = {"invisible":true}
#DECLARE() : Time

var $time : Time:=objectGetValue("Step")

If ($time=?00:00:00?)
	
	$time:=<>TimePicker_Step
	
End if 

return $time