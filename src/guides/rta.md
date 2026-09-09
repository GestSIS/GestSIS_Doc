---
order: 0
icon: ":rotating_light:"
---

Ce module a pour but de faciliter le transfert des données permettant l'engagement des sapeurs avec le CET (central d'engagement et de télécommunications).

Pour ce faire, GestSIS est capable de détecter les changements entre les données actuellement saisies dans GestSIS et la dernière version des données communiquées.

Ce module se compose de six onglets : Mutations, GestSIS, Référence, Fichiers, Demandes et Agriculteurs.

## Mutations

Pour effectuer une mutation et ainsi initier un transfert des données de GestSIS vers le CET, une action manuelle est requise (bouton `Transfert RTA`).

Il est également possible de faire une mutation partielle en sélectionnant seulement un certain nombre de sapeurs.
Par défaut, toutes les lignes sont sélectionnées via leur case à cocher qui se trouve dans la première colonne.
Pour ne pas communiquer les changements d'un sapeur, il suffit de le décocher et ses informations ne seront pas transmises.

!!!
Un sapeur appartenant à un groupe RTA mais sans aucun numéro de téléphone ne peut pas être transmis : il apparaît dans un avertissement en haut de la page et doit d'abord recevoir un numéro (voir le guide [Sapeur](sapeur.md)).
!!!

L'intégration se fait via [GestionRTA-Jura](https://gestionrta-jura.ch). Les droits d'effectuer des mutations RTA se configurent dans `Configuration` > `Droits et rôles`.

## GestSIS

Cet onglet affiche toutes les données actuellement dans GestSIS et potentiellement transmissibles au CET.

## Référence

Cet onglet affiche toutes les données officiellement transmises au CET.

## Fichiers

Un espace de documents (PDF, Word, Excel) liés au RTA, avec prévisualisation des PDF directement dans le navigateur.

## Demandes

La liste des demandes de modification de données RTA soumises, avec leur statut : `En cours d'édition`, `Soumise`, `En traitement` ou `Traitée`.

## Agriculteurs

Un répertoire des contacts agriculteurs par commune, utile pour le RTA en milieu rural.
