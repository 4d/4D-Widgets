# TimePicker RESET DEFAULT VALUES

> TimePicker RESET DEFAULT VALUES

## Description

La commande `TimePicker RESET DEFAULT VALUES` réinitialise les paramètres du composant TimePicker à leurs "réglages d'usine". Après l'exécution de cette méthode composant :

* l'heure saisissable minimale est 08:00:00
* l'heure saisissable maximale est 20:00:00
* les libellés AM et PM sont ceux définis dans le système
* l'intervalle de minutes est 00:15:00

A noter que ce paramétrage est pris en compte uniquement pour les objets TimePicker créés par la suite et n'est pas appliqué aux objets existants. Si vous souhaitez l'appliquer aux objets existants, vous devez appeler la commande [TimePicker APPLY DEFAULT VALUES](TimePicker%20APPLY%20DEFAULT%20VALUES.fr.md).

## Voir aussi

[TimePicker APPLY DEFAULT VALUES](TimePicker%20APPLY%20DEFAULT%20VALUES.fr.md)