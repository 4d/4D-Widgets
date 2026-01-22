//%attributes = {"invisible":true}
#DECLARE($on : Boolean)

OBJECT SET VALUE:C1742("withSeconds"; $on)
OBJECT SET VALUE:C1742("redraw"; True:C214)

SET TIMER:C645(-1)  // Will redraw the image according to the associated variable