# DatePicker SET DEFAULT 1ST DAY

> DatePicker SET DEFAULT 1ST DAY ( dayNum )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| dayNum | Longint | ⬅️ | First day of the week |
## Description

The DatePicker SET DEFAULT 1ST DAY command is used to set the first day of the week to be displayed by default in the left part of all DatePicker calendars.

In the [dayNum](# "First day of the week") parameter, pass one of the following 4D constants found in the `[`Days and Months` theme:

| Constant | Type | Value |
| --- | --- | --- |
| Sunday | Longint | 1   |
| Monday | Longint | 2   |
| Tuesday | Longint | 3   |
| Wednesday | Longint | 4   |
| Thursday | Longint | 5   |
| Friday | Longint | 6   |
| Saturday | Longint | 7   |
Note that this parameter is only taken into account for calendars created subsequently and does not apply to any existing calendars. If you want to apply it to existing calendars, you must use the [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md "DatePicker APPLY DEFAULT VALUES") component method.

## See also

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md)  
[DatePicker SET WEEK FIRST DAY](DatePicker%20SET%20WEEK%20FIRST%20DAY.md)
