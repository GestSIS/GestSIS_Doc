---
order: 32
icon: ":mag:"
title: Contrôles
---

Ce module fait partie de la gestion du matériel (voir le module `Matériel`) et permet de définir et suivre les contrôles à effectuer sur certains types de matériel (contrôle visuel, test de pression, vérification technique, etc.), avec calcul automatique des échéances pour les contrôles périodiques.

## Onglet Contrôles

Accessible depuis l'onglet **Contrôles** du module `Matériel` :

- La colonne de gauche liste les contrôles configurés, avec une icône d'alerte dès qu'au moins un article a besoin d'attention (🔴 en retard, 🟡 en préavis).
- Le panneau de droite affiche le détail du contrôle sélectionné : nom, description, récurrence, responsable, types de matériel concernés et ses tâches, ainsi que la liste des articles concernés — groupés par type — avec, pour chaque article, le nombre de contrôles déjà réalisés, la date du **dernier contrôle** et, pour un contrôle périodique, celle du **prochain**. Une icône d'alerte signale un article en retard, en préavis, ou dont le dernier contrôle est un échec.

## Saisir un contrôle

Deux façons de saisir l'exécution d'un contrôle :

- Depuis un article (bouton [!badge Contrôler] dans la liste des articles) : l'article est déjà connu, il reste à choisir le contrôle parmi ceux applicables à son type.
- Depuis la fiche d'un contrôle (bouton [!badge Nouveau contrôle]) : le contrôle est déjà connu, il reste à choisir l'article concerné parmi ceux éligibles.

Pour chaque tâche du contrôle, on saisit un résultat **OK / KO** (tâche booléenne) ou une **valeur mesurée** (tâche numérique, avec la plage admissible affichée à titre indicatif). Une remarque est recommandée si le résultat est KO ou hors plage, mais n'empêche pas l'enregistrement : un contrôle dont au moins une tâche échoue est simplement marqué comme **invalide**.

!!! Contrôle non périodique
Un contrôle de récurrence "Non périodique" n'a pas d'échéance calculée : il se déclenche manuellement, sans notion de retard ou de préavis.
!!!

Un contrôle Non périodique peut définir un **nombre d'exécutions maximum** (avec un préavis en nombre d'exécutions) : une fois ce nombre atteint, l'article est considéré comme inutilisable et le contrôle marqué **invalide**, même s'il ne comporte aucune tâche — utile pour suivre un usage limité dans le temps (ex : nombre de lavages).

## Configuration

Un contrôle se configure dans `Configuration`, sous le module `Matériel`, avec :

- un **nom** et une **description** ;
- des **tâches** (mode monotâche si une seule, liste de tâches en multitâche, ou aucune tâche — seule la date d'exécution est alors enregistrée à chaque passage), chacune de type booléen ou numérique (avec unité et plage admissible) ;
- un ou plusieurs **types de matériel concernés** (un même type ne peut être sélectionné qu'une fois pour un contrôle donné) ;
- une **récurrence** : Périodique (fréquence en mois, avec un préavis optionnel en mois avant l'échéance), ou Non périodique (déclenché manuellement, sans date calculée — avec en option un nombre d'exécutions maximum et son préavis) ;
- si le contrôle est réalisé par un **prestataire externe**, et le nom du **responsable** (interne ou externe).

## Permissions

Ce module réutilise les permissions du module `Matériel`, il n'existe pas de permission dédiée :

- Lecture : Visualisation des contrôles et de leur statut
- Modification : Saisie des exécutions de contrôle
- Configuration : Création et modification des contrôles
