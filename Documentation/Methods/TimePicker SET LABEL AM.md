# TimePicker SET LABEL AM

> TimePicker SET LABEL AM ( objectName ; label )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | ⬅️ | Name of subform object |
| label | Text | ⬅️ | Label to use for AM |
## Description

The TimePicker SET LABEL AM command is used to modify the "AM" label in TimePicker objects displaying the AM/PM format. The command applies to the object designated by [objectName](# "Name of subform object"). By default, the system am/pm labels are used.

### Example  

Using by default the "in the morning" label instead of the system label for AM:

```4d
 TimePicker SET LABEL AM("clock";"in the morning")
```

## See also

[TimePicker SET DEFAULT LABEL AM](TimePicker%20SET%20DEFAULT%20LABEL%20AM.md)  
[TimePicker SET LABEL PM](TimePicker%20SET%20LABEL%20PM.md)
