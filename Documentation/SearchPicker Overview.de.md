# SearchPicker

## Überblick

Mit dem Widget SearchPicker können Sie mühelos standardmäßige Suchbereiche anlegen, ähnlich wie Suchbereiche in Browsern oder Werkzeugleisten. Die Darstellung richtet sich nach der jeweiligen Plattform.

**Windows:**  
![Windows](images/pict308433.en.png)  
**Mac OS:**  
![Mac OS](images/pict308435.en.png)

Der standardmäßig im Bereich angezeigte Text lässt sich per Programmierung steuern, und zwar über die Komponentenmethode [SearchPicker SET HELP TEXT](Methods/Methods/SearchPicker%20SET%20HELP%20TEXT.de.md).

### Funktionsweise

Ein Suchbereich SearchPicker hat zusätzlich zu seiner Darstellung folgende Merkmale: Text in Grauschrift, Eingabebereich und Icon zum Löschen.

- **Eingabebereich:** Im Eingabebereich wird der zu suchende Wert eingegeben. Dieser Wert wird automatisch der Variablen zugewiesen, die Sie mit dem Bereich in der Eigenschaftenliste gebunden haben (Eigenschaft Variablenname). Über diese Variable liefern Sie den gesuchten Wert für die Suchmethode.
- **Text in Grauschrift:** Der Text in Grauschrift dient als Hilfe, die dem Benutzer das Feld bzw. die Felder anzeigt, wo die Suche ausgeführt wird. Er verschwindet, sobald der Bereich den Fokus hat. Dieser Text lässt sich über den Befehl [SearchPicker SET HELP TEXT](Methods/Methods/SearchPicker%20SET%20HELP%20TEXT.de.md) setzen.
- **Icon zum Löschen:** Mit dem Icon Löschen lässt sich der Inhalt im Bereich löschen. Er funktioniert automatisch.

Während der Ausführung können Sie Ihre Suchmethode durch Anklicken einer eigenen Schaltfläche im Formular oder in einem Formularereignis starten. Der Bereich erzeugt die Ereignisse **On Data Change** und **On Losing Focus**. Sie können eine dynamische Suche liefern, die immer, wenn der Benutzer ein anderes Zeichen eingibt, durch Aufrufen der Suchmethode im Ereignis **On Data Change** neu bewertet wird.

### Erstellung

Sie können einen Bereich SearchPicker auf zwei Arten in ein Formular einfügen:

1. Durch Einfügen eines Bereichs "SearchPicker" aus der vorkonfigurierten Objektbibliothek von 4D (Kategorie "Eingabebereiche").
2. Durch Erstellen eines Bereichs Unterformular und Zuweisen des Detail Formulars **SearchPicker**.  
   ![Subform](images/pict308455.en.png)

Dann definieren Sie den Namen der Variablen, welche Sie dem Unterformular zuweisen (Eigenschaft "Variablenname" in der Eigenschaftenliste). Beim Ausführen des Formulars enthält diese Variable automatisch den vom Benutzer gesuchten Wert, den Sie dann in Ihrer eigenen Suchmethode übergeben können.
