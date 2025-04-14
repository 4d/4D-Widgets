# imePicker SET STEP 

> TimePicker SET STEP ( nomObjet ; intervalle )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| nomObjet | Texte | → | Nom d'objet sous-formulaire |
| intervalle | Heure | → | Intervalle entre deux valeurs d'heures |

## Description

La commande `TimePicker SET STEP` permet de définir l'intervalle entre les valeurs d'heures disponibles pour l'objet désigné par `nomObjet`. Ce paramétrage s'applique aux TimePickers affichés sous forme de pop up menus uniquement.

La valeur d'`intervalle` doit être comprise entre 1 mn et 1 heure et doit pouvoir être représentée sous forme de divisions entières de 60 mn. En pratique, seules les valeurs de 1, 2, 3, 4, 5, 6, 10, 12, 15, 20, 30 et 60 mn sont possibles. Toute valeur différente sera automatiquement arrondie de manière à correspondre à ce principe.

### Exemple  

Paramétrage du TimePicker en pop up menu nommé "heure1", limitation des heures saisissables de 8h30 à 16h30 et intervalles de 10 mn :

```4d
 TimePicker SET MIN TIME("heure1";?08:30:00?)
 TimePicker SET MAX TIME("heure1";?16:30:00?)
 TimePicker SET STEP("heure1";?00:10:00?)
```

![](../images/pict308616.fr.png)

## Voir aussi

[TimePicker SET DEFAULT STEP](TimePicker%20SET%20DEFAULT%20STEP.fr.md)