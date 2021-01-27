Case of 
	: (Form event code:C388=On Getting Focus:K2:7)
		
		OBJECT SET VISIBLE:C603(*;"FocusRing@";True:C214)
		
	: (Form event code:C388=On Losing Focus:K2:8)
		
		OBJECT SET VISIBLE:C603(*;"FocusRing@";False:C215)
		
	: (Form event code:C388=On Data Change:K2:15)
		
		DatePicker__RecalcDate (True:C214)
		
End case 

