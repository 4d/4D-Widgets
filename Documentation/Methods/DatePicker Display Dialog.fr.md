# DatePicker Afficher Boîte de Dialogue

> DatePicker Display Dialog {( gauche ; haut {; dateDéfaut})} -> Résultat

| Paramètre | Type | | Description |
| --- | --- | --- | --- |
| gauche | Entier long | → | Emplacement gauche de la fenêtre |
| haut | Entier long | → | Emplacement haut de la fenêtre |
| dateDéfaut | Date | → | Date à présélectionner dans le calendrier |
| Résultat | Date | ← | Date sélectionnée par l'utilisateur |

## Description

La commande `DatePicker Display Dialog` ouvre un calendrier DatePicker dans une fenêtre pop up (une fenêtre de type pop up est automatiquement refermée lorsque l'utilisateur clique en-dehors de la fenêtre ou appuie sur la touche **Entrée** ou **Echap**).

![](../images/pict307838.fr.png)

Les deux paramètres optionnels `gauche` et `haut` permettent de définir l'emplacement de l'angle supérieur gauche de la fenêtre à ouvrir. Ces deux paramètres doivent être passés ensemble ; si un seul est passé, il est ignoré. Si ces paramètres sont omis, la fenêtre est ouverte à l'emplacement du clic.

Vous pouvez passer une date dans le paramètre `dateDéfaut` afin d'afficher le calendrier DatePicker avec une date présélectionnée.

DatePicker Display Dialog retourne la date sélectionnée par l'utilisateur dans le calendrier DatePicker. Si la fenêtre est refermée sans qu'une date ait été sélectionnée, la commande retourne une date vide (!00/00/00!), même si une date avait été passée dans le paramètre `dateDéfaut`.

## Exemple

Cet exemple affiche un calendrier DatePicker en cas de clic sur un bouton :

```4d
 OBJET LIRE COORDONNEES(*;"MonBtnCalendrier";$x1;$y1;$x2;$y2)  
 $MaDateLocale:=DatePicker Display Dialog($x1;$y1)  
 Si($MaDateLocale #!00/00/00!)  
    [Evenement]DateRV:=$MaDateLocale  
 Fin de si
```
