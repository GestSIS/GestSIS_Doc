---
order: 31
icon: ":clipboard:"
title: Inventaire
---

Ce module fait partie de la gestion du matériel (voir le module `Matériel`) et permet de vérifier que le matériel rangé dans un emplacement (véhicule, hangar, compartiment) et ses sous-emplacements correspond au stock.

Un inventaire se déroule en deux temps :

1. **La saisie**, sur place : un sapeur compte le matériel et relève les écarts (manquant, défectueux, trouvé en plus). Le stock n'est pas modifié pendant la saisie.
2. **Le traitement des écarts**, une fois l'inventaire validé : le responsable matériel décide, écart par écart, s'il faut corriger le stock.

## Onglet Inventaires

Accessible depuis l'onglet **Inventaires** du module `Matériel` :

- **En cours** : les inventaires démarrés et pas encore validés, avec leur avancement (pièces vérifiées sur le total). [!badge Commencer] ou [!badge Reprendre] ouvre la saisie. Un inventaire en cours peut être supprimé : tout ce qui a été saisi est effacé et les emplacements peuvent être inventoriés à nouveau.
- **Écarts à traiter** : les inventaires validés dont il reste des écarts à traiter, avec le chemin complet de l'emplacement, le nom et la date de l'inventaire, et le nombre d'écarts restants. Un clic ouvre le traitement des écarts.
- **État par emplacement** : l'arborescence des emplacements actifs avec la date du **dernier inventaire** qui les couvre, le leur ou celui d'un parent (« via … »). Un emplacement jamais inventorié est marqué **Jamais**, un emplacement dans un inventaire en cours **En cours**. Le bouton en bout de ligne démarre un inventaire sur cet emplacement.
- **Historique** : les inventaires validés. Choisir un emplacement dans **État par emplacement** limite l'historique à cet emplacement : un inventaire d'un parent est marqué **Inclut**, celui d'un sous-emplacement **Partiel**. [!badge Tout l'historique] retire ce filtre.

## Démarrer un inventaire

[!badge Démarrer un inventaire] demande l'**emplacement**, une **désignation** (proposée à partir de l'emplacement) et la **date** du comptage.

- L'inventaire porte sur l'emplacement et tous ses sous-emplacements actifs.
- Le périmètre et la liste du matériel prévu sont **figés au démarrage** : l'inventaire se relit tel qu'il a été fait, même si les emplacements ou le stock changent ensuite.
- Le matériel attribué à un sapeur n'est pas inventorié.
- Une branche (un emplacement, ses parents et ses sous-emplacements) n'a qu'un seul inventaire en cours à la fois.

## Saisie

La page d'un inventaire a deux onglets : **Saisie** (puis **Inventaire** une fois validé) et **Écarts**. La colonne de gauche liste les emplacements de l'inventaire avec leur avancement ; [!badge Tout afficher] présente tous les emplacements à la suite.

### Pièces numérotées

Chaque pièce numérotée se marque **Présent**, **Manquant** ou **Défectueux**. Avec un **lecteur de codes-barres**, scanner le numéro d'une pièce de l'inventaire la marque présente ; un numéro qui n'en fait pas partie ouvre l'ajout de matériel trouvé.

### Lots

Le matériel non numéroté est compté par **lot** : un lot regroupe les pièces d'un même emplacement, de même type, même désignation, même compartiment, **même taille et même péremption**. Deux pansements qui ne périment pas à la même date sont donc comptés sur deux lignes, et la taille et la péremption de chaque lot sont affichées.

- **Constaté** : la quantité trouvée, avec les boutons − / + ou [!badge = prévu]. Si elle est inférieure au prévu, les pièces manquantes sont les plus anciennes du lot ; au-delà, le surplus est noté comme trouvé en plus.
- **Dont défectueux** : combien des pièces prévues comptées sont défectueuses.

### Précision pour le responsable

Le bouton crayon d'une ligne permet d'ajouter une **précision** (« prêté au SIS voisin », « emballage déchiré »…). Celle d'un lot vaut pour toutes ses pièces. Elle est reprise lors du traitement des écarts.

### Reste conforme

[!badge Reste conforme] marque présentes toutes les pièces encore à vérifier de l'emplacement affiché.

### Matériel trouvé en plus

Le bouton d'ajout (ou le scan d'un numéro inconnu de l'inventaire) ouvre la saisie du matériel trouvé, dans l'emplacement choisi :

