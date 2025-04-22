# 🧩 TimePicker und TimeEntry  

Das Widget TimePicker ist ein leicht zu handhabendes Objekt, über das Sie Felder mit Zeitangabe attraktiver darstellen können. Es gibt Formen:

* Einfaches oder doppeltes Popup-Menü:  
    ![](images/pict308493.en.png) ![](images/pict308495.en.png)

* Bereiche für Zeiteingabe im Format "hh:mm:ss" mit Zähler, um Stunden, Minuten oder Sekunden vor- oder zurückzuzählen:  
    ![](images/pict308497.en.png)

* Uhr (*TimeDisplay*) oder digitale Uhr (*TimeDisplayLCD*):  
    ![](images/pict1239685.fr.png) ![](images/pict1239687.fr.png)

Darüberhinaus kann jede Art von TimePicker die Zeit im 12-Stunden (AM-PM) oder 24-Stundenformat anzeigen.

Das Objekt TimePicker ist ohne Programmierung verwendbar, da seine Funktionsweise über die gebundene (bound) Variable gesteuert wird. Wollen Sie dagegen diese Funktionsweise anpassen, können Sie den Satz mitgelieferter Komponentenmethoden verwenden.

## Erstellung und Verwendung  

Sie können einen Bereich TimePicker auf zwei Arten in ein Formular einfügen:

* Durch Einfügen eines Objekts "TimePicker" oder "TimeEntry" aus der vorkonfigurierten Objektbibliothek von 4D.
* Durch Erstellen eines Bereichs Unterformular und Zuweisen des Detail Formulars **TimePicker** oder **TimeEntry**.

Dann definieren Sie den Namen der Zeitvariablen, die dem Unterformular zugewiesen ist (Eigenschaft "Variablenname" in der Eigenschaftenliste). Beim Ausführen des Formulars enthält diese Variable automatisch die vom Benutzer gewählte Zeit. Ändern Sie umgekehrt den Wert dieser Variablen per Programmierung, wird er automatisch im Unterformular angezeigt. Sie können die Variable auch unbenannt lassen, um den dynamischen Variablenmechanismus zu nutzen.

## Widget Clock (neu in Version 14)

Das Widget "Clock" ist in SVG gezeichnet, und ist ein Vektorbild, das Ändern von Größe- und Proportionen im Anwendungmodus zulässt (im Designmodus ist die Größe fest):

![](images/pict1239707.fr.png)

Beachte das:

* Für die Anzeige als Uhr lässt sich mit der Methode [TimePicker DISPLAY SECOND HAND](Methods/TimePicker%20DISPLAY%20SECOND%20HAND.md) der Sekundenzeiger ein- oder ausblenden.
* Die Uhr wechselt, je nach Zeit, automatisch in den Tag- oder Nacht-Modus:  
    ![](images/pict1239740.fr.png)  
    Die Zeiteinteilung ist 8:00:00 -> 19:59:59 = Tag, 20:00 -> 07:59:59 = Nacht.
* Das Wiget "digital clock" ist transparent und ohne Hintergrund, so lässt es sich auch auf farbige Objekte setzen. Die Anzeige lässt sich z.B. wie folgt variieren:  
    ![](images/pict1239718.fr.png)  
    Für dieses Wigdet gibt es verschiedene Anzeigeoptionen, die über Komponentenmethoden mit der Vorsilbe "TimePicker LCD" verfügbar sind.

**Hinweis:** Entwickler können diese Uhrdarstellung durch eigene Kreationen ersetzen. Dazu ersetzen sie einfach die Datei "clock.svg", die im Ordner "Resources" auf der ersten Ebene liegt.

## Aktuelle oder statische Zeit anzeigen

Uhren können entweder die aktuelle Zeit dynamisch anzeigen oder eine statische Zeit anzeigen.

* Zur Anzeige der **aktuellen Zeit** und funktioniert wie eine Uhr:
  * Wenn Sie eine Variable als Datenquelle verwenden, verknüpfen Sie eine **Ganzzahl**-Variable mit dem Unterformularobjekt des Widgets (Standard).
  * Wenn Sie eine **Objekteigenschaft** als Datenquelle verwenden (z.B. Form.myTime), verknüpfen Sie einen **Ganzzahl**- oder **Zeitwert** mit dem Unterformularobjekt des Widgets.

**Hinweis**: Sie können einen Offset auf die angezeigte Zeit anwenden: Der Wert der Zahlenvariablen gibt den Offset in Sekunden an. Beispiel: 3600 = Vorstellen der Uhr um eine Stunde, -1800 = Zurückstellen der Uhr um 30 Minuten, usw.

* Zur Anzeige einer **statischen Zeit**:
  * Wenn Sie eine **Variable** als Datenquelle verwenden, verknüpfen Sie eine **Zeit**- oder **Textvariable** mit dem Unterformularobjekt des Widgets (über die Sprache oder die Eigenschaftsliste).
  * Wenn Sie eine **Objekteigenschaft** als Datenquelle verwenden (z.B. Form.myTime), verknüpfen Sie einen **Textwert** mit dem Unterformularobjekt des Widgets.

Wir möchten zum Beispiel, dass die Uhr 10:10:30 anzeigt:

* mit einer Variablen als Datenquelle

```4d
 C_TIME(myTime) // myTime ist die Datenquelle des Widgets
 myTime:=?10:10:30?
 
  // equivalent to:
 C_TEXT(myOtherTime) // myOtherTime ist die Datenquelle des Widgets
 myOtherTime:="10:10:30"
```

* mit einer Objekteigenschaft als Datenquelle:

```4d
 Form.myTime:="10:10:30" // Form.myTime ist die Datenquelle für das Widget
```

![](images/pict1239765.fr.png)
