# DatePicker SET DEFAULT DAYS OFF

> DatePicker SET DEFAULT DAYS OFF ( typeJour ; ptrTabJoursCongés )

| Paramètre | Type |     | Description |
| --- | --- | --- | --- |
| typeJour | Entier long | → | Types de jours fériés |
| ptrTabJoursCongés | Pointeur | → | Pointeur vers le tableau date ou booléen des jours de congés |

## Description

La commande DatePicker SET DEFAULT DAYS OFF vous permet de définir les "jours de congés" à faire figurer dans la totalité des calendriers du composant DatePicker. Ces jours sont affichés en gras italique et restent sélectionnables par l'utilisateur. 

A noter que ce paramétrage est pris en compte uniquement pour les calendriers créés par la suite et n'est pas appliqué aux calendriers existants. Si vous souhaitez l'appliquer aux calendriers existants, vous devez utiliser la commande [DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.fr.md).

La méthode composant permet de définir des jours de congés récurrents hebdomadaires ou annuels ainsi que des jours "fériés" ponctuels. Vous précisez le type de jour de congé défini par la méthode via le paramètre typeJour :

* 0 = jours de congés répétés chaque semaine (par défaut, le samedi et le dimanche)
* 1 = jours de congés répétés d'année en année (tels que le 1er janvier ou le 25 décembre)
* 2 = jours fériés ponctuels, définis pour une seule année

Vous définissez les jours à l'aide d'un tableau et en passant un pointeur vers ce tableau comme paramètre ptrTabJoursCongés. Le type de tableau dépend de la valeur passée dans typeJour :

* si vous avez passé 0 dans typeJour (jours de congés hebdomadaires), vous devez passer dans ptrTabJoursCongés un pointeur vers un tableau booléen comportant 7 éléments. Chaque élément à Vrai désigne un jour de congé hebdomadaire.
* si vous avez passé 1 ou 2 dans typeJour (jours de congés annuels ou ponctuels), vous devez passer dans ptrTabJoursCongés un pointeur vers un tableau date. Dans ce tableau, chaque élément doit contenir une date valide, indiquant un jour de congé. Les dates doivent être exprimées dans le format par défaut correspondant à la langue du système. Si vous avez passé 1 dans typeJour (jours récurrents), l'année est ignorée, vous pouvez passer n'importe quelle valeur.

### Exemple  

Désignation des jours fériés récurrents (exemple valide en France) :

```4d
TABLEAU DATE($tdJoursRépétés;0)
  //L'année est ignorée, nous utilisons 2000 par défaut
AJOUTER A TABLEAU($tdJoursRépétés;!01/01/2000!)
AJOUTER A TABLEAU($tdJoursRépétés;!01/05/2000!)
AJOUTER A TABLEAU($tdJoursRépétés;!08/05/2000!)
AJOUTER A TABLEAU($tdJoursRépétés;!14/07/2000!)
AJOUTER A TABLEAU($tdJoursRépétés;!15/08/2000!)
AJOUTER A TABLEAU($tdJoursRépétés;!01/11/2000!)
AJOUTER A TABLEAU($tdJoursRépétés;!11/11/2000!)
AJOUTER A TABLEAU($tdJoursRépétés;!25/12/2000!)
DatePicker SET DEFAULT DAYS OFF(1;->$tdJoursRépétés)
```

## Voir aussi

[DatePicker APPLY DEFAULT VALUES](DatePicker%20APPLY%20DEFAULT%20VALUES.fr.md)  
[DatePicker SET DAYS OFF](DatePicker%20SET%20DAYS%20OFF.fr.md)
