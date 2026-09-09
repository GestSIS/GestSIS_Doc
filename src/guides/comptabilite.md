---
order: 50
icon: ":dollar:"
---

GestSIS n'est pas un logiciel comptable. Cependant, il permet de générer des justificatifs comptables, des fiches de salaire pour chaque sapeur ainsi qu'un fichier ISO20022 pour faciliter les versements bancaires.

Le système fonctionne en 2 étapes :
1. Génération d'écritures à partir des activités (exercices, interventions, cours, travaux, frais annuels, etc.)
2. Groupement d'écritures dans un **décompte** pour effectuer les paiements

!!!
Une fois des écritures incluses dans un décompte, elles ne peuvent plus être modifiées.
!!!

## Exercice comptable

En haut de la page, un sélecteur permet de choisir l'exercice comptable (année fiscale) sur lequel travailler. L'exercice de l'année en cours est sélectionné par défaut.

## Génération d'écritures

GestSIS permet de générer des écritures à travers les modules suivants :

### Exercices et séances

Une fois un exercice validé, il peut être **imputé** pour générer les écritures correspondantes par sapeur selon leur fonction.

Pour pouvoir imputer, des types d'indemnisation doivent être configurés dans `Configuration` > `Comptabilité` > `Imputation exercice & séance`.

L'imputation est réversible tant que les écritures ne sont pas incluses dans un décompte.

### Interventions