- **Un article numéroté** : on scanne ou saisit son numéro. Une pièce prévue ailleurs dans l'inventaire est simplement marquée présente. Un article connu, rangé ailleurs ou attribué à un sapeur, est noté comme trouvé ici : le responsable décidera de son déplacement. Pour un numéro inconnu, on choisit son type, ou on donne le nom d'un nouveau type si le type n'existe pas encore.
- **Du matériel non numéroté** : on choisit le type (ou le nom d'un nouveau type) et la quantité. S'il correspond à un lot prévu de même compartiment, taille et péremption, la quantité s'ajoute à celle comptée ; sinon, il forme sa propre ligne.

On peut relever ce qui se voit sur l'objet : compartiment (dans un emplacement compartimenté), taille, péremption, étiquette et précision. Ces informations sont reprises à la création de l'article. Une ligne ajoutée par erreur se retire avec la corbeille.

### Valider

[!badge Terminer et vérifier les écarts] affiche le résumé de la saisie (pièces vérifiées, manquantes, en plus, défectueuses) et permet d'ajouter une **remarque générale**. L'inventaire se valide une fois toutes les pièces vérifiées. Après validation, la saisie n'est plus modifiable et les écarts sont transmis au responsable matériel, sans décision à prendre par le sapeur.

## Traitement des écarts

L'onglet **Écarts** d'un inventaire validé liste les écarts par emplacement. Chacun compare trois choses :

- **Prévu au démarrage** : ce qui était en stock quand l'inventaire a démarré ;
- **En stock aujourd'hui** : le stock actuel, qui a pu changer depuis (ajouts, attributions, déplacements, suppressions). Ce qui a changé depuis l'inventaire est signalé sur la ligne ;
- **Constaté** : ce que le sapeur a compté.

La colonne **Pour aligner le stock** propose l'action qui met le stock d'aujourd'hui en accord avec le constaté :

| Écart | Choix proposés |
| --- | --- |
| Lot avec trop de pièces en stock | **Mettre le stock à N** (retire d'abord les pièces relevées manquantes, jamais une défectueuse) ou **Garder** |
| Lot avec pas assez de pièces en stock | **Ajouter N au stock…** ou **Ignorer** |
| Pièces défectueuses d'un lot | **Retirer N (hors service)** ou **Noter seulement** |
| Article numéroté manquant | **Garder comme manquant** ou **Supprimer l'article (perdu)** |
| Article numéroté défectueux | **Noter seulement** ou **Supprimer l'article (hors service)** |
| Article trouvé ici, rangé ailleurs ou attribué | **Déplacer ici** (une attribution en cours est close) ou **Laisser en place** |
| Article trouvé ici, absent du stock | **Créer l'article…** ou **Ignorer** |

Pour un lot, le stock d'aujourd'hui compte :

- ses pièces encore dans l'emplacement, même si elles ont été modifiées depuis (compartiment, taille, désignation) ;
- les pièces de même type et même variante ajoutées depuis l'inventaire (« +N ajoutées »). Elles comblent un manque, par exemple le matériel trouvé en plus déjà saisi entre-temps, mais ne sont jamais retirées : le comptage ne les a pas vues.

Les pièces du lot qui ont quitté l'emplacement depuis sont indiquées « N parties ».

Un écart sans action à faire se **clôt** simplement :

- **Déjà à jour** : le stock correspond déjà au constaté (par exemple, les pièces trouvées en plus ont été ajoutées au stock entre-temps, ou l'article manquant a déjà été supprimé) ;
- **Plus concerné** : l'article a bougé depuis l'inventaire (attribué, rangé ailleurs) ; il n'est pas touché.

Ajouter ou créer des articles ouvre leur fiche, pré-remplie avec ce que le sapeur a relevé (compartiment, taille, péremption, étiquette) : il reste à compléter l'achat, le numéro des pièces numérotées et, pour un nouveau type, à le choisir ou à le créer. Les articles sont rangés dans l'emplacement où ils ont été trouvés, sauf si un autre emplacement est choisi.

Une pièce retirée du stock est supprimée à la date du jour, avec l'inventaire en remarque : elle reste consultable dans l'historique et peut être restaurée (voir [Matériel](materiel.md)).

Les décisions sont **définitives**. Chacune est appliquée sur le stock du moment : si le stock a changé depuis l'affichage, la proposition est mise à jour avant d'être appliquée. [!badge Appliquer tous les choix affichés] applique d'un coup les choix de la liste ; les écarts qui demandent une fiche d'article s'appliquent un par un. Les filtres **À traiter**, **Traités** et **Tous** comptent les pièces concernées.

## Permissions

Ce module utilise les permissions du module `Matériel`, ainsi qu'une permission dédiée à la saisie des inventaires :

- Matériel inventaire : Démarrage, saisie, validation et suppression d'un inventaire en cours. Donne accès à l'onglet **Inventaires** sans la permission de lecture du matériel.
- Matériel lecture : Consultation des inventaires et de leurs écarts
- Matériel modification : Traitement des écarts
