---
order: 1
icon: ":lock:"
---

# Authentification

Cette page explique comment obtenir un access token pour appeler les API GestSIS depuis votre propre application ou script.

## Vue d'ensemble

Chaque requête vers les API GestSIS est authentifiée par un **access token** : un JWT signé (RS256) valable 60 minutes, envoyé dans le header `Authorization`. Il existe deux façons d'en obtenir un :

| | [Jeton d'API](#1-jeton-dapi) | [Login utilisateur](#2-login-utilisateur) |
| --- | --- | --- |
| Pour | Script, tâche planifiée, service tiers | Application dans laquelle un utilisateur se connecte avec son compte GestSIS |
| Identifiants | Un jeton créé une fois dans GestSIS | Email, mot de passe, et double authentification si le compte l'a activée |
| Droits | Limités aux permissions et SIS choisis à la création | Ceux de l'utilisateur |
| Renouvellement | Rappeler `token-auth` | Refresh token |

**Utilisez un jeton d'API dès que l'intégration tourne sans utilisateur devant l'écran.** Ne stockez jamais le mot de passe d'un compte dans un script.

## Base URL

```
https://auth.gestsis.ch/api/v1
```

## Format des réponses

Les données utiles sont dans `data`. Les erreurs ont toujours un champ `message` (chaîne), et un champ `errors` (par champ) pour une requête mal formée (422) :

```json
{
  "message": "The token field is required.",
  "errors": {
    "token": ["The token field is required."]
  }
}
```

Un statut 429 indique trop de tentatives (par adresse IP, ou échecs répétés sur un compte) : attendez avant de réessayer.

Certaines réponses répètent aussi des champs de `data` à la racine pour la compatibilité avec d'anciens clients : ne vous y fiez pas, lisez toujours `data`.

---

## 1. Jeton d'API

### Créer un jeton

Le jeton se crée dans GestSIS, page **Mon compte** :

- choisissez un nom, une durée de validité (1 à 365 jours), les permissions et les SIS auxquels il donne accès ;
- votre compte doit avoir la **double authentification activée**, et GestSIS vous redemande votre mot de passe (et votre code) à la création ;
- le jeton n'est **affiché qu'une seule fois** : conservez-le dans un gestionnaire de secrets.

Un jeton ne peut donner que des permissions que vous avez vous-même dans les SIS choisis.

### Obtenir un access token

```
POST /api/v1/token-auth
```

```json
{ "token": "votre-jeton-d-api" }
```

#### Réponse (200 OK)

```json
{
  "data": {
    "accessToken": "eyJ0eXAiOiJKV1QiLCJhbGc...",
    "user": {
      "id": 1,
      "name": "Jean Dupont",
      "email": "utilisateur@example.com"
    }
  }
}
```

L'access token est valable 60 minutes. Il n'y a pas de refresh token : rappelez `token-auth` quand il expire (ou quand l'API répond 401).

#### Erreurs

| Statut | Cas |
| ------ | --- |
| 401 | Jeton invalide, expiré ou révoqué. Un jeton est révoqué automatiquement si le mot de passe du compte est réinitialisé : créez-en un nouveau |
| 403 | L'utilisateur a perdu une partie des permissions du jeton : révoquez-le et créez-en un nouveau |

#### Exemple avec cURL

```bash
curl -X POST https://auth.gestsis.ch/api/v1/token-auth \
  -H "Content-Type: application/json" \
  -d '{"token": "votre-jeton-d-api"}'
```

### Ce qu'un jeton d'API peut faire

L'access token obtenu appelle les API GestSIS avec les permissions du jeton, dans les SIS du jeton, même si le compte est administrateur. Il ne peut modifier aucun réglage d'authentification du compte (mot de passe, double authentification, sessions, jetons).

---

## 2. Login utilisateur

Ce parcours sert aux applications où l'utilisateur saisit lui-même ses identifiants. Il produit un access token (60 minutes) et un **refresh token**, lié à une session, qui permet d'en obtenir un nouveau sans redemander le mot de passe.

### Étape 1 : email et mot de passe

```
POST /api/v1/login
```

```json
{
  "email": "utilisateur@example.com",
  "password": "motdepasse",
  "rememberMe": true
}
```

`rememberMe` est facultatif (vrai par défaut). À `false`, la session expire après 1 jour sans renouvellement au lieu de 30.

La réponse (200) prend l'une de ces trois formes : regardez quels champs sont présents dans `data`.

**Connexion complète**, si le compte n'a pas de double authentification :

```json
{
  "data": {
    "accessToken": "eyJ0eXAiOiJKV1QiLCJhbGc...",
    "refreshToken": "eyJzaWQiOiI5YmY...Xk3Q",
    "user": {
      "id": 1,
      "name": "Jean Dupont",
      "email": "utilisateur@example.com"
    },
    "twoFactorNudge": null
  }
}
```

`twoFactorNudge` vaut `null`, ou `{ "enforcedAt": "...", "daysRemaining": 31 }` si la double authentification va devenir obligatoire pour ce compte : vous pouvez inviter l'utilisateur à l'activer dans GestSIS.

**Double authentification requise** : passez à l'[étape 2](#étape-2--double-authentification) avec le `preAuthToken` (valable 5 minutes).

```json
{
  "data": {
    "requiresTwoFactor": true,
    "preAuthToken": "eyJ0eXAiOiJKV1QiLCJhbGc...",
    "availableMethods": ["totp", "webauthn"]
  }
}
```

**Double authentification à configurer** : elle est obligatoire et le compte ne l'a pas encore. Invitez l'utilisateur à se connecter une fois à GestSIS pour la configurer, puis à se reconnecter dans votre application.

```json
{
  "data": {
    "requiresTwoFactorSetup": true,
    "setupToken": "eyJ0eXAiOiJKV1QiLCJhbGc..."
  }
}
```

#### Erreurs

| Statut | Cas |
| ------ | --- |
| 401 | `"Les identifiants fournis sont incorrects"` (aussi pour un compte désactivé) |
| 403 | L'adresse email du compte n'est pas encore confirmée (`requiresEmailConfirmation: true`) : l'utilisateur doit finir son inscription dans GestSIS |
| 422 | Requête mal formée |

### Étape 2 : double authentification

Envoyez le `preAuthToken` dans le header `Authorization`, avec un code de l'application d'authentification de l'utilisateur :

```
POST /api/v1/2fa/verify
Authorization: Bearer {preAuthToken}
```

```json
{ "code": "123456" }
```

`code` accepte aussi un **code de secours** de l'utilisateur. En cas de succès, la réponse est une connexion complète, comme ci-dessus.

| Statut | Cas |
| ------ | --- |
| 401 | `preAuthToken` expiré (plus de 5 minutes) : recommencez l'étape 1 |
| 422 | `"Code invalide"` (un même code ne sert qu'une fois) |
| 429 | Trop de codes erronés sur ce compte |

Si `availableMethods` ne contient que `webauthn` (clé de sécurité ou biométrie), la vérification se fait dans un navigateur : `POST /api/v1/2fa/webauthn/challenge` renvoie les options pour `navigator.credentials.get()` (par exemple avec `startAuthentication()` de `@simplewebauthn/browser`), puis `POST /api/v1/2fa/webauthn/verify` avec `{ "response": <résultat du navigateur> }`, toujours avec le `preAuthToken`.

### Renouveler l'access token

```
POST /api/v1/refresh-token
```

```json
{ "token": "eyJzaWQiOiI5YmY...Xk3Q" }
```

La réponse est une connexion complète, avec un **nouveau** refresh token. Points importants :

- **Le refresh token ne sert qu'une fois.** Remplacez-le à chaque renouvellement. Présenter un refresh token déjà utilisé (plus de 10 secondes après) est traité comme un vol : la session est révoquée et l'utilisateur doit se reconnecter.
- **Un seul renouvellement à la fois.** Si plusieurs requêtes reçoivent un 401 en même temps, lancez un seul refresh et faites attendre les autres.
- **C'est une chaîne opaque** : stockez-la telle quelle, sans en supposer le format ni la longueur.

Un **401** signifie que la session est terminée : renvoyez l'utilisateur vers l'étape 1. Le `message` en donne la raison (session expirée, révoquée, double authentification devenue obligatoire…), mais ne basez pas votre logique sur son texte.

Une session expire après 30 jours sans renouvellement (1 jour sans `rememberMe`), et au plus tard 30 jours après le login, même si elle est renouvelée régulièrement.

### Se déconnecter

```
POST /api/v1/logout
```

```json
{ "token": "eyJzaWQiOiI5YmY...Xk3Q" }
```

Termine la session côté serveur : le refresh token ne peut plus être renouvelé. Répond toujours `204 No Content`. Supprimez aussi l'access token de votre côté : il reste valable jusqu'à son expiration.

### Exemple : fetch avec renouvellement automatique

```javascript
const AUTH_URL = 'https://auth.gestsis.ch/api/v1';
let refreshing = null;

async function refreshTokens() {
  const response = await fetch(`${AUTH_URL}/refresh-token`, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ token: localStorage.getItem('refreshToken') }),
  });

  if (!response.ok) {
    // Session terminée : nouvelle connexion nécessaire
    localStorage.removeItem('accessToken');
    localStorage.removeItem('refreshToken');
    throw new Error('Session expirée');
  }

  const { data } = await response.json();
  localStorage.setItem('accessToken', data.accessToken);
  localStorage.setItem('refreshToken', data.refreshToken);
}

async function fetchWithAuth(url, options = {}) {
  const send = () => fetch(url, {
    ...options,
    headers: { ...options.headers, Authorization: `Bearer ${localStorage.getItem('accessToken')}` },
  });

  const response = await send();
  if (response.status !== 401) {
    return response;
  }

  // Un seul refresh partagé par toutes les requêtes en attente
  refreshing ??= refreshTokens().finally(() => { refreshing = null; });
  await refreshing;

  return send();
}
```

---

## Utiliser l'access token

Envoyez l'access token dans le header `Authorization` de chaque requête vers les API GestSIS, avec le header `Sis-Key` du SIS concerné (voir [API GestSIS](api.md#header-sis-key)) :

```
Authorization: Bearer {accessToken}
Sis-Key: hs
```

Une réponse 401 signifie en général que l'access token a expiré : renouvelez-le (`token-auth` ou `refresh-token`), puis réessayez la requête.

### Contenu de l'access token

Le JWT peut être décodé pour connaître l'utilisateur et ses droits, par exemple pour savoir à quels SIS il a accès. Ne vous en servez pas pour décider seul d'un accès : c'est l'API qui fait foi.

```json
{
  "iss": "GestSIS_Auth",
  "aud": "GestSIS_API",
  "iat": 1702290000,
  "nbf": 1702289990,
  "exp": 1702293600,
  "data": {
    "id": 1,
    "admin": false,
    "validated": true,
    "pseudo": "Jean Dupont",
    "email": "jean.dupont@example.com",
    "permissions": {
      "test": ["intervention.lecture", "intervention.modification", "sapeur.lecture"],
      "hs": ["intervention.lecture"]
    },
    "mobiles": ["test", "hs"],
    "sapeurs": { "test": 42, "hs": 108 },
    "sid": "9bf6c1a2-6d0e-4f3b-9a51-2f6c0b3e8d17",
    "type": "session"
  }
}
```

- **exp** : expiration (timestamp UNIX, 60 minutes après `iat`)
- **id**, **pseudo**, **email** : l'utilisateur
- **admin** : administrateur GestSIS (tous les droits). Toujours `false` pour un token issu d'un jeton d'API
- **validated** : l'email de l'utilisateur est confirmé
- **permissions** : pour chaque SIS (par sa clé, la valeur du header `Sis-Key`), la liste des permissions
- **mobiles** : clés des SIS pour lesquels l'utilisateur reçoit les alertes mobiles
- **sapeurs** : pour chaque SIS, l'ID du sapeur lié à l'utilisateur
- **type** : `session` (login utilisateur) ou `api` (jeton d'API)
- **sid** : identifiant de la session (`null` pour un jeton d'API)

Un même utilisateur peut avoir des permissions différentes et un sapeur différent dans chaque SIS.

---

## Bonnes pratiques

1. **Jeton d'API pour l'automatisation**, avec le minimum de permissions et de SIS nécessaires, et une durée de validité courte
2. **Ne jamais exposer un jeton** : ni dans les logs, ni dans le code source, ni dans une URL
3. **HTTPS uniquement**
4. **Login utilisateur** : stocker le nouveau refresh token à chaque renouvellement, et appeler `/logout` à la déconnexion

## Durées de vie

| Jeton | Durée |
| ----- | ----- |
| Access token | 60 minutes |
| Jeton d'API | Choisie à la création (1 à 365 jours) |
| preAuthToken (double authentification) | 5 minutes |
| Session (refresh token) | 30 jours sans renouvellement (1 jour sans `rememberMe`), 30 jours au plus depuis le login |

---

## Gestion du compte

L'inscription, la confirmation de l'email, le mot de passe, la double authentification, les sessions ouvertes et les jetons d'API se gèrent dans l'application GestSIS (page **Mon compte**). Les endpoints correspondants ne font pas partie de l'interface d'intégration et peuvent évoluer sans préavis.
