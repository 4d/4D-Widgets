# DatePicker APPLY DEFAULT VALUES

> DatePicker APPLY DEFAULT VALUES ( objectName )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | ⬅️ | Name of subform object |
## Description

The DatePicker APPLY DEFAULT VALUES command is used to reset all the DatePicker parameters to their default values for the [objectName](# "Name of subform object") subform object.

These default values may be the factory settings but may also have been modified via the SET DEFAULT commands of the component.  
The action of this command is immediate: the default values of [objectName](# "Name of subform object") are instantly modified. Note that the variable associated with the object could also be modified in order to take the new values into account. For example, if the new default values set the minimum date to 01/01/2000 and the variable associated with [objectName](# "Name of subform object") was 05/05/1995, its value is automatically returned to 01/01/2000.

The DatePicker parameters include:

* minimum or maximum enterable dates
* the first day of the week
* weekly and yearly "days off" as well as specific holidays

### Example  

This example resets the parameters of the Date1 object to their default settings:

```4d
 DatePicker APPLY DEFAULT VALUES("Date1")
```

## See also

[DatePicker RESET DEFAULT VALUES](DatePicker%20RESET%20DEFAULT%20VALUES.md)  
[DatePicker SET DEFAULT 1ST DAY](DatePicker%20SET%20DEFAULT%201ST%20DAY.md)  
[DatePicker SET DEFAULT DAYS OFF](DatePicker%20SET%20DEFAULT%20DAYS%20OFF.md)  
[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.md)  
[DatePicker SET DEFAULT MIN DATE](DatePicker%20SET%20DEFAULT%20MIN%20DATE.md)
