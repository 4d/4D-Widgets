var $24Hours : Boolean:=OBJECT Get value:C1743(OBJECT Get name:C1087)
TimePicker LCD SET MODE("LCD"; 12+(12*Num:C11($24Hours)))

If ($24Hours)
	
	OBJECT SET VALUE:C1742("ampm"; False:C215)
	OBJECT SET ENABLED:C1123(*; "ampm"; False:C215)
	
Else 
	
	OBJECT SET ENABLED:C1123(*; "ampm"; True:C214)
	
End if 