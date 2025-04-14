# DatePicker DÉFINIR 1ER JOUR PAR DÉFAUT

> DatePicker SET DEFAULT 1ST DAY ( numJour )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| numJour | Entier long | → | Numéro du premier jour à afficher |

## Description

La commande **DatePicker DÉFINIR 1ER JOUR PAR DÉFAUT** vous permet de désigner le premier jour de la semaine à afficher par défaut dans la partie gauche des calendriers DatePicker.

Dans le paramètre `numJour`, passez une des constantes 4D suivantes du thème `Jours et Mois` :

| Constante | Type | Valeur |
| --- | --- | --- |
| Dimanche | Entier long | 1   |
| Lundi | Entier long | 2   |
| Mardi | Entier long | 3   |
| Mercredi | Entier long | 4   |
| Jeudi | Entier long | 5   |
| Vendredi | Entier long | 6   |
| Samedi | Entier long | 7   |
A noter que ce paramétrage est pris en compte uniquement pour les calendriers créés par la suite et n'est pas appliqué aux calendriers existants. Si vous souhaitez l'appliquer aux calendriers existants, vous devez utiliser la commande [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.fr.md).

## Voir aussi

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.fr.md)  
[DatePicker SET WEEK FIRST DAY](DatePicker%20SET%20WEEK%20FIRST%20DAY.fr.md)