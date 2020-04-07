//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_BOOLEAN:C305($2)

C_TEXT:C284($ObjectName)
C_BOOLEAN:C305($Enterable)

$ObjectName:=$1
$Enterable:=$2

OBJECT SET ENTERABLE:C238(*;$ObjectName;$Enterable)
Case of 
		
	: ($Enterable)
		OBJECT SET RGB COLORS:C628(*;$ObjectName;Foreground color:K23:1;Background color:K23:2)
		OBJECT SET ENABLED:C1123(*;"CloseButton_Mac";True:C214)  // this object is invisible on windows
		
	: (Not:C34($Enterable))
		OBJECT SET RGB COLORS:C628(*;$ObjectName;Dark shadow color:K23:3;Background color:K23:2)
		OBJECT SET ENABLED:C1123(*;"CloseButton_Mac";False:C215)  // this object is invisible on windows
End case 
