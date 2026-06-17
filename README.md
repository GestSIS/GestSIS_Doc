# 📚 GestSIS Documentation

Documentation officielle de **GestSIS** - Plateforme de gestion des Services d'Incendie et de Secours

[![Deploy](https://github.com/GestSIS/GestSIS_Doc/workflows/Node.js%20CI/badge.svg)](https://github.com/GestSIS/GestSIS_Doc/actions)
[![.NET](https://img.shields.io/badge/.NET-8.0-512BD4?logo=.net)](https://dotnet.microsoft.com/)
[![Retype](https://img.shields.io/badge/Retype-3.11-00D4AA)](https://retype.com/)

> 🌐 **[Accéder à la documentation](https://doc.gestsis.ch)** | **[GestSIS App](https://gestsis.ch)**

---

## 📖 À propos

Cette documentation fournit des guides complets pour l'utilisation de GestSIS, couvrant :

- 🔐 **Authentification et gestion des utilisateurs**
- 👥 **Gestion des effectifs et sapeurs**
- 📅 **Cours, formations et exercices**
- 🚒 **Matériel et interventions**
- 📊 **Statistiques et rapports**
- 💬 **SMS et publipostage**
- 🔌 **APIs et intégrations**

## 🚀 Démarrage rapide

### Prérequis

- [Node.js](https://nodejs.org/) (v18+)
- [.NET SDK](https://dotnet.microsoft.com/download) (v8.0)
- [Yarn](https://yarnpkg.com/) (v4.12+)

### Installation

```bash
# Cloner le repository
git clone https://github.com/your-org/gestsis-doc.git
cd gestsis-doc

# Installer les dépendances
yarn install

# Lancer le serveur de développement
yarn docs:dev
```

La documentation sera accessible sur **http://localhost:8081**

## 🛠️ Développement

### Structure du projet

```
src/
├── index.md              # Page d'accueil
├── apis/                 # Documentation API
│   ├── api.md
│   └── auth.md
├── guides/               # Guides utilisateur
│   ├── absence.md
│   ├── comptabilite.md
│   ├── cours.md
│   └── ...
└── images/               # Ressources images
```

### Commandes disponibles

```bash
# Démarrer le serveur local
yarn docs:dev

# Build de production (via GitHub Actions)
# Déploiement automatique sur doc.gestsis.ch
```

### Ajouter une nouvelle page

1. Créer un fichier `.md` dans le dossier approprié (`guides/`, `apis/`, etc.)
2. Ajouter le front matter YAML :
   ```yaml
   ---
   label: Titre de la page
   icon: ":emoji:"
   ---
   ```
3. Rédiger le contenu en Markdown
4. Commiter et pusher sur `main` pour déployer

## 🔄 Déploiement

Le déploiement est automatique via **GitHub Actions** :

- ✅ Push sur `main` → Build automatique
- 🚀 Déploiement sur `doc.gestsis.ch` via SSH/rsync
- 🔔 Notifications en cas d'erreur

Voir [.github/workflows/main.yml](.github/workflows/main.yml) pour la configuration.

## 📝 Contribuer

Les contributions sont les bienvenues ! Pour contribuer :

1. Fork le projet
2. Créer une branche (`git checkout -b feature/amelioration`)
3. Commiter les changements (`git commit -m 'Ajout guide XYZ'`)
4. Pusher la branche (`git push origin feature/amelioration`)
5. Ouvrir une Pull Request

### Guidelines

- Utiliser un français clair et accessible
- Inclure des captures d'écran si pertinent
- Tester localement avant de commiter
- Suivre la structure existante

## 🔗 Liens utiles

- 🌐 [GestSIS Application](https://gestsis.ch)
- 📚 [Documentation](https://doc.gestsis.ch)
- 🐛 [Signaler un problème](https://github.com/your-org/gestsis-doc/issues)
- 📧 Support : support@gestsis.ch

## 📄 Licence

Ce projet est sous licence **GNU AGPLv3**. Voir [LICENSE.md](LICENSE.md) pour plus de détails.
