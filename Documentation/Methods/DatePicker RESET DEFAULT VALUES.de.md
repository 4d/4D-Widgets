# DatePicker RESET DEFAULT VALUES

> DatePicker RESET DEFAULT VALUES

## Beschreibung

Der Befehl `DatePicker RESET DEFAULT VALUES` setzt alle Parameter im Kalender DatePicker auf die Standardeinstellung zurück. Nach Ausführung des Befehls gilt folgendes:

* das eingebbare Minimum- oder Maximumdatum ist 00.00.00, d.h. es gibt keine Begrenzung
* der erste Tag der Woche ist 2, das ist Montag
* die freien Tage in der Woche sind Samstag und Sonntag
* es sind keine freien Tage im Jahr und keine Feiertage gesetzt

Beachten Sie, dass dieser Parameter nur für nachfolgend erstellte Kalender berücksichtigt wird und nicht für bereits vorhandene Kalender. Soll er auch für diese gelten, müssen Sie den Befehl [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md) verwenden.

## Siehe auch

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md)
