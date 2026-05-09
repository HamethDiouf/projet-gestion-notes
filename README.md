# 📘 Projet Gestion des Notes Étudiants

Ce projet a pour objectif de modéliser et gérer les notes des étudiants à travers une base de données relationnelle.  
Il s’appuie sur un **MCD (Modèle Conceptuel de Données)** et un **schéma relationnel** enrichi pour refléter la réalité académique.

---

## 📂 Structure du projet

- **/classe**  
  Contient les scripts et données liés aux classes (création, insertion, gestion des classes).

- **/etudiant**  
  Contient les scripts relatifs aux étudiants (ajout, mise à jour, gestion des informations personnelles).

- **/matiere**  
  Contient les scripts pour les matières (nom, coefficient, gestion des matières enseignées).

- **/professeur**  
  Contient les scripts pour les professeurs (ajout, affectation aux matières, gestion des informations).

- **/filiere**  
  Permet de gérer les filières académiques et de regrouper les classes par spécialité.

- **/enseignement**  
  Relie Professeur, Classe et Matière. C’est l’entité pivot qui garantit la cohérence des enseignements.

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

## ✅ Conclusion

Dans ce projet, on a conçu et organisé la base de données de gestion des notes en séparant chaque entité dans son propre dossier, en créant les schémas MCD et relationnel, et en regroupant les visuels dans un dossier images. Les fichiers sources .drawio permettent de modifier facilement les diagrammes dans Draw.io, assurant la clarté et la reproductibilité du travail.
