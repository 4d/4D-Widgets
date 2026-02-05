var $variant:=OBJECT Get subform container value:C1785
var $date:=Value type:C1509($variant)=Is date:K8:7 ? Date:C102($variant) : Current date:C33
OBJECT SET SUBFORM CONTAINER VALUE:C1784(Date:C102(cs:C1710._datePicker.new($date).date))
