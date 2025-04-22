# TimePicker APPLY DEFAULT VALUES

> TimePicker APPLY DEFAULT VALUES ( ObjektName )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| ObjektName | Text | → | Name des Objekts Unterformular |

## Beschreibung

Der Befehl `TimePicker APPLY DEFAULT VALUES` setzt alle TimePicker Parameter auf ihre Standardwerte für das Unterformular zurück, angegeben in `ObjektName`.

Das können die Standardeinstellungen, aber auch die Anpassungen über SET DEFAULT Befehle der Komponente sein.
Der Befehl wirkt sich unmittelbar aus: die Standardwerte von `ObjektName` werden sofort geändert. Beachten Sie, dass sich die dem Objekt zugewiesene Variable ebenfalls ändern kann, um die neuen Werte zu berücksichtigen. Setzt z.B. der neue Standardwert die Minimumzeit auf 07:00:00 und war die `ObjektName` zugeordnete Variable 06:00:00, wird der Wert automatisch auf 07:00:00 gesetzt.

Die Parameter für TimePicker enthalten:

* die eingebbaren Minimum- und Maximumzeiten
* die Bezeichnungen AM und PM
* die Intervalle in Minuten

## Siehe auch

[TimePicker RESET DEFAULT VALUES](TimePicker%20RESET%20DEFAULT%20VALUES.md)  
[TimePicker SET DEFAULT LABEL AM](TimePicker%20SET%20DEFAULT%20LABEL%20AM.md)  
[TimePicker SET DEFAULT LABEL PM](TimePicker%20SET%20DEFAULT%20LABEL%20PM.md)  
[TimePicker SET DEFAULT MAX TIME](TimePicker%20SET%20DEFAULT%20MAX%20TIME.md)  
[TimePicker SET DEFAULT MIN TIME](TimePicker%20SET%20DEFAULT%20MIN%20TIME.md)  
[TimePicker SET DEFAULT STEP](TimePicker%20SET%20DEFAULT%20STEP.md)
