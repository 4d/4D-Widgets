//%attributes = {"invisible":true,"shared":true}
#DECLARE($left : Integer; $top : Integer; $date : Date) : Date

return cs:C1710._date.new().displayDialog($left; $top; $date)