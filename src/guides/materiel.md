---
order: 30
icon: ":wrench:"
title: Matériel
---

Ce module permet la gestion du matériel attribuable aux sapeurs (pas uniquement les EPI — tout type de matériel personnel peut être configuré) et ne permet pas la gestion de l'inventaire des hangars, véhicules, etc. (voir le module `Intervention` pour le matériel consommable et en prêt).

Le suivi se fait par article individuel (numéro d'inventaire, taille, historique de lavage), pas seulement par quantité. Un article est soit **en stock** à un emplacement, soit **attribué** à un sapeur.

## Onglets

- **Par type** : liste des articles pour un type de matériel donné (vue individuelle ou groupée par emplacement), permet d'ajouter un nouvel article.
- **Par emplacement** : arborescence des hangars/véhicules/compartiments où est rangé le matériel non attribué.
- **Par sapeur** : matériel attribué à chaque sapeur, avec les actions [!badge Attribuer] (depuis le stock existant ou par création directe d'un article) et [!badge Retourner] (un ou plusieurs articles vers un ou plusieurs emplacements).
- **Lavages** : historique des lavages par article.

Chaque sapeur peut consulter son propre matériel (lecture seule) depuis `Mes infos`.

## Configuration

Les différents types de matériel sont à saisir et paramétrer dans `Configuration`. Un type définit notamment :

- sa catégorie et sa couleur associée ;
- s'il est attribuable, numéroté (avec préfixe d'étiquetage), taillé et/ou lavable ;
- pour un tuyau : longueur, diamètre et s'il est roulé ;
- pour du matériel à batterie : nombre et modèle de batterie.

Les emplacements, hangars, couleurs, types de batterie et diamètres de tuyau utilisés par ces types se configurent également dans `Configuration`.

## Permissions

Voici les 3 permissions existantes :

- Lecture : Visualisation du matériel de chaque sapeur et en stock
- Modification : Permet la saisie de matériel, l'attribution, le retour et le suivi des lavages
- Configuration : Pour configurer les types de matériel, catégories, emplacements et autres paramètres associés
