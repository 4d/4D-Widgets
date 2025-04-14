# DatePicker SET MAX DATE

> DatePicker SET MAX DATE ( nomObjet ; dateMax )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| nomObjet | Texte | → | Nom d’objet sous-formulaire |
| dateMax | Date | → | Limite supérieure de la date saisissable |

## Description

La commande DatePicker SET MAX DATE permet de spécifier la date maximale saisissable dans le calendrier DatePicker (les jours situés après cette date maximale apparaissent grisés dans le calendrier).

Le paramètre `nomObjet` spécifie l’instance du sous-formulaire à laquelle la commande doit être appliquée. Dans ce paramètre, vous devez passer le nom d’un objet sous-formulaire affiché dans le formulaire courant.

La date `dateMax` doit être exprimée dans le format d’entrée par défaut correspondant à la langue du système. Si vous passez une date vide (!00/00/00!), toutes les dates suivant la date courante seront saisissables.

Si la date maximale saisissable est antérieure à la date minimale saisissable (voir [DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.fr.md)), aucune date ne sera saisissable.

### Exemple  

Désactivation de toutes les dates après le 31 décembre 2009 dans l’objet nommé "ReturnDate" :

```4d
 DatePicker SET MAX DATE("ReturnDate";!12/31/2009!)
```

## Voir aussi

[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.fr.md)  
[DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.fr.md)
