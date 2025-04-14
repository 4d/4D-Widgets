# TimePicker SET LABEL PM

> TimePicker SET LABEL PM ( nomObjet ; libellé )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| nomObjet | Texte | → | Nom d'objet sous-formulaire |
| libellé | Texte | → | Libellé à utiliser pour PM |

## Description

La commande `TimePicker SET LABEL PM` permet de modifier le libellé "PM" dans les objets TimePicker affichant le format AM/PM. La commande s'applique à l'objet désigné par `nomObjet`. Par défaut, les libellés système am/pm sont utilisés.

### Exemple

Utilisation par défaut du libellé "du soir" au lieu du libellé système pour PM :

```4d
 TimePicker SET LABEL PM("horloge";"du soir")
```

## Voir aussi

[TimePicker SET DEFAULT LABEL PM](TimePicker%20SET%20DEFAULT%20LABEL%20PM.fr.md)  
[TimePicker SET LABEL AM](TimePicker%20SET%20LABEL%20AM.fr.md)
