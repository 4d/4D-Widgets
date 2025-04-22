# TimePicker LCD SET MODE

> TimePicker LCD SET MODE ( ObjektName ; Modus )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| ObjektName | Text | → | Name des Objekts Unterformular |
| Modus | Lange Ganzzahl | → | 12 = Zeitanzeige im 12-Stundenmodus, 24 = Zeitanzeige im 24-Stundenmodus |

## Beschreibung

Der Befehl `TimePicker LCD SET MODE` setzt die Anzeige des Unterformulars `ObjektName` auf den 12- oder 24-Stundenmodus (nur digitale Uhr).

Standardmäßig wird das Objekt im 12-Stundenmodus angezeigt. Um in den 24-Stundenmodus zu wechseln, übergeben Sie im Parameter `Modus` den Wert 24. In diesem Fall sollten Sie auch AM/PM ausblenden (siehe Befehl [TimePicker LCD DISPLAY AMPM](TimePicker%20LCD%20DISPLAY%20AMPM.md)).

### Beispiel  

In den 24-Stundenmodus wechseln und AM/PM ausblenden:

```4d
 TimePicker LCD SET MODE("Subform1";24)  
 TimePicker LCD DISPLAY AMPM("Subform1";False)
```

![](../images/pict1239968.fr.png)

## Siehe auch

[TimePicker LCD DISPLAY AMPM](TimePicker%20LCD%20DISPLAY%20AMPM.md)
