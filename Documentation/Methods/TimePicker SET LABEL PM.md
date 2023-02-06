# TimePicker SET LABEL PM

> TimePicker SET LABEL PM ( objectName ; label )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | ⬅️ | Name of subform object |
| label | Text | ⬅️ | Label to use for PM |
## Description

The TimePicker SET LABEL PM command is used to modify the "PM" label in TimePicker objects displaying the AM/PM format. The command applies to the object designated by [objectName](# "Name of subform object"). By default, the system am/pm labels are used.

### Example  

Using by default the "in the evening" label instead of the system label for PM:

```4d
 TimePicker SET LABEL PM("clock";"in the evening")
```

## See also

[TimePicker SET DEFAULT LABEL PM](TimePicker%20SET%20DEFAULT%20LABEL%20PM.md)  
[TimePicker SET LABEL AM](TimePicker%20SET%20LABEL%20AM.md)
