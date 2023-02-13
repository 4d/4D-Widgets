//%attributes = {}
#DECLARE($date : Date; $time : Time)->$epoc : Integer
// copyed from forum, maybe could do better...
var $vt_timestampUtc : Text
$vt_timestampUtc:=String:C10($date; ISO date GMT:K1:10; $time)
$vt_timestampUtc:=Substring:C12($vt_timestampUtc; 1; 19)  //remove the"Z"

C_DATE:C307($vd_dateUtc)
C_TIME:C306($vh_timeUtc)
XML DECODE:C1091($vt_timestampUtc; $vd_dateUtc)
XML DECODE:C1091($vt_timestampUtc; $vh_timeUtc)

$epoc:=(($vd_dateUtc-!1970-01-01!)*86400)+$vh_timeUtc