Une fois une intervention validée, elle peut être **imputée** selon l'une des deux méthodes configurées pour son type d'indemnité : **Taux horaire** (avec majoration nuit et/ou week-end) ou **Tarif minimum** (un montant fixe pour les premières heures, puis le tarif normal). Le détail de ces réglages se trouve dans [Configuration](#configuration) ci-dessous.

### Cours

Les participations aux cours peuvent être imputées en une seule opération pour l'ensemble des cours de l'exercice, ou annulées si nécessaire. Ce que génère cette imputation dépend des lignes configurées pour le type de cours suivi (voir [Configuration](#configuration)).

### Fiches de travail

Les fiches de travail acceptées peuvent être imputées individuellement ou toutes en même temps via **Tout imputer**.

### Indemnités et frais annuels

Permet de générer les indemnités et frais récurrents (primes de fonction, frais forfaitaires, etc.) pour tous les sapeurs actifs. La génération peut être relancée pour un sapeur spécifique si sa situation a changé en cours d'année.

### Écritures diverses

Permet la saisie manuelle d'écritures ponctuelles non rattachées à un module spécifique, par exemple des frais de timbre ou des remboursements exceptionnels.

### Amendes

Génère automatiquement les écritures d'amende pour les absences non excusées, sur la base de la configuration des amendes. Le détail par sapeur et par exercice est consultable dans cet onglet.

## Création de décomptes

Un décompte regroupe un ensemble d'écritures pour effectuer un paiement. Il peut être créé globalement ou par sapeur.

Depuis l'onglet **Décomptes**, il est possible de :

- Générer un fichier de paiement **ISO20022** (XML) pour le virement bancaire
- Imprimer des récapitulatifs, des fiches par sapeur et des **certificats de salaire** (PDF)
- Exporter les écritures à facturer aux tiers (Excel)

## Vue par sapeur

L'onglet **Sapeurs** offre une vue synthétique de toutes les écritures pour chaque sapeur, tous modules confondus, avec la possibilité de créer un décompte individuel ou de générer un résumé PDF.

## Vue par compte

L'onglet **Comptes** permet de consulter l'ensemble des écritures rattachées à un compte comptable donné, avec filtres et génération de justificatifs PDF.

## Configuration

Les paramètres du module se trouvent dans `Configuration` > `Comptabilité`, dans l'ordre suivant :

### Compte

Le plan comptable de votre SIS : chaque compte a un numéro, une désignation et un type (**Produit** ou **Charge**). C'est cette liste de comptes qui est ensuite proposée partout ailleurs (imputations, frais, amendes, cotisations, écritures diverses).

### Catégories comptables

Une liste de catégories (désignation + ordre d'affichage) utilisée pour classer et regrouper les écritures dans les décomptes et les vues par compte.

### Types d'écriture : Indemnité, Solde, Frais forfaitaire, Frais effectif

Pour un type d'indemnité (cours, intervention, fiche de travail — voir aussi le guide [Fiche de travail](fiche-travail.md)), il est possible d'ajouter **plusieurs lignes** (tarif, unité, compte comptable), chacune associée à l'un de ces 4 types. Chaque ligne génère sa propre écriture lors de l'imputation — on peut ainsi, pour un même cours par exemple, générer une ligne `Indemnité` de 120.-/jour **et** une ligne `Solde` de 200.- forfaitaire en même temps.

!!!
Pour les exercices et séances, seuls les types **Solde** et **Indemnité** sont disponibles (pas de Frais).
!!!

Le type choisi n'est pas qu'une étiquette : il détermine le traitement fiscal et social de l'écriture lors de la génération des décomptes :

- **Indemnité** : imposable dès le premier franc.
- **Solde** : soumis à une franchise (configurable dans `Cotisations sociales`, voir plus bas) avant de devenir imposable.
- **Frais forfaitaire** et **Frais effectif** : remboursements de frais, non soumis aux cotisations sociales.

Les cotisations AVS/AC sont calculées sur le solde imposable et les indemnités, jamais sur les frais.

### Imputation exercice & séance

Pour chaque type d'indemnité, on configure une désignation, une unité (ex. heure, forfait) et une ou plusieurs lignes tarif + compte (type Solde ou Indemnité, voir ci-dessus).

Si l'option **Par fonction** est activée, le tarif de base est remplacé par une grille de tarifs différents par fonction : chaque sapeur reçoit alors le montant correspondant à sa fonction lors de l'exercice ou de la séance concernée.

### Imputation intervention

Pour chaque type d'indemnité d'intervention, une seule des deux méthodes ci-dessous est active à la fois :

#### Taux horaire (nuit / week-end)

Les majorations nuit et week-end sont des **multiplicateurs** du tarif de base (tarif × durée × taux), calculés sur la durée effective de présence (au quart d'heure, comme la saisie).

- **Week-end** : s'applique aux samedis et dimanches calendaires, sans notion d'heure de coupure — une présence un jour de week-end est comptée intégralement en majoration week-end.
- **Nuit** : s'applique selon une plage horaire configurable (ex. 22h–06h), tous les jours de semaine.
- Si les deux majorations sont configurées, le **week-end est prioritaire** : la majoration nuit ne s'applique pas durant un jour de week-end.

#### Tarif minimum

Un montant fixe (`Tarif min`) couvre une durée de référence (`Pour` heures), puis le tarif normal s'applique aux heures excédentaires. Il est possible de restreindre ce tarif minimum à une seule phase de l'intervention (les heures des autres phases utilisent alors uniquement le tarif normal).

Deux réglages **pro-rata** indépendants affinent ce calcul :

- **Pro-rata** (sur les heures excédentaires) : si coché, les heures au-delà du seuil sont facturées au tarif normal de façon exacte (fractions comprises) ; si décoché, elles sont arrondies à l'heure pleine inférieure avant application du tarif.
- **Pro-rata** (sur le tarif minimum) : si coché, le montant fixe lui-même est proratisé selon la présence réelle dans la durée de référence (ex. présent 1h sur 2h de référence → la moitié du montant fixe) ; si décoché (comportement par défaut), le montant fixe est payé intégralement dès qu'il y a présence dans la phase concernée, même partielle.

**Exemple :** 40.- pour les 2 premières heures (pro-rata décoché sur le tarif minimum) puis 15.-/heure au-delà —

- un sapeur présent 5h (pro-rata décoché sur les heures excédentaires) touche 40.- + 3 × 15.- = 85.-
- un sapeur présent 5h15 (pro-rata **coché** sur les heures excédentaires) touche 40.- + 3.25 × 15.- = 88.75.-, car les 15 minutes en plus sont comptées. Avec ce pro-rata décoché, ces 15 minutes en plus sont ignorées (arrondi à l'heure pleine en dessous) et le montant reste 85.-.

### Imputation cours

Pour chaque type de cours, une ou plusieurs lignes peuvent être configurées (voir `Types d'écriture` ci-dessus) : par exemple une ligne `Indemnité` par jour de cours et une ligne `Solde` forfaitaire. Chaque ligne a son propre tarif, son unité (jour, forfait, pièce) et son compte comptable.

### Heures additionnelles pour exercice

Un barème séparé de celui des exercices/séances eux-mêmes, pour des heures supplémentaires ponctuelles (ex. rangement du matériel, entretien). Chaque type a une désignation, un montant, une unité, un type (Solde ou Indemnité) et un compte comptable.

### Indemnités et frais annuels

La configuration définit des **types** de frais ou d'indemnité (ex: indemnité de fonction, frais forfaitaires), chacun associé à un compte comptable et une catégorie d'écriture.

Pour chaque type, un montant est ensuite configuré par **fonction**. Lors de la génération des écritures, chaque sapeur reçoit le montant correspondant à **sa fonction la plus élevée** uniquement.

Si le type est marqué **cumulable**, le sapeur reçoit le montant pour **chacune de ses fonctions actives** au cours de l'exercice, et non uniquement la plus élevée.

!!!
Si l'unité est **Mois**, le montant est **proratisé** selon la durée réelle d'activité du sapeur dans chaque fonction au cours de l'exercice.
!!!

**Exemple :** un sapeur ayant occupé une fonction pendant 8 mois sur l'exercice recevra 8 × montant mensuel.

### Cotisations sociales

Un seul formulaire (pas de liste) permet de régler les taux et franchises utilisés lors de la génération des décomptes :

- **Taux AVS/AI/APG** et **Taux AC** (disponibles dans les mementos officiels AVS/AC)
- **Franchise imposition** (fédérale) : montant de solde annuel déduit avant de calculer la part imposable (voir `Types d'écriture` plus haut) — la **franchise imposition cantonale** est son équivalent pour l'imposition cantonale
- **Franchise AVS** : montant total imposable en dessous duquel aucune cotisation AVS/AC n'est prélevée
- Un compte et une catégorie comptable pour l'écriture de cotisation générée

### Amende

Un compte et une catégorie comptable communs à toutes les amendes, puis une liste ordonnée de montants forfaitaires (ex. 1ère amende, 2ème amende, ...). Le rang de l'amende dans cette liste correspond au rang de l'amende du sapeur concerné durant l'exercice — il n'y a pas de motif ou de délai à configurer par palier.

!!!
La création/clôture des **années comptables** elles-mêmes (exercices comptables) ne se trouve pas dans cet onglet mais dans `Configuration` > `Exercice Comptables`, un onglet séparé.
!!!

## Permissions

- **Lecture** : Visualisation de tous les onglets sans modification possible
- **Modification** : Création, imputation, génération d'écritures et de décomptes
- **Configuration** : Accès aux paramètres du module comptabilité
