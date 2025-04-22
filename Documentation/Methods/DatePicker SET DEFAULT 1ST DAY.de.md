# DatePicker SET DEFAULT 1ST DAY

> DatePicker SET DEFAULT 1ST DAY ( TagNum )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| TagNum | Lange Ganzzahl | → | Erster Tag der Woche |

## Beschreibung

Der Befehl `DatePicker SET DEFAULT 1ST DAY` setzt den ersten Tag der Woche, der standardmäßig im linken Teil aller DatePicker Kalender erscheinen soll.

Im Parameter `TagNum` übergeben Sie eine der nachfolgenden 4D Konstanten unter dem Thema `Days and Months`:

| Konstante | Typ | Wert |
| --- | --- | --- |
| Sunday | Lange Ganzzahl | 1   |
| Monday | Lange Ganzzahl | 2   |
| Tuesday | Lange Ganzzahl | 3   |
| Wednesday | Lange Ganzzahl | 4   |
| Thursday | Lange Ganzzahl | 5   |
| Friday | Lange Ganzzahl | 6   |
| Saturday | Lange Ganzzahl | 7   |

Beachten Sie, dass dieser Parameter nur für nachfolgend erstellte Kalender berücksichtigt wird und nicht für bereits vorhandene Kalender. Soll er auch für diese gelten, müssen Sie den Befehl [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md) verwenden.

## Siehe auch

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md)  
[DatePicker SET WEEK FIRST DAY](DatePicker%20SET%20WEEK%20FIRST%20DAY.md)
