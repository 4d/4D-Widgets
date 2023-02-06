# TimePicker APPLY DEFAULT VALUES

> TimePicker APPLY DEFAULT VALUES ( objectName )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | ⬅️ | Name of subform object |
## Description

The TimePicker APPLY DEFAULT VALUES command is used to reset all the TimePicker parameters to their current default values for the [objectName](# "Name of subform object") subform object.

These default values may be the factory settings but may also have been modified via the SET DEFAULT commands of the component.  
The action of this command is immediate: the default values of [objectName](# "Name of subform object") are instantly modified. Note that the bound variable of the object could also be modified in order to take the new values into account. For example, if the new default values set the minimum time to 07:00:00 and the value of the variable bound with [objectName](# "Name of subform object") was 06:00:00, its value is automatically returned to 07:00:00.

The TimePicker parameters include:

* minimum or maximum enterable times,
* the AM and PM labels,
* the steps in minutes.

## See also

[TimePicker RESET DEFAULT VALUES](TimePicker%20RESET%20DEFAULT%20VALUES.md)  
[TimePicker SET DEFAULT LABEL AM](TimePicker%20SET%20DEFAULT%20LABEL%20AM.md)  
[TimePicker SET DEFAULT LABEL PM](TimePicker%20SET%20DEFAULT%20LABEL%20PM.md)  
[TimePicker SET DEFAULT MAX TIME](TimePicker%20SET%20DEFAULT%20MAX%20TIME.md)  
[TimePicker SET DEFAULT MIN TIME](TimePicker%20SET%20DEFAULT%20MIN%20TIME.md)  
[TimePicker SET DEFAULT STEP](TimePicker%20SET%20DEFAULT%20STEP.md)
