# TimePicker SET LABEL AM

> TimePicker SET LABEL AM ( ObjektName ; Bezeichnung )

| Parameter | Type | | Description |
| --- | --- | --- | --- |
| ObjektName | Text | → | Name des Objekts Unterformular |
| Bezeichnung | Text | → | Bezeichnung anstelle von AM |

## Beschreibung

Der Befehl `TimePicker SET LABEL AM` ändert die Bezeichnung "AM" in TimePicker Objekten, die im Format AM/PM angezeigt werden. Der Befehl gilt für das in ObjektName angegebene Objekt. Standardmäßig werden die Systembezeichnungen am/pm verwendet.

### Beispiel

Standardmäßig statt der Systembezeichnung AM die Bezeichnung "morgens" verwenden:

```4d
 TimePicker SET LABEL AM("<Uhr";"morgens")
```

## Siehe auch

[TimePicker SET DEFAULT LABEL AM](TimePicker%20SET%20DEFAULT%20LABEL%20AM.md)  
[TimePicker SET LABEL PM](TimePicker%20SET%20LABEL%20PM.md)
