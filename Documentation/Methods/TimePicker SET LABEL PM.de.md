# TimePicker SET LABEL PM

> TimePicker SET LABEL PM ( ObjektName ; Bezeichnung )

| Parameter | Type | | Description |
| --- | --- | --- | --- |
| ObjektName | Text | → | Name des Objekts Unterformular |
| Bezeichnung | Text | → | Bezeichnung anstelle von PM |

## Beschreibung

Der Befehl `TimePicker SET LABEL PM` ändert die Bezeichnung "PM" in TimePicker Objekten, die im Format AM/PM angezeigt werden. Der Befehl gilt für das in ObjektName angegebene Objekt. Standardmäßig werden die Systembezeichnungen am/pm verwendet.

### Beispiel

Standardmäßig statt der Systembezeichnung PM die Bezeichnung "abends" verwenden:

```4d
 TimePicker SET LABEL PM("Uhr";"abends")
```

## Siehe auch

[TimePicker SET DEFAULT LABEL PM](TimePicker%20SET%20DEFAULT%20LABEL%20PM.de.md)  
[TimePicker SET LABEL AM](TimePicker%20SET%20LABEL%20AM.de.md)
