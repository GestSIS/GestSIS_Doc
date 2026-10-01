---
order: 99
icon: ":key:"
title: Mon compte et connexion
---

Cette page explique comment vous connecter à GestSIS et sécuriser votre compte : double authentification, appareils connectés et mot de passe.

Les réglages de votre compte se trouvent dans le menu de votre nom, en haut à droite : `Paramètres`.

## Se connecter

Saisissez votre email et votre mot de passe, puis pressez [!button size="s" text="Se connecter"].

!!! Se souvenir de moi
Cochez `Se souvenir de moi sur cet appareil` sur votre ordinateur ou téléphone personnel : vous restez connecté tant que vous utilisez GestSIS au moins une fois par mois.

Sur un poste partagé ou public, laissez-la décochée : vous serez déconnecté après un jour sans utilisation.
!!!

Dans tous les cas, GestSIS vous redemande de vous connecter **30 jours après votre connexion**, même si vous l'utilisez tous les jours.

!!!
Un compte utilisé sur une tablette partagée (par exemple au local) peut rester connecté jusqu'à 90 jours. Demandez-le à l'administrateur de GestSIS.
!!!

Pour vous déconnecter, choisissez `Déconnexion` dans le menu de votre nom. Pensez-y sur un poste qui n'est pas le vôtre.

## Créer un compte

Sur la page de connexion, cliquez sur `S'enregistrer` et utilisez l'adresse email que vous avez communiquée à votre SIS.

Un **code de 8 caractères** vous est ensuite envoyé par email : saisissez-le pour activer votre compte. Le code est valable 30 minutes ; s'il a expiré ou si vous ne l'avez pas reçu, cliquez sur [!button size="s" text="Renvoyer le code"].

## Double authentification

La double authentification (2FA) ajoute une étape à la connexion, en plus de votre mot de passe : même si quelqu'un devine ou vole votre mot de passe, il ne peut pas se connecter sans cette seconde preuve.

Deux moyens sont possibles, et vous pouvez en activer plusieurs :

- **Application d'authentification** : Google Authenticator, Authy, Microsoft Authenticator… Elle affiche sur votre téléphone un code à 6 chiffres qui change toutes les 30 secondes.
- **Clé de sécurité ou biométrie** : clé USB (YubiKey…), Touch ID, Windows Hello, ou une passkey de votre téléphone.

### Activer la double authentification

Dans `Paramètres`, onglet `Double authentification` :

1. Pressez [!button size="s" text="Activer"] et choisissez un moyen.
2. Confirmez votre mot de passe.
3. **Application d'authentification** : scannez le QR code avec l'application, puis saisissez le code qu'elle affiche. **Clé de sécurité** : donnez un nom à la clé (par exemple « YubiKey bleue » ou « Téléphone »), puis suivez les instructions de votre navigateur.
4. Notez vos **codes de secours** (voir ci-dessous).

Pour ajouter un autre moyen plus tard (une deuxième clé, ou l'application en plus d'une clé), utilisez [!button size="s" text="Ajouter un second moyen d'authentification"] ou [!button size="s" text="Ajouter une clé"].

!!!warning Les autres appareils sont déconnectés
À l'activation de votre premier moyen, tous vos autres appareils sont déconnectés : reconnectez-vous sur chacun avec la double authentification.
!!!

### Codes de secours

À l'activation, GestSIS affiche une liste de **codes de secours**. Chacun permet de vous connecter **une seule fois** à la place d'un code ou d'une clé, si vous avez perdu votre téléphone ou votre clé.

- Notez-les ou imprimez-les, et gardez-les dans un endroit sûr, séparé de votre téléphone. Ils ne sont plus jamais affichés ensuite.
- S'il ne vous en reste plus beaucoup, ou si vous pensez que quelqu'un les a vus, pressez [!button size="s" text="Régénérer les codes de secours"] : les anciens ne fonctionnent plus.

### Se connecter avec la double authentification

Après votre email et votre mot de passe, GestSIS vous demande votre second moyen :

- `Code d'authentification` : saisissez le code affiché par votre application, ou un code de secours ;
- `Clé de sécurité / biométrie` : suivez les instructions du navigateur. Si vous n'avez plus votre clé, cliquez sur `Je n'ai plus accès à ma clé de sécurité` pour saisir un code de secours.

!!!danger Plus aucun moyen ?
Si vous avez perdu à la fois votre téléphone ou votre clé et vos codes de secours, vous ne pouvez plus vous connecter. Contactez le support GestSIS.
!!!

### Changer de téléphone ou retirer une clé

- **Nouveau téléphone** : avant de vous séparer de l'ancien, désactivez l'application d'authentification avec le bouton [!button size="s" text="Désactiver"] (mot de passe et code demandés), puis réactivez-la avec le nouveau téléphone. Si vous n'avez plus l'ancien téléphone, connectez-vous avec un code de secours pour le faire.
- **Clé perdue ou remplacée** : supprimez-la avec l'icône corbeille dans la liste `Clés de sécurité`.

### Double authentification obligatoire

GestSIS peut rendre la double authentification obligatoire. Un bandeau vous l'annonce alors en haut de l'écran, avec la date et le nombre de jours restants : pressez [!button size="s" text="Activer maintenant"] pour la configurer sans attendre.

Après cette date, si vous ne l'avez pas encore activée, GestSIS vous demande de la configurer juste après votre mot de passe, avant de pouvoir continuer.

### Application mobile

L'application mobile GestSIS demande aussi votre second moyen à la connexion. La configuration, elle, se fait uniquement dans l'application web : si la double authentification est obligatoire et pas encore configurée, l'application mobile vous invite à le faire sur le web, puis à vous reconnecter.

## Sessions actives

L'onglet `Sessions actives` liste les appareils sur lesquels votre compte est connecté : navigateur, adresse IP, date de connexion et dernière utilisation. L'appareil que vous utilisez porte le badge `Cet appareil`.

Si vous ne reconnaissez pas un appareil, ou si vous êtes resté connecté sur un poste public, déconnectez-le avec l'icône corbeille. En cas de doute, changez aussi votre mot de passe.

## Mot de passe

### Changer son mot de passe

Dans `Paramètres`, onglet `Mot de passe` : saisissez l'ancien et le nouveau mot de passe (12 caractères au minimum). Si l'application d'authentification est activée, son code est aussi demandé.

Après le changement, **tous vos appareils sont déconnectés**, y compris celui que vous utilisez : reconnectez-vous avec le nouveau mot de passe.

### Mot de passe oublié

Sur la page de connexion, cliquez sur `Mot de passe oublié` et saisissez votre email. Vous recevez un lien, valable 1 heure, pour choisir un nouveau mot de passe.

La réinitialisation déconnecte tous vos appareils et révoque vos jetons d'API. La double authentification reste active : elle vous sera demandée à la prochaine connexion.

## Jetons d'API

L'onglet `Jetons d'API` permet de créer des jetons pour accéder aux données de GestSIS depuis un script ou une autre application, sans votre mot de passe. Ils servent aux intégrations, pas à se connecter à GestSIS.

La création d'un jeton exige que la double authentification soit activée sur votre compte. Voir la [documentation développeur](../apis/auth.md) pour leur utilisation.
