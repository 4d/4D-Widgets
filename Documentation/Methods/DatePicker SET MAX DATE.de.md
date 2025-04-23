# DatePicker SET MAX DATE

> DatePicker SET MAX DATE ( ObjektName ; maxDatum )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| ObjektName | Text | → | Name des Objekts Unterformular |
| maxDatum | Datum | → | Obere Grenze des eingebbaren Datums |

## Beschreibung

Der Befehl `DatePicker SET MAX DATE` setzt das eingebbare Maximumdatum in einen DatePicker Kalender. Die darauf folgenden Tage sind dann im Kalender in Grauschrift gesetzt.

Der Parameter `ObjektName` gibt die Instanz des Unterformulars an, für welche die Funktion gelten soll. In diesem Parameter müssen Sie den Namen des Objekts Unterformular übergeben, das im aktuellen Formular angezeigt wird.

Das Datum `maxDatum` muss im Standard Eingabeformat der Systemsprache eingegeben werden. Übergeben Sie ein leeres Datum, (!00.00.00!), sind alle Datumsangaben eingebbar, die nach dem aktuellen Datum liegen.

Liegt das eingebbare Maximumdatum vor dem Minimumdatum (siehe [DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.de.md)), wird kein Datum eingegeben.

### Beispiel  

Alle Datumsangaben nach dem 31.Dezember 2009 im Objekt "ReturnDate" deaktivieren:

```4d
 DatePicker SET MAX DATE("ReturnDate";!31.12.2009!)
```

## Siehe auch

[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.de.md)  
[DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.de.md)
