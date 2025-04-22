# DatePicker SET DEFAULT DAYS OFF

> DatePicker SET DEFAULT DAYS OFF ( TagTyp ; ZgrFeiertageArray )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| TagTyp | Lange Ganzzahl | → | Art der Feiertage |
| ZgrFeiertageArray | Zeiger | → | Zeiger auf Array Datum oder Boolean mit Feiertagen |

## Beschreibung

Der Befehl `DatePicker SET DEFAULT DAYS OFF` setzt die Feiertage, die in allen Kalendern der Komponente DatePicker erscheinen sollen. Diese Tage erscheinen in fett und kursiv und bleiben für den Benutzer auswählbar.

Beachten Sie, dass diese Einstellung nur für nachfolgend erstellte Kalender berücksichtigt wird und nicht für bereits bestehende Kalender. Soll sie auch für diese gelten, müssen Sie die Komponentenmethode [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY DEFAULT VALUES.md) einsetzen.

Mit dieser Komponentenmethode können Sie sowohl wöchentlich oder jährlich wiederkehrende freie Tage als auch bewegliche Feiertage setzen. Die Art des freien Tages setzen Sie im Parameter `TagTyp`:

* 0 = Wöchentlich auftretende freie Tage (standardmäßig Samstag und Sonntag)
* 1 = Feste Feiertage, die sich jedes Jahr wiederholen, wie z.B. 1. Januar oder 1. Mai)
* 2 = bewegliche Feiertage, die für ein einzelnes Jahr gelten, z.B. Ostermontag

Um die Feiertage zu setzen, erstellen Sie ein Array und übergeben im Parameter `ZgrFeiertageArray` einen Zeiger auf dieses Array. Sein Typ richtet sich nach dem in `TagTyp` übergebenen Wert:

* Übergeben Sie 0 in `TagTyp` (wöchentliche freie Tage), müssen Sie in `ZgrFeiertageArray` einen Zeiger auf ein Array vom Typ Boolean mit 7 Elementen übergeben. Jedes auf Wahr gesetzte Element gibt einen freien Tag in der Woche an.
* Übergeben Sie 1 oder 2 in `TagTyp` (jährliche oder bewegliche freie Tage), müssen Sie in `ZgrFeiertageArray` einen Zeiger auf ein Array vom Typ Datum übergeben. In diesem Array muss jedes Element ein gültiges Datum für einen Feiertag enthalten. Die Datumsangaben müssen im Standardformat der Systemsprache ausgedrückt werden. Haben Sie 1 im Parameter `TagTyp` übergeben (wiederkehrende Tage), wird das Jahr ignoriert; Sie können jeden Wert übergeben.

### Beispiel  

Bezeichnung fester Feiertage (Beispiel gültig für Deutschland):

```4d
 ARRAY DATE($arrdRepeatedDays;0)  
  //Das Jahr wird ignoriert; wir verwenden standardmäßig 2000  
 APPEND TO ARRAY($arrdRepeatedDays;!01.01.2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!06.01.2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!01.05.2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!15.08.2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!03.10.2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!01.11.2000!)  
 APPEND TO ARRAY($arrdRepeatedDays;!26.12.2000!)  
 DatePicker SET DEFAULT DAYS OFF(1;->$arrdRepeatedDays)
```

## Siehe auch

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md)  
[DatePicker SET DAYS OFF](DatePicker%20SET%20DAYS%20OFF.md)
