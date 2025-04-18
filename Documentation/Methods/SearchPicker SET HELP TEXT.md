# SearchPicker SET HELP TEXT

> SearchPicker SET HELP TEXT ( objectName ; helpText )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | → | Name of subform object |
| helpText | Text | → | Text to display |

## Description

The `SearchPicker SET HELP TEXT` command is used to display a non-enterable grayed-out text in the background of the search area specified by `objectName`. This text disappears when the user clicks in the area.

### Example  

Displays the word "Country" in the area, indicating that the search will concern this variable:

```4d
 SearchPicker SET HELP TEXT("vSearch";"Country")
```

![](../images/pict308485.en.png)
