# DatePicker SET MIN DATE

> DatePicker SET MIN DATE ( nomObjet ; dateMin )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| nomObjet | Texte | → | Nom d’objet sous-formulaire |
| dateMin | Date | → | Limite inférieure de la date saisissable |

## Description

La commande DatePicker SET MIN DATE permet de définir la date minimale saisissable dans un calendrier DatePicker (les jours situés avant cette date minimale apparaissent grisés dans le calendrier).

Le paramètre `nomObjet` spécifie l’instance du sous-formulaire à laquelle la commande doit être appliquée. Dans ce paramètre, vous devez passer le nom d’un objet sous-formulaire affiché dans le formulaire courant.

La date `dateMin` doit être exprimée dans le format d’entrée par défaut correspondant à la langue du système. Si vous passez une date vide (!00/00/00!), toutes les dates précédant la date courante seront saisissables.

Si la date minimale saisissable est postérieure à la date maximale saisissable (voir [DatePicker SET MAX DATE](DatePicker%20SET%20MAX%20DATE.fr.md)), aucune date ne sera saisissable.

### Exemple  

Le formulaire courant contient deux calendriers DatePicker situés dans deux objets sous-formulaire nommés "DP1" et "DP2".

```4d
  //Désactivation de toutes les dates avant le 1er janvier 2009 dans le premier calendrier  
 DatePicker SET MIN DATE("DP1";!01/01/2009!)  
  //Désactivation de toutes les dates avant le 1er mars 2009 dans le second calendrier  
 DatePicker SET MIN DATE("DP2";!03/01/2009!)
```

## Voir aussi

[DatePicker SET DEFAULT MIN DATE](DatePicker%20SET%20DEFAULT%20MIN%20DATE.fr.md)  
[DatePicker SET MAX DATE](DatePicker%20SET%20MAX%20DATE.fr.md)
