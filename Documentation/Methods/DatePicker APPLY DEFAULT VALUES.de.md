# DatePicker APPLY DEFAULT VALUES

> DatePicker APPLY DEFAULT VALUES ( Objektname )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| Objektname | Text | → | Name des Objekts Unterformular |

## Beschreibung

Der Befehl `DatePicker APPLY DEFAULT VALUES` setzt alle Parameter im Kalender DatePicker auf die Standardwerte des in `Objektname` angegebenen Unterformulars zurück.

Das können die Standardeinstellungen oder die Anpassungen über die SET DEFAULT Befehle der Komponente sein.  
Der Befehl wirkt sich unmittelbar aus: die Standardwerte von `Objektname` werden sofort geändert. Beachten Sie, dass sich die dem Objekt zugewiesene Variable ebenfalls ändern kann, um die neuen Werte zu berücksichtigen. Setzt z.B. der neue Standardwert das Minimumdatum auf 01.01.2000 und war die `Objektname` zugeordnete Variable 05.05.1995, wird der Wert automatisch auf 01.01.2000 gesetzt.

Die Parameter von DatePicker enthalten:

* eingebbares Minimum- oder Maximumdatum
* den ersten Tag der Woche
* Freie Tage in der Woche und im Jahr sowie feste Feiertage

### Beispiel  

Dieses Beispiel setzt die Parameter des Objekts Date1 auf seine Standardwerte zurück:

```4d
 DatePicker APPLY DEFAULT VALUES("Datum1")
```

## Siehe auch

[DatePicker RESET DEFAULT VALUES](DatePicker%20RESET%20DEFAULT%20VALUES.md)  
[DatePicker SET DEFAULT 1ST DAY](DatePicker%20SET%20DEFAULT%201ST%20DAY.md)  
[DatePicker SET DEFAULT DAYS OFF](DatePicker%20SET%20DEFAULT%20DAYS%20OFF.md)  
[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.md)  
[DatePicker SET DEFAULT MIN DATE](DatePicker%20SET%20DEFAULT%20MIN%20DATE.md)
