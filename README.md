# 📘 Projet Gestion des Notes Étudiants

Ce projet a pour objectif de modéliser et gérer les notes des étudiants à travers une base de données relationnelle.  
Il s’appuie sur un **MCD (Modèle Conceptuel de Données)** et un **schéma relationnel** enrichi pour refléter la réalité académique.

---

## 📂 Structure du projet

- **/niveau**  
  Définit les différents niveaux académiques (Licence 1, Licence 2, Master 1, etc.) et les relie à une filière.
  Exemple : Licence 1 Sciences → filiere_id = 1.

- **/etudiant**  
  Contient les scripts relatifs aux étudiants (ajout, mise à jour, gestion des informations personnelles).

- **/matiere**  
  Contient les scripts pour les matières (nom, coefficient, gestion des matières enseignées).

- **/professeur**  
  Contient les scripts pour les professeurs (ajout, affectation aux matières, gestion des informations).

- **/filiere**  
  Permet de gérer les filières académiques et de regrouper les classes par spécialité.
  Chaque niveau est rattaché à une filière via la clé étrangère filiere_id.

- **/enseignement**  
  Relie Professeur, Matière et Niveau. C’est l’entité pivot qui garantit la cohérence des enseignements.

- **/appartenance** 
  Gère l’appartenance des étudiants à une filière et à un niveau.
  Permet de savoir dans quelle spécialité et à quel cycle un étudiant est inscrit.

- **/suivi** 
  Permet de suivre la progression académique des étudiants (matières suivies, validations, parcours).
  Sert de base pour analyser la réussite et l’évolution des étudiants dans leur filière.

- **/inscription**  
  Gère l’inscription des étudiants dans les classes et leur participation aux matières.

- **/evaluation**  
  Contient les scripts pour les évaluations et notes des étudiants.

- **/images**  
  Regroupe les schémas du projet :  
  - `mcd.png` → Modèle Conceptuel de Données  
  - `relationnel.png` → Schéma relationnel enrichi  


- **📊 Diagrammes et fichiers sources**  

- **MCD – Gestion des Notes** 
  - [MCD_Gestion_Notes.drawio] 
  Fichier source du MCD, modifiable avec [Draw.io](https://app.diagrams.net/#G1NlYuzX-nCY1ouVxqsloNvwmmPRNfewrz#%7B%22pageId%22%3A%22eEd8BSc72qA2-EGRtv3c%22%7D).


- **Schéma Relationnel – Gestion des Notes** 
- [Relationnel_Gestion_Notes.drawio] 
  Fichier source du schéma relationnel, également modifiable avec [Draw.io](https://app.diagrams.net/#G1HOHCHRnpWBgg9OfAgcgCJq73GyXEaL8L#%7B%22pageId%22%3A%22c8D9N4k3m5zAeyCCimFC%22%7D).



- **select.sql / postgres Local.session.sql**  
  Scripts SQL pour tester et exécuter les requêtes sur PostgreSQL.

- **README.md**  
  Documentation du projet.

---

## ⚙️ Installation et outils nécessaires

Pour exécuter ce projet, il faut installer les logiciels suivants :  
- **PostgreSQL** → moteur de base de données.  
- **pgAdmin** → interface graphique pour gérer PostgreSQL.  
- **VS Code** → éditeur de code avec l’extension **SQLTools** pour exécuter les requêtes.  
- **Git** → pour cloner et gérer le dépôt GitHub.  

---

## 🚀 Utilisation avec PostgreSQL et pgAdmin

### 1. PostgreSQL
- Installer PostgreSQL depuis le site officiel.  
- Créer une base de données `gestion_notes`.  
- Importer les scripts `select.sql` et `postgres Local.session.sql` pour créer les tables et insérer les données.  

### 2. pgAdmin
- Ouvrir pgAdmin et se connecter au serveur local.  
- Vérifier que la base `gestion_notes` est bien créée.  
- Exécuter les requêtes SQL pour tester (exemple : `SELECT * FROM Etudiant;`).  

### 3. VS Code + SQLTools
- Installer l’extension **SQLTools** et le driver PostgreSQL.  
- Configurer une connexion :  
  - Host : `localhost`  
  - Port : `5432`  
  - Database : `gestion_notes`  
  - User : `postgres`  
  - Password : ton mot de passe PostgreSQL  
- Lancer les scripts SQL directement depuis VS Code.  

---

## 🧑‍💻 Exemples de requêtes SQL

-- Liste des étudiants par classe
SELECT e.nom, e.prenom, c.nom_classe
FROM Etudiant e
JOIN Inscription i ON e.id_etudiant = i.id_etudiant
JOIN Classe c ON i.id_classe = c.id_classe;



## ✅ Conclusion

Dans ce projet, on a conçu et organisé la base de données de gestion des notes en séparant chaque entité dans son propre dossier, en créant les schémas MCD et relationnel, et en regroupant les visuels dans un dossier images. Les fichiers sources .drawio permettent de modifier facilement les diagrammes dans Draw.io, assurant la clarté et la reproductibilité du travail.
