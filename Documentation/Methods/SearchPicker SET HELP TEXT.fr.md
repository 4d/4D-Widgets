# SearchPicker SET HELP TEXT

> SearchPicker SET HELP TEXT ( nomObjet ; texteAide )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| nomObjet | Texte | → | Nom d'objet sous-formulaire |
| texteAide | Texte | → | Texte à afficher |

## Description

La commande `SearchPicker SET HELP TEXT` vous permet d'afficher un texte gris non saisissable en arrière-plan de la zone de recherche désignée par `nomObjet`. Ce texte disparaît lorsque l'utilisateur clique dans la zone.

### Exemple  

Affichage du mot "Country" dans la zone, indiquant que la recherche portera sur cette variable :

```4d
 SearchPicker SET HELP TEXT("vRech";"Country")
```

![](../images/pict308485.fr.png)
