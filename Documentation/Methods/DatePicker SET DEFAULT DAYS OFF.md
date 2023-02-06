# DatePicker SET DEFAULT DAYS OFF

> DatePicker SET DEFAULT DAYS OFF ( dayType ; ptrDaysOffArray )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| dayType | Longint | ⬅️ | Types of days off |
| ptrDaysOffArray | Pointer | ⬅️ | Pointer to date or Boolean array of days off |
## Description

The DatePicker SET DEFAULT DAYS OFF command is used to set the days off that will appear in all the calendars of the DatePicker component. These days are displayed in bold and italic and remain selectable for the user.

Note that this setting is only taken into account for calendars that are created subsequently and does not apply to any existing calendars. If you want to apply it to the existing calendars, you will need to use the [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md "DatePicker APPLY DEFAULT VALUES") component method.

The command can be used to set recurrent weekly or yearly days off as well as occasional holidays. You specify the type of days off set by the method via the [dayType](# "Types of days off") parameter:

* 0 = Days off occurring weekly (by default, Saturday and Sunday)
* 1 = Days off that occur every year (such as January 1st or December 25th)
* 2 = Occasional holidays, set for a single year

You set the holidays by creating a array and by passing a pointer to this array as the [ptrDaysOffArray](# "Pointer to date or Boolean array of days off") parameter. The type of array depends on the value passed in [dayType](# "Types of days off"):

* If you pass 0 in [dayType](# "Types of days off") (weekly days off), in [ptrDaysOffArray](# "Pointer to date or Boolean array of days off") you must pass a pointer to a Boolean array made up of 7 elements. Each element set to True indicates a weekly day off.
* If you pass 1 or 2 in [dayType](# "Types of days off") (yearly or occasional days off), in [ptrDaysOffArray](# "Pointer to date or Boolean array of days off") you must pass a pointer to a Date array. In this array, each element must contain a valid date, indicating a day off. The dates must be expressed in the default format corresponding to the system language. If you passed 1 in [dayType](# "Types of days off") (recurrent days), the year is ignored; you can pass any value.

### Example  

Designation of recurrent holidays (example valid for the USA):

```4d
 ARRAY DATE($arrdRepeatedDays;0)  
  //The year is ignored; we use 2000 by default  
 APPEND TO ARRAY($arrdRepeatedDays;!01/01/2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!02/02/2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!02/14/2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!03/17/2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!04/01/2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!10/31/2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!11/11/2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!12/25/2000!)  
 DatePicker SET DEFAULT DAYS OFF(1;->$arrdRepeatedDays)
```

## See also

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md)  
[DatePicker SET DAYS OFF](DatePicker%20SET%20DAYS%20OFF.md)
