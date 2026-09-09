---
order: 45
icon: ":beach_with_umbrella:"
---

Ce module permet d'assurer le suivi des absences durant l'année.

L'idée de ce module est d'avoir une idée du nombre de sapeurs disponibles durant les différentes périodes de l'année.
Et de ne pas avoir de mauvaises surprises en cas d'intervention avec un effectif très réduit.

## Tableau de bord

Une grille affiche, pour un mois donné, une ligne par groupe et une colonne par jour (les week-ends sont grisés). Chaque case indique `disponibles/effectif total` et sa couleur varie du vert (tout le monde disponible) au rouge (groupe entièrement absent) selon le taux de disponibilité du jour. Cliquer sur un nombre affiche la liste des sapeurs absents ce jour-là pour la ligne concernée.

Le sélecteur `Afficher par` permet de regrouper la grille par **fonction**, **permis de conduire**, **localité** ou **groupe**, en plus du sélecteur de mois.

## Liste

Cet onglet liste chaque absence saisie (sapeur, dates de départ et de retour), avec la possibilité de modifier ou supprimer une entrée.

## Ajouter une absence

Le formulaire d'ajout ne demande que le sapeur concerné et une période (dates de départ et de retour) — il n'y a pas de catégorie d'absence ni de justificatif à joindre.

## Permissions

Voici les 3 permissions existantes :

- Lecture : Visualisation de toutes les absences
- Modification : Saisie d'absences pour tous les sapeurs
- Configuration : Pour configurer les paramètres du module d'absences

## Configuration

Sous configurations vous avez la possibilité de configurer les données suivantes :

- `Activer le module absence` permet à chaque sapeur saisir uniquement ses propres absences
