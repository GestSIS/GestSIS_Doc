---
order: 95
icon: ":firefighter:"
---

Ce module permet la gestion de l'ensembles des sapeurs et civiles qui collaborent avec le SIS.

Il existe actuellement trois types de personnes, les [!badge sapeurs], les [!badge civils] et les
[!badge recrues] (candidats en attente de validation, voir [Recrutement](./recrutement.md)).

Les sapeurs et civils actifs peuvent créer un compte GestSIS avec l'adresse email de leur fiche (voir [Utilisateurs](./utilisateur.md)). Les recrues ne le peuvent pas tant qu'elles ne sont pas validées.

!!! Informations
La [!badge fonction principale], le [!badge grade actuel] et le statut [!badge actif] sont mis à jour automatiquement afin de reflèter les fonctions, promotions et mutations saisies. Ils ne peuvent ainsi pas être modifié directement.
!!!

## Téléphones

Seuls les numéros de téléphone avec la case `RTA` cochée sont utilisés dans le module RTA. Seuls 3 numéros maximum peuvent être saisis par sapeur.

## Mutations

Les mutations permettent de gérer les déménagements ainsi que les départs du SIS.
Lors du clic sur le bouton [!badge Fin de service], il est possible de supprimer les exercices restants du sapeurs ainsi que de mettre fin à ses fonctions.

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
