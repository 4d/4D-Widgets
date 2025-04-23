# DatePicker SET DEFAULT MIN DATE

> DatePicker SET DEFAULT MIN DATE ( minDatum )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| minDatum | Datum | → | Untere Grenze des eingebbaren Datums |

## Beschreibung

Der Befehl `DatePicker SET DEFAULT MIN DATE` setzt das eingebbare Maximumdatum für alle Kalender der Komponente DatePicker.

Beachten Sie, dass dieser Parameter nur für nachfolgend erstellte Kalender berücksichtigt wird und nicht für bereits vorhandene Kalender. Soll er auch für diese gelten, müssen Sie den Befehl [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.de.md) verwenden.

### Beispiel  

Minimumdatum auf 1. Januar 2000 setzen:

```4d
 DatePicker SET DEFAULT MIN DATE(!01.01.2000!)
```

## Siehe auch

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.de.md)  
[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.de.md)  
[DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.de.md)
