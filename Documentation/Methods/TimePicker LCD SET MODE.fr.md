# TimePicker LCD SET MODE

> TimePicker LCD SET MODE ( nomObjet ; mode )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| nomObjet | Texte | → | Nom d'objet sous-formulaire |
| mode | Entier long | → | 12 = afficher l'heure sur 12 heures, 24 = afficher l'heure sur 24 heures |

## Description

La commande `TimePicker LCD SET MODE` permet de configurer l'affichage sur 12 heures ou 24 heures de l'objet de sous-formulaire `nomObjet` (horloge digitale uniquement).

Par défaut, l'objet est affiché sur 12 heures. Si vous souhaitez passer en mode "24 heures", passez la valeur 24 dans `mode`. Dans ce cas, il est généralement judicieux de masquer les lettres AM/PM (cf. commande [TimePicker LCD AFFICHER AMPM](TimePicker%20LCD%20DISPLAY%20AMPM.fr.md)).

### Exemple  

On souhaite passer en mode 24 heures et masquer les lettres AM/PM :

```4d
 TimePicker LCD SET MODE("Subform1";24)
 TimePicker LCD DISPLAY AMPM("Subform1";Faux)
```

![](../images/pict1239968.fr.png)

## Voir aussi

[TimePicker LCD DISPLAY AMPM](TimePicker%20LCD%20DISPLAY%20AMPM.fr.md)