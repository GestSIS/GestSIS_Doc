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

## Configuration

Les différents travaux types disponibles sont à saisir et paramétrer dans `Configuration`. Pour chaque type, on définit :

- une désignation et une unité (ex. heure, forfait) ;
- une ou plusieurs lignes tarif + compte comptable, chacune associée à un type d'écriture (**Solde**, **Indemnité**, **Frais forfaitaire** ou **Frais effectif**) — voir le guide [Comptabilité](comptabilite.md) pour le détail de ce que chaque type implique (imposition, cotisations) ;
- une catégorie comptable ;
- un statut **Actif** permettant de désactiver un type sans le supprimer (il n'apparaît plus au choix lors de la saisie, mais reste visible sur les fiches déjà créées).

## Permissions

Voici les 5 permissions existantes :

- Lecture : Visualisation des travaux saisis par l'ensemble des sapeurs
- Saisie personnelle : Permet la saisie de travaux uniquement pour sa propre personne
- Saisie commune : Permet la saisie de travaux pour n'importe qui
- Validation : Permet de valider les fiches de travail
- Configuration : Pour configurer les travaux types
