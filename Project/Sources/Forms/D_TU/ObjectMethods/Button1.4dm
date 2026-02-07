// Numérique = dynamique
var vShift1 : Integer:=7200
Form:C1466.shift1:=vShift1+?12:00:00?

// Time = statique
var vStaticTime1 : Time:=?10:15:30?

// Only ONE exception
// String = statique
Form:C1466.staticTime1:=String:C10(vStaticTime1)