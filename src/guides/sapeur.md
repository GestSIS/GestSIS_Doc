---
order: 95
icon: ":firefighter:"
---

Ce module permet la gestion de l'ensembles des sapeurs et civiles qui collaborent avec le SIS.

Il existe actuellement trois types de personnes, les [!badge sapeurs], les [!badge civils] et les
[!badge recrues] (candidats en attente de validation, voir [Recrutement](./recrutement.md)).

Une même personne peut être à la fois sapeur et civil, en même temps ou l'un après l'autre : par exemple un ancien sapeur qui reste civil après sa fin de service. Elle apparaît alors dans la liste des sapeurs inactifs et dans celle des civils actifs, et garde tout son historique de sapeur (cours, promotions, interventions).

Les sapeurs et civils actifs peuvent créer un compte GestSIS avec l'adresse email de leur fiche (voir [Utilisateurs](./utilisateur.md)). Les recrues ne le peuvent pas tant qu'elles ne sont pas validées.

!!! Informations
La [!badge fonction principale], le [!badge grade actuel] et le statut [!badge actif] sont mis à jour automatiquement afin de reflèter les fonctions, promotions et mutations saisies. Ils ne peuvent ainsi pas être modifié directement.
!!!

## Téléphones

Seuls les numéros de téléphone avec la case `RTA` cochée sont utilisés dans le module RTA. Seuls 3 numéros maximum peuvent être saisis par sapeur.

## Mutations

Les mutations permettent de gérer les déménagements ainsi que les départs du SIS. Chaque mutation est de nature [!badge Sapeur] ou [!badge Civil] : ce sont elles qui déterminent si la personne est sapeur, civil ou les deux, et si elle est active.
Lors du clic sur le bouton [!badge Fin de service], il est possible de supprimer les exercices restants du sapeurs ainsi que de mettre fin à ses fonctions (toutes sont proposées par défaut).

Le bouton [!badge Incorporation civile] ouvre une période civile, par exemple pour un sapeur qui reste civil après sa fin de service. Elle est indépendante des mutations sapeur : une personne peut être sapeur et civil en même temps. Un civil créé depuis le bouton `Ajouter` reçoit directement une incorporation civile à la date saisie, et la période civile se termine en lui saisissant une date de fin.

Lorsqu'un sapeur n'a qu'une seule mutation, le bouton [!badge Repasser en recrue] annule sa validation : sa mutation est supprimée et il repasse en recrue (voir [Recrutement](./recrutement.md)). Cela n'est possible que tant qu'il n'apparaît dans aucun exercice, aucune intervention, aucune écriture et aucun travail.

## Fonctions, Promotion et Permis

Les onglets `Fonctions` et `Promotion` retracent l'historique des fonctions et grades du sapeur — ce sont ces entrées qui alimentent automatiquement la fonction principale et le grade actuel affichés sur sa fiche.

L'onglet `Permis` liste les permis de conduire du sapeur.

L'onglet `Materiel` affiche le matériel actuellement attribué ; la case **Afficher les articles rendus** y ajoute l'historique des attributions passées (voir le guide [Matériel](materiel.md)).

Les autres onglets de la fiche sapeur (`Organisation`, `Banque`, `Exercice`, `Intervention`) reprennent simplement, pour ce sapeur, les données déjà décrites dans les guides [Organisation](organisation.md), [Comptabilité](comptabilite.md), [Exercices & séances](exercice-seances.md) et [Intervention](intervention.md).

## Cours

Lors de l'ajout d'un cours, l'interface permet de générer une promotion (grade) ainsi que de générer une nouvelle fonction.
Les données sont configurées de base mais il est possible de les modifier.

![Fenêtre ajout cours](../images/modal-cours-sapeur.jpg)

## Contrôles médicaux

Les utilisateurs ayant accès au module `Contrôles médicaux` auront un onglet supplémentaire leur permettant de visualiser les contrôles du sapeur.

## Permissions

Voici les 3 permissions existantes :

- Lecture : Visualisation de l'ensemble des données sapeurs
- Modification : Permet la modification des données sapeurs
- Configuration : Pour configurer les fonctions, grades et cours

## Configuration

Sous configurations vous avez la possibilité de configurer les données suivantes :

- Liste des fonctions
- Liste des grades
- Liste des cours

### Cours

Les cours permettent de configurer la période durant laquelle ils ont été enseigné ainsi que le [!badge grade] et la [!badge fonction] auxquelles ils donnent accès.
