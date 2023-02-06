# TimePicker LCD SET COLOR

> TimePicker LCD SET COLOR ( objectName ; color {; colorG ; colorB} )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| objectName | Text | ⬅️ | Name of subform object |
| color | Longint | ⬅️ | Value of RGB color (4 bytes) or Value of red component (0..255) if the other parameters are passed |
| colorG | Longint | ⬅️ | Value of green component (0..255) |
| colorB | Longint | ⬅️ | Value of blue component (0..255) |
## Description

The **TimePicker LCD SET COLOR** command sets the colors for the digits in the [objectName](# "Name of subform object") subform object (digital clock only).

This command accepts two syntaxes:

* If you only pass the [color](# "Value of RGB color (4 bytes) or
    Value of red component (0..255) if the other parameters are passed") parameter, you must pass a 4-byte longint whose format (0x00RRGGBB) is described below (the bytes are numbered from 0 to 3, starting from right to left):  

    |     |     |
    | --- | --- |
    | **Byte** | **Description** |
    | 3   | Must be zero for an absolute RGB color |
    | 2   | Red component of color (0..255) |
    | 1   | Green component of color (0..255) |
    | 0   | Blue component of color (0..255) |

* You can also pass three parameters: [color](# "Value of RGB color (4 bytes) or
    Value of red component (0..255) if the other parameters are passed"), [colorG](# "Value of green component (0..255)") and [colorB](# "Value of blue component (0..255)"). In this case, each parameter must be a number between 0 and 255, representing a component of the RGB color.

### Example  

Change the clock digits to red:

```4d
 TimePicker LCD SET COLOR("Subform1";0x00FF0000)  
  // can also be written: TimePicker LCD SET COLOR ("Subform1";255;0;0)
```

![](https://doc.4d.com/4Dv19/picture/1239854/pict1239854.fr.png)
