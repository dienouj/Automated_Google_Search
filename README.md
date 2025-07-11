# README.md
# Automatisé une recherche Google avec Selenium, Docker et CI/CD

## Description

Un script Python pour automatiser une recherche Google avec **Selenium**, conteneurisé avec **Docker**, et exécuté automatiquement via **GitHub Actions**.

---

## Utilisation

```bash
docker build -t selenium-search .
docker run selenium-search "OpenAI DevOps"
```

---

## Pipeline CI/CD

Le pipeline exécute le conteneur à chaque `push` sur la branche `main`.

---

## Dépendances

* Python 3
* Selenium
* Chrome & Chromedriver

---

## Étapes pour lancer

1. Construire l’image Docker :

   ```bash
   docker build -t selenium-search .
   ```

2. Lancer le conteneur :

   ```bash
   docker run selenium-search "OpenAI DevOps"
   ```

3. Pousser sur GitHub :
   Le pipeline s’exécute automatiquement.

