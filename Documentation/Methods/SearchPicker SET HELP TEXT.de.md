# SearchPicker SET HELP TEXT

> SearchPicker SET HELP TEXT ( ObjektName ; HilfeText )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| ObjektName | Text | → | Name des Objekts Unterformular |
| HilfeText | Text | → | Anzuzeigender Text |

## Beschreibung

Der Befehl `SearchPicker SET HELP TEXT` setzt einen nicht-eingebbaren in grau gesetzten Text im Hintergrund des Suchbereichs, definiert in `ObjektName`. Dieser Text verschwindet, wenn der Benutzer in den Bereich klickt.

### Beispiel  

Zeigt das Wort "Country" im Bereich und gibt an, dass die Suche diese Variable betrifft:

```4d
 SearchPicker SET HELP TEXT("vSearch";"Country")
```

![](../images/pict308485.en.png)
