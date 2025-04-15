# DatePicker SET DEFAULT MIN DATE

> DatePicker SET DEFAULT MIN DATE ( dateMin )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| dateMin | Date | → | Limite inférieure de date saisissable |

## Description

La commande DatePicker SET DEFAULT MIN DATE vous permet de définir la date saisissable minimale pour la totalité des calendriers du composant DatePicker. 

A noter que ce paramétrage est pris en compte uniquement pour les calendriers créés par la suite et n'est pas appliqué aux calendriers existants. Si vous souhaitez l'appliquer aux calendriers existants, vous devez utiliser la commande [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.md).

### Exemple  

Désignation de la date minimale au 1er janvier 2000 :

```4d
DatePicker SET DEFAULT MIN DATE(!01/01/2000!)
```

## Voir aussi

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.fr.md)  
[DatePicker SET DEFAULT MAX DATE](DatePicker%20SET%20DEFAULT%20MAX%20DATE.fr.md)  
[DatePicker SET MIN DATE](DatePicker%20SET%20MIN%20DATE.fr.md)
