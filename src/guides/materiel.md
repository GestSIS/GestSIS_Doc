---
order: 30
icon: ":wrench:"
title: Matériel
---

Ce module permet la gestion du matériel attribuable aux sapeurs (pas uniquement les EPI — tout type de matériel personnel peut être configuré) et ne permet pas la gestion de l'inventaire des hangars, véhicules, etc. (voir le module `Intervention` pour le matériel consommable et en prêt).

Le suivi se fait par article individuel (numéro d'inventaire, taille, historique de lavage), pas seulement par quantité. Un article est soit **en stock** à un emplacement, soit **attribué** à un sapeur.

## Onglets

- **Par type** : liste des articles pour un type de matériel donné (vue individuelle ou groupée par emplacement), permet d'ajouter un nouvel article. Un type marqué comme périmable affiche une icône d'alerte dès qu'au moins un de ses articles est périmé.
- **Par emplacement** : arborescence des hangars/véhicules/compartiments où est rangé le matériel non attribué.
- **Par sapeur** : matériel attribué à chaque sapeur, avec les actions [!badge Attribuer] (depuis le stock existant ou par création directe d'un article) et [!badge Retourner] (un ou plusieurs articles vers un ou plusieurs emplacements).
- **Lavages** : historique des lavages par article.

Chaque sapeur peut consulter son propre matériel (lecture seule) depuis `Mes infos`.

## Configuration

Les différents types de matériel sont à saisir et paramétrer dans `Configuration`. Un type définit notamment :

- sa catégorie et sa couleur associée ;
- s'il est attribuable, numéroté (avec préfixe d'étiquetage), taillé et/ou lavable ;
- s'il est **périmable** ;
- pour un tuyau : longueur, diamètre et s'il est roulé ;
- pour du matériel à batterie : nombre et modèle de batterie.

Les emplacements, hangars, couleurs, types de batterie et diamètres de tuyau utilisés par ces types se configurent également dans `Configuration`.

### Péremption

Pour un type marqué comme périmable, la saisie ou la modification d'un article de ce type demande sa **date de péremption**. Elle est propre à chaque article : deux articles d'un même type peuvent donc avoir des échéances différentes, selon leur lot ou leur date d'achat.

Tant qu'un article n'a pas atteint sa date de péremption, rien n'est signalé. Dès qu'au moins un article d'un type est périmé, ce type est mis en évidence par une icône d'alerte dans l'onglet **Par type**.

## Permissions

Voici les 3 permissions existantes :

- Lecture : Visualisation du matériel de chaque sapeur et en stock
- Modification : Permet la saisie de matériel, l'attribution, le retour et le suivi des lavages
- Configuration : Pour configurer les types de matériel, catégories, emplacements et autres paramètres associés
