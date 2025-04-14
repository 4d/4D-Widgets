# TimePicker SET LABEL AM

> TimePicker SET LABEL AM ( nomObjet ; libellé )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| nomObjet | Texte | → | Nom d'objet sous-formulaire |
| libellé | Texte | → | Libellé à utiliser pour AM |

## Description

La commande `TimePicker SET LABEL AM` permet de modifier le libellé "AM" dans les objets TimePicker affichant le format AM/PM. La commande s'applique à l'objet désigné par `nomObjet`. Par défaut, les libellés système am/pm sont utilisés.

### Exemple  

Utilisation par défaut du libellé "du matin" au lieu du libellé système pour AM :

```4d
 TimePicker SET LABEL AM("horloge";"du matin")
```

## Voir aussi

[TimePicker SET DEFAULT LABEL AM](TimePicker%20SET%20DEFAULT%20LABEL%20AM.fr.md)  
[TimePicker SET LABEL PM](TimePicker%20SET%20LABEL%20PM.fr.md)