# TimePicker LCD DÉFINIR COULEUR

> TimePicker LCD SET COLOR ( nomObjet ; coul {; coulV ; coulB} )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| nomObjet | Texte | → | Nom d'objet sous-formulaire |
| coul | Entier long | → | Valeur de la couleur RVB (4 octets) ou Valeur de la composante rouge (0..255) si les autres paramètres sont passés |
| coulV | Entier long | → | Valeur de la composante verte (0..255) |
| coulB | Entier long | → | Valeur de la composante bleue (0..255) |

## Description

La commande `TimePicker LCD DÉFINIR COULEUR` vous permet de définir les couleurs des chiffres de l'objet de sous-formulaire `nomObjet` (horloge digitale uniquement).

Cette commande admet deux syntaxes :

* Si vous passez uniquement le paramètre `coul`, vous devez passer un entier long de 4 octets dont le format (0x00RRGGBB) est décrit ci-dessous (les octets sont numérotés de 0 à 3 de la droite vers la gauche) :  

    |     |     |
    | --- | --- |
    | **Octet** | **Description** |
    | 3   | Doit être zéro pour une couleur RVB absolue |
    | 2   | Composante rouge de la couleur (0..255) |
    | 1   | Composante verte de la couleur (0..255) |
    | 0   | Composante bleue de la couleur (0..255) |

* Vous pouvez également passer trois paramètres : `coul`, `coulV` et `coulB`. Dans ce cas, chaque paramètre doit être compris entre 0 et 255 et représente une composante de la couleur RVB.

### Exemple  

Passage des chiffres de l'horloge en rouge :

```4d
 TimePicker LCD SET COLOR("Subform1";0x00FF0000)  
  // peut aussi s'écrire TimePicker LCD SET COLOR ("Subform1";255;0;0)
```

![](../images/pict1239854.fr.png)