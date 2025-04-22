# DatePicker SET MIN DATE

> DatePicker SET MIN DATE ( ObjektName ; minDatum )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| ObjektName | Text | → | Name des Objekts Unterformular |
| minDatum | Datum | → | Untere Grenze des eingebbaren Datums |

## Beschreibung

Der Befehl `DatePicker SET MIN DATE` setzt das eingebbare Minimumdatum in einem DatePicker Kalender. Die davor liegenden Tage sind dann im Kalender in Grauschrift gesetzt.

Der Parameter `ObjektName` gibt die Instanz des Unterformulars an, für welche die Funktion gelten soll. In diesem Parameter müssen Sie den Namen eines Objekts Unterformular übergeben, das im aktuellen Formular angezeigt wird.

Das Datum `minDatum` muss im Standard Eingabeformat der Systemsprache eingegeben werden. Übergeben Sie ein leeres Datum, (!00.00.00!), sind alle Datumsangaben eingebbar, die vor dem aktuellen Datum liegen.

Liegt das eingebbare Minimumdatum nach dem eingebbaren Maximumdatum, ist kein Datum eingebbar (siehe [DatePicker SET MAX DATE](DatePicker%20SET%20MAX%20DATE.md)).

### Beispiel  

Das aktuelle Formular enthält zwei DatePicker Kalender, die in zwei Unterformularen mit Namen "DP1" und "DP2" liegen.

```4d
  //Im ersten Kalender alle Daten vor dem 1. Januar 2009 deaktivieren
 DatePicker SET MIN DATE("DP1";!01.01.2009!)
  //Im 2. Kalender alle Daten vor dem 1. März 2009 deaktivieren
 DatePicker SET MIN DATE("DP2";!01.03.2009!)
```

## Siehe auch

[DatePicker SET DEFAULT MIN DATE](DatePicker%20SET%20DEFAULT%20MIN%20DATE.md)  
[DatePicker SET MAX DATE](DatePicker%20SET%20MAX%20DATE.md)
