---
order: 30
icon: ":wrench:"
title: Matériel
---

Ce module permet la gestion du matériel attribuable aux sapeurs (pas uniquement les EPI — tout type de matériel personnel peut être configuré) et du matériel rangé dans les hangars, véhicules et compartiments, dont l'inventaire se fait avec le module [Inventaire](inventaire.md) (voir le module `Intervention` pour le matériel consommable et en prêt).

Le suivi se fait par article individuel (numéro d'inventaire, taille, historique des contrôles, lavages compris), pas seulement par quantité. Un article est soit **en stock** à un emplacement, soit **attribué** à un sapeur.

## Onglets

- **Tableau de bord** : vue d'ensemble de ce qui demande une action — matériel à récupérer auprès de sapeurs inactifs, matériel périmé, contrôles manquants, dépassés ou en préavis, contrôles ayant atteint leur nombre d'exécutions. Le widget **Articles avec numéro manquant** liste, par type, les articles actifs d'un type numéroté dont le numéro n'est pas encore saisi, avec un bouton pour modifier chaque article ; il n'apparaît que s'il y en a.
- **Par type** : liste des articles pour un type de matériel donné (vue individuelle ou groupée par emplacement). Un type marqué comme périmable affiche une icône d'alerte dès qu'au moins un de ses articles est périmé. Le bouton d'ajout permet de saisir **plusieurs articles du type en une fois** :
  - tous les articles vont dans **un seul emplacement**, choisi en haut. Pour les répartir, activer **Répartir dans plusieurs emplacements** : une colonne emplacement apparaît sur chaque ligne, pré-remplie avec l'emplacement du haut ;
  - pour un type numéroté, on saisit un numéro par ligne. Avec un **lecteur de codes-barres**, chaque code scanné passe automatiquement à une nouvelle ligne, qui reprend l'emplacement, le compartiment, la taille, la péremption et l'achat de la précédente ;
  - pour un type non numéroté, on indique une quantité par ligne ;
  - les véhicules s'ajoutent toujours un par un.
- **Par emplacement** : arborescence des hangars/véhicules/compartiments où est rangé le matériel non attribué. La case **Afficher le matériel supprimé** ajoute à la liste les articles supprimés, en grisé avec leur date et leur remarque de suppression. Pour ceux-ci, les actions sont **Info** et **Restaurer**.
- **Inventaires** : inventaires en cours, écarts à traiter, date du dernier inventaire de chaque emplacement et historique (voir le guide [Inventaire](inventaire.md)).
- **Par sapeur** : matériel attribué à chaque sapeur, avec les actions [!badge Attribuer] (depuis le stock existant ou par création directe d'un article ; depuis le stock, un article numéroté peut être ajouté en scannant son numéro avec un **lecteur de codes-barres**) et [!badge Retourner] (un ou plusieurs articles vers un ou plusieurs emplacements). La case **Afficher les articles rendus** ajoute à la même liste, en grisé, les articles rendus par le sapeur, avec une colonne « Rendu le » (et un badge « supprimé » si l’article a été supprimé depuis). Le bouton PDF génère la **liste du matériel** actuellement attribué au sapeur (type, numéro, taille, date de distribution, avec une colonne « Retour le » à remplir à la main) ; il est aussi disponible pour chaque sapeur du widget de matériel à récupérer.

## Supprimer un article

L'action **Supprimer** d'un article ouvre une confirmation : on indique la **date de suppression** (aujourd'hui par défaut, pas dans le futur) et, si on le souhaite, une **remarque**. L'article n'est pas effacé : il reste consultable dans l'historique. Supprimer un article attribué met fin à son attribution à la date indiquée.

Pour un lot de matériel non numéroté regroupé (même emplacement et même compartiment), **Supprimer** demande la **quantité** à supprimer. Le système choisit lui-même les pièces concernées : celles dont la péremption est la plus proche d'abord, puis les plus anciennes.

Pour retrouver un article supprimé, cocher **Afficher le matériel supprimé** dans l'onglet **Par emplacement**, puis utiliser **Restaurer** et choisir l'emplacement actif dans lequel le replacer. Un véhicule restauré n'a pas d'emplacement à choisir : son emplacement est simplement réactivé.

### Historique d'un article

La fiche d'un article (action **Info**) contient un **Historique** de sa vie : ajout, attributions et retours (avec le sapeur concerné et qui les a effectués), contrôles et suppression.

Chaque sapeur peut consulter son propre matériel (lecture seule) depuis `Mes infos`.

## Configuration

Les différents types de matériel sont à saisir et paramétrer dans `Configuration`. Un type définit notamment :

- sa catégorie et sa couleur associée ;
- s'il est **actif** : un type inactif n'est plus proposé lors de la création d'articles, mais reste affiché sur les articles existants ;
- s'il est attribuable, numéroté (avec préfixe d'étiquetage), taillé. Un véhicule est toujours numéroté : le numéro peut être sa plaque, un numéro de véhicule interne ou tout autre identifiant ;
- s'il est **périmable** ;
- pour un tuyau : longueur, diamètre et s'il est roulé ;
- pour du matériel à batterie : nombre et modèle de batterie.

Les couleurs ont également une case **Actif** : une couleur inactive n'est plus proposée à la création, mais reste affichée là où elle est déjà utilisée.

Les emplacements, hangars, couleurs, types de batterie et diamètres de tuyau utilisés par ces types se configurent également dans `Configuration`.

### Véhicules

Dans la configuration des véhicules, la case **Disponible en intervention** détermine s'il peut être engagé : un véhicule indisponible ou supprimé n'est pas proposé dans les interventions (voir le guide [Intervention](intervention.md)). Supprimer un véhicule désactive son emplacement.

### Dupliquer des sous-emplacements

Pour reproduire une organisation existante (par exemple les compartiments d'un véhicule sur un autre véhicule identique), le bouton de copie en bout de ligne d'un emplacement ayant des sous-emplacements permet de **dupliquer ses emplacements enfants** vers un autre emplacement.

- Toute la hiérarchie des sous-emplacements actifs est copiée (désignation, couleur, remarque, étiquetage).
- L'emplacement de destination doit être actif et ne contenir aucun sous-emplacement.
- Le matériel rangé n'est pas copié, ni les sous-emplacements représentant un véhicule.

### Péremption

Pour un type marqué comme périmable, la saisie ou la modification d'un article de ce type demande sa **date de péremption**. Elle est propre à chaque article : deux articles d'un même type peuvent donc avoir des échéances différentes, selon leur lot ou leur date d'achat.

Tant qu'un article n'a pas atteint sa date de péremption, rien n'est signalé. Dès qu'au moins un article d'un type est périmé, ce type est mis en évidence par une icône d'alerte dans l'onglet **Par type**.

### Lavages

Il n'y a plus d'onglet **Lavages** : les lavages se saisissent comme exécutions du contrôle **Lavage** (usage limité, 50 exécutions maximum, préavis 40 par défaut), créé automatiquement à partir de l'ancien historique des lavages. Voir le module `Contrôles`.

Dans la liste des articles du type, chaque contrôle à usage limité s'appliquant à ce type a sa colonne : celle du contrôle **Lavage** affiche le nombre de lavages déjà effectués, par exemple « 12 / 50 ».

## Permissions

Voici les permissions du module :

- Lecture : Visualisation du matériel de chaque sapeur et en stock
- Modification : Permet la saisie de matériel, l'attribution, le retour, la saisie des contrôles et le traitement des écarts d'inventaire
- Configuration : Pour configurer les types de matériel, catégories, emplacements et autres paramètres associés
- Inventaire : Démarrage, saisie et validation des inventaires (voir le guide [Inventaire](inventaire.md))
