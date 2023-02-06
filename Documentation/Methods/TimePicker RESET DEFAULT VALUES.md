# TimePicker RESET DEFAULT VALUES

> TimePicker RESET DEFAULT 

## Description

The TimePicker RESET DEFAULT VALUES command resets the parameters of the TimePicker component to their "factory settings". After execution of this command:

* the minimum enterable time is 08:00:00
* the maximum enterable time is 20:00:00
* the AM and PM labels are the system labels
* the steps in minutes is 00:15:00

Note that this parameter is only taken into account for TimePicker objects created subsequently and does not apply to any existing objects. If you want to apply it to existing objects, you must use the [TimePicker APPLY DEFAULT VALUES](TimePicker%20APPLY%20DEFAULT%20VALUES.md "TimePicker APPLY DEFAULT VALUES") component method.

## See also

[TimePicker APPLY DEFAULT VALUES](TimePicker%20APPLY%20DEFAULT%20VALUES.m>
d)
