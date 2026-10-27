---
order: 70
icon: ":briefcase:"
---

L'idée de ce module est de simplifier la saisie des travaux effectué hors exercices et séances planifiées.
Un exemple sont les travaux de maintenance ou les roulages de véhicules.

Pour commencer à utiliser ce module, il est nécessaire de configurer les différents types souhaités dans `Configuration`.
Une fois cela effectué, il est possible de saisir directement les travaux effectués.

![Fenêtre pour ajouter un travail](../images/modal-travail.jpg)

Il existe deux permissions différentes pour ajouter des travaux, `saisie personelle` permettant de saisir uniquement un travail pour soi-même et `saisie commune` permettant de saisir pour plusieurs personnes.

Les travaux doivent être validé afin de pouvoir être comptabilisé.

![Fenêtre de revue d'un travail](../images/modal-revue-travail.jpg)

## Fiches liées à une intervention ou un exercice

Certains travaux découlent directement d'une intervention ou d'un exercice, par exemple la rédition du matériel ou l'administratif. Ils se saisissent depuis l'onglet `Présences` de l'événement, dans la carte **Travaux liés à l'intervention** (respectivement **à l'exercice**), et sont alors rattachés à celui-ci.

Une fiche peut aussi être rattachée depuis la liste des fiches de travail ou depuis `Mes infos` : lorsque le type de travail le permet, le champ **Lié à** propose les interventions et exercices de l'exercice comptable. Avec le droit de lecture des interventions (respectivement des exercices), tous sont proposés ; sinon, seuls ceux auxquels on a participé ou été convoqué.

Une fiche liée suit son événement :

- elle est créée en attente et s'examine comme toute fiche, depuis la liste des fiches de travail ou depuis l'événement, par une personne disposant de la validation des fiches de travail ou de celle des interventions (respectivement des exercices) ;
- l'événement ne peut être validé qu'une fois toutes ses fiches liées examinées (acceptées ou refusées) ;
- une fois l'événement validé, seule une personne disposant de sa validation peut encore y ajouter des fiches, qui sont alors directement acceptées ;
- elle est imputée en même temps que l'événement, et non depuis la comptabilité ;
- une fois l'événement imputé (ou l'exercice annulé), ses fiches ne changent plus.

Dans la liste des fiches de travail et dans `Mes infos`, la colonne **Lié à** indique l'événement et permet de s'y rendre.

## Configuration

Les différents travaux types disponibles sont à saisir et paramétrer dans `Configuration`. Pour chaque type, on définit :

- une désignation et une unité (ex. heure, forfait) ;
- une ou plusieurs lignes tarif + compte comptable, chacune associée à un type d'écriture (**Solde**, **Indemnité**, **Frais forfaitaire** ou **Frais effectif**) — voir le guide [Comptabilité](comptabilite.md) pour le détail de ce que chaque type implique (imposition, cotisations) ;
- une catégorie comptable ;
- le lien avec un événement : le type peut être liable à une intervention et/ou à un exercice, et ce lien peut être rendu obligatoire. Un type à lien obligatoire se saisit uniquement depuis l'événement ;
- un statut **Actif** permettant de désactiver un type sans le supprimer (il n'apparaît plus au choix lors de la saisie, mais reste visible sur les fiches déjà créées).

## Permissions

Voici les 5 permissions existantes :

- Lecture : Visualisation des travaux saisis par l'ensemble des sapeurs
- Saisie personnelle : Permet la saisie de travaux uniquement pour sa propre personne
- Saisie commune : Permet la saisie de travaux pour n'importe qui
- Validation : Permet de valider les fiches de travail
- Configuration : Pour configurer les travaux types
