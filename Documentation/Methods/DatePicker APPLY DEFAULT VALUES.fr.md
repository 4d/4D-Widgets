# DatePicker APPLY DEFAULT VALUES

> DatePicker APPLY DEFAULT VALUES ( nomObjet )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| nomObjet | Texte | → | Nom d’objet sous-formulaire |

## Description

La commande `DatePicker APPLY DEFAULT VALUES` permet de réinitialiser tous les paramètres DatePicker à leur valeur par défaut pour l’objet de sous-formulaire `nomObjet`.

Ces valeurs par défaut peuvent être les réglages d’usine mais peuvent également avoir été modifiées via les commandes SET DEFAULT du composant.  
L’action de cette commande est immédiate : les valeurs par défaut de `nomObjet` sont instantanément modifiées. À noter que la variable associée à l’objet pourra également être modifiée afin de tenir compte des nouvelles valeurs. Par exemple, si les nouvelles valeurs par défaut fixent la date minimale au 01/01/2000 et que la variable associée à `nomObjet` était le 05/05/1995, sa valeur est automatiquement ramenée au 01/01/2000.

Les paramètres DatePicker incluent :

* les dates saisissables minimale et maximale
* le premier jour de la semaine
* les "jours de congés" hebdomadaires, annuels et spécifiques

### Exemple  

Cet exemple réinitialise les paramètres de l’objet Date1 à leurs réglages par défaut :

```4d
 DatePicker APPLY DEFAULT VALUES("Date1")
```

## Voir aussi

[DatePicker RESET DEFAULT VALUES](DatePicker%20RESET%20DEFAULT%20VALUES.fr.md)  
[DatePicker SET DEFAULT 1ST DAY](DatePicker%20SET%20DEFAULT%201ST%20DAY.fr.md)  
[DatePicker SET DEFAULT DAYS OFF](DatePicker%20SET%20DEFAULT%20DAYS%20OFF.fr.md)  
[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.fr.md)  
[DatePicker SET DEFAULT MIN DATE](DatePicker%20SET%20DEFAULT%20MIN%20DATE.fr.md)
