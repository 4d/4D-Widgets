var vStartTime : Time
var vStartDate : Date


vStartTime:=Current time:C178+((Random:C100%10)*(3600/4))
Form:C1466.startTime:=vStartTime

vStartDate:=Add to date:C393(Current date:C33; 0; 0; Random:C100%100)
Form:C1466.startDate:=vStartDate
