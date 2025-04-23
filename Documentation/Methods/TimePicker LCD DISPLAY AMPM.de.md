# TimePicker LCD DISPLAY AMPM

> TimePicker LCD DISPLAY AMPM ( ObjektName ; amPm )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| ObjektName | Text | → | Name des Objekts Unterformular |
| amPm | Boolean | → | Wahr = AM/PM anzeigen, Falsch = AM/PM nicht anzeigen |

## Beschreibung

Der Befehl `TimePicker LCD DISPLAY AMPM` blendet im Unterformular `ObjektName` nach den Ziffern AM/PM ein oder aus (nur digitale Uhr).

Damit wird im 12-Stundenmodus zwischen Vormittag und Nachmittag unterschieden (siehe [TimePicker LCD SET MODE](TimePicker%20LCD%20SET%20MODE.de.md)).

Standardmäßig werden diese Buchstaben angezeigt. Um sie auszublenden, übergeben Sie im Parameter `amPm` **Falsch**.

### Beispiel  

AM/PM ausblenden:

```4d
 TimePicker LCD DISPLAY AMPM("Unterformular1";False)
```

![](../images/pict1239891.fr.png)

## Siehe auch

[TimePicker LCD SET MODE](TimePicker%20LCD%20SET%20MODE.de.md)
