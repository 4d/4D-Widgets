# TimePicker APPLY DEFAULT VALUES

> TimePicker APPLY DEFAULT VALUES ( nomObjet )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| nomObjet | Texte | → | Nom d'objet sous-formulaire |

## Description

La commande `TimePicker APPLY DEFAULT VALUES` permet de réinitialiser tous les paramètres TimePicker à leur valeur par défaut courante pour l'objet de sous-formulaire `nomObjet`.

Ces valeurs par défaut peuvent être les réglages d'usine mais peuvent également avoir été modifiées via les commandes SET DEFAULT du composant.  
L'action de la commande est immédiate : les valeurs par défaut de `nomObjet` sont instantanément modifiées. A noter que la variable associée à l'objet pourra également être modifiée afin de tenir compte des nouvelles valeurs. Par exemple, si les nouvelles valeurs par défaut fixent l'heure minimale à 07:00:00 et que la variable associée à `nomObjet` était 06:00:00, sa valeur est automatiquement ramenée à 07:00:00.

Les paramètres TimePicker incluent :

* les heures saisissables minimales et maximales,
* les libellés AM et PM,
* les intervalles de minutes.

## Voir aussi

[TimePicker RESET DEFAULT VALUES](TimePicker%20RESET%20DEFAULT%20VALUES.fr.md)  
[TimePicker SET DEFAULT LABEL AM](TimePicker%20SET%20DEFAULT%20LABEL%20AM.fr.md)  
[TimePicker SET DEFAULT LABEL PM](TimePicker%20SET%20DEFAULT%20LABEL%20PM.fr.md)  
[TimePicker SET DEFAULT MAX TIME](TimePicker%20SET%20DEFAULT%20MAX%20TIME.fr.md)  
[TimePicker SET DEFAULT MIN TIME](TimePicker%20SET%20DEFAULT%20MIN%20TIME.fr.md)  
[TimePicker SET DEFAULT STEP](TimePicker%20SET%20DEFAULT%20STEP.fr.md)
