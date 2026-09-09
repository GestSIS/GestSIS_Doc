---
order: 20
icon: ":heart:" # pulse
title: Contrôles médicaux
---

Ce module permet d'assurer le suivi périodique des contrôles médicaux des sapeurs, selon des types configurables.

L'interface de visualisation des contrôles médicaux en cours affiche par défaut uniquement le dernier contrôle en cours de chaque sapeur.
Il est possible de filtrer ceux-ci par année de consultation et par année de validité afin d'identifier ceux à renouveler durant l'année.

## Permissions

Voici les 2 permissions existantes :

- Tout : Visualisation et saisie des contrôles médicaux
- Configuration : Pour configurer les médecins, types

## Configuration

Sous configurations vous avez la possibilité de configurer les données suivantes :

- Liste des contrôles médicaux types
- Liste des médecins

### Contrôles médicaux types

Pour chaque type de contrôle médical, on configure une désignation, une **période de validité** (en années) avant renouvellement, et un statut **Expirable** — un type non expirable n'a pas d'échéance de renouvellement calculée.

Un champ **remarque** libre permet de noter les valeurs particulières (par exemple des durées de validité différentes selon l'âge) ; il est visible lors de la saisie ou la modification d'un contrôle de ce type.
