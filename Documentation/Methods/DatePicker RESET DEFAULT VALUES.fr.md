# DatePicker RÉINITIALISER VALEURS PAR DÉFAUT

> DatePicker RESET DEFAULT VALUES

## Description

La commande `DatePicker RESET DEFAULT VALUES` réinitialise les paramètres du composant DatePicker à leurs "réglages d'usine". Après l'exécution de cette méthode composant :

* les dates saisissables minimale et maximale sont 00/00/00 (ce qui signifie qu'il n'y a pas de limites)
* le premier jour de la semaine est 2 (lundi)
* les "jours de congés" hebdomadaires sont le samedi et le dimanche
* aucun jour férié annuel ni spécifique n'est défini.

A noter que ce paramétrage est pris en compte uniquement pour les calendriers créés par la suite et n'est pas appliqué aux calendriers existants. Si vous souhaitez l'appliquer aux calendriers existants, vous devez utiliser la commande [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.fr.md).

## Voir aussi

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.fr.md)
