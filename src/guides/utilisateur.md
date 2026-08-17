---
order: 10
icon: people
---

Ce module permet de gérer les accès des différents personnes à GestSIS.

Afin de faciliter l'atribution de permissions, GestSIS utilise la notion de rôle.
Des rôles peuvent être créé dans le menu configuration et ensuite être attributés à plusieurs utilisateurs.
Ainsi si les permissions d'un rôle sont modifiés, les permissions de l'ensemble des utilisateurs seront mises à jour directement.

## Comptes spéciaux

Les comptes spéciaux sont destinés aux utilisateurs n'étant pas pompiers mais ayant besoin d'avoir accès à certaines informations.

Ces personnes n'étant pas enregistrées dans GestSIS, il n'est pas possible pour eux de créer un compte directement.

<!-- TODO: Expliquer comment créer un compte pour personne externe -->

## Sapeurs sans comptes

L'onglet `Sapeurs sans comptes` permet d'identifier les sapeurs n'ayant pas encore créé de comptes.
Vous avez la possibilité à travers cette interface de facilement leur envoyer un email afin de les inviter à créer un compte sur la plateforme GestSIS.

## Désactivation automatique des accès obsolètes

Pour éviter que d'anciens sapeurs gardent indéfiniment un accès à GestSIS, le système nettoie automatiquement les droits qui ne sont plus justifiés :

- **Rôle retiré immédiatement** : dès qu'un sapeur devient inactif dans un SIS, ses rôles pour ce SIS sont retirés sans délai, même si personne n'a pensé à le faire manuellement.
- **Compte désactivé après 30 jours** : un compte qui ne possède plus aucun rôle (et n'est plus rattaché à aucun sapeur actif, dans aucun SIS) reçoit un email l'informant que son compte sera désactivé dans 30 jours. Ce délai lui laisse le temps de récupérer d'éventuels décomptes en attente. Passé ce délai, la connexion est refusée si la situation n'a pas changé.
- **Accès à un SIS coupé après 30 jours** : si un sapeur reste actif dans un autre SIS mais quitte l'un d'eux, seul son accès à ce SIS précis est coupé après le même délai de 30 jours (avec un email d'avertissement) — le reste de son compte continue de fonctionner normalement.

Si la situation redevient normale avant l'échéance (rôle réattribué, sapeur réactivé), la désactivation prévue est annulée automatiquement, sans action requise de votre part.

## Configuration

Voici la liste de toutes les permissions disponibles :

- **Effectif** -> Visualisation de l'effectif
- **Sapeur lecture** -> Visualisation des données de tous les sapeurs
- **Sapeur modification** -> Modification des informations sapeurs
- **Config pour sapeur** -> Configuration pour le module sapeur
- **Intervention lecture** -> Visualisation des rapports d'intervention
- **Intervention saisie** -> Saisie des rapports d'intervention
- **Intervention validation** -> Validation des rapports d'intervention
- **Config pour intervention** -> Configuration des paramètres du module intervention
- **Exercice lecture** -> Visualisation de tous les exercices et séances
- **Exercice modification** -> Création et saisie des exercices et séances
- **Exercice saisie des présences** -> Saisie des présences
- **Exercice validation** -> Validation des exercices et séances
- **Config pour exercice** -> Configuration des paramètres du module exercices et séances
- **Fiche travail lecture** -> Visualisation de toutes les fiches de travail
- **Fiche travail personnelle** -> Saisie de fiches de travail pour soi uniquement
- **Fiche travail commune** -> Saisie de fiches de travail pour n'importe qui
- **Fiche travail validation** -> Validation des fiches de travail
- **Fiche travail config** -> Configuration pour le module fiche de travail
- **Cours lecture** -> Visualisation de la liste des cours
- **Cours modification** -> Inutilisé pour le moment
- **Cours config** -> Inutilisé pour le moment
- **Matériel lecture** -> Visualisation du matériel personnel
- **Matériel modification** -> Saisie et suivi du matériel personnel
- **Matériel config** -> Configuration pour le module matériel personnel
- **Organisation modification** -> Permet la configuration des différents groupes et donne accès à l'interface RTA
- **Absences lecture** -> Visualisation de la liste des absences
- **Absences modification** -> Saisie d'absence pour tous les sapeurs
- **Absences config** -> Configuration pour le module absence
- **Comptabilité lecture** -> Visualisation de la comptabilité
- **Comptabilité modification** -> Saisie et générations pour le module comptabilité
- **Config pour comptabilite** -> Configuration pour le module comptabilité
- **Contrôle médical** -> Saisie et modification des différents contrôles médicaux
- **Config pour contrôle medical** -> Configuration pour le module contrôles médicaux
- **Utilisateur** -> Pour la gestion des utilisateurs et de leurs rôles
- **Config pour utilisateur** -> Configuration des différents rôles
- **Config générale** -> Configuration des informations générales du SIS
- **SMS envoie** -> Permet l'envoi de SMS quand disponible
- **SMS config** -> Configuration du compte aspsms
- **RTA lecture** -> Accès aux informations RTA
- **RTA modification** -> Envoi de modifications au RTA
- **RTA config** -> Configuration du RTA
- **Admin** -> Inutilisé pour le moment
