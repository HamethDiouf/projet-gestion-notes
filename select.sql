-- =================================
-- SECTION FILIÈRE
-- =================================
-- Sélection de toutes les filières
SELECT * FROM Filiere;


-- =================================
-- SECTION NIVEAU
-- =================================
-- Sélection de tous les niveaux
SELECT * FROM Niveau;

-- Nombre d'étudiants par niveau
SELECT n.niveau, COUNT(i.id_etudiant) AS nombre_etudiants
FROM Niveau n
LEFT JOIN Inscription i ON n.id_niveau = i.id_niveau
GROUP BY n.id_niveau, n.niveau
ORDER BY n.niveau;


-- =================================
-- SECTION PROFESSEURS
-- =================================
-- Sélection de tous les professeurs
SELECT * FROM Professeur;


-- =================================
-- SECTION MATIÈRES
-- =================================
-- Sélection de toutes les matières
SELECT * FROM Matiere;

-- Moyenne des notes par matière (toutes les matières, même sans notes)
SELECT m.nom_matiere, COALESCE(AVG(ev.note), 0) AS moyenne
FROM Matiere m
LEFT JOIN Evaluation ev ON m.id_matiere = ev.id_matiere
GROUP BY m.id_matiere, m.nom_matiere
ORDER BY m.nom_matiere;

-- Moyenne des notes par matière (uniquement celles avec notes)
SELECT m.nom_matiere, AVG(ev.note) AS moyenne
FROM Matiere m
JOIN Evaluation ev ON m.id_matiere = ev.id_matiere
GROUP BY m.id_matiere, m.nom_matiere
ORDER BY moyenne DESC;


-- =================================
-- SECTION ENSEIGNEMENTS
-- =================================
-- Sélection de tous les enseignements
SELECT * FROM Enseignement;

-- Liste des matières enseignées par chaque professeur
SELECT p.nom, p.prenom, m.nom_matiere, n.niveau, e.date_debut, e.date_fin
FROM Professeur p
JOIN Enseignement e ON p.id_prof = e.prof_id
JOIN Matiere m ON e.matiere_id = m.id_matiere
JOIN Niveau n ON e.niveau_id = n.id_niveau
ORDER BY p.nom, p.prenom, m.nom_matiere;


-- =================================
-- SECTION ÉTUDIANTS
-- =================================
-- Sélection de tous les étudiants
SELECT * FROM Etudiant;

-- Nombre d'étudiants par niveau avec filière
SELECT n.niveau,
       f.nom_filiere,
       COUNT(i.id_etudiant) AS nombre_etudiants
FROM Niveau n
JOIN Filiere f ON n.filiere_id = f.id_filiere
LEFT JOIN Inscription i ON n.id_niveau = i.id_niveau
GROUP BY n.id_niveau, n.niveau, f.nom_filiere
ORDER BY n.niveau;

-- Moyenne des notes par étudiant
SELECT e.id_etudiant, e.nom, e.prenom, AVG(ev.note) AS moyenne
FROM Etudiant e
JOIN Evaluation ev ON e.id_etudiant = ev.id_etudiant
GROUP BY e.id_etudiant, e.nom, e.prenom
ORDER BY moyenne DESC;

-- Top 3 étudiants par moyenne
SELECT e.id_etudiant, e.nom, e.prenom, AVG(ev.note) AS moyenne
FROM Etudiant e
JOIN Evaluation ev ON e.id_etudiant = ev.id_etudiant
GROUP BY e.id_etudiant, e.nom, e.prenom
ORDER BY moyenne DESC
LIMIT 3;


-- =================================
-- SECTION INSCRIPTIONS
-- =================================
-- Sélection de toutes les inscriptions
SELECT * FROM Inscription;

-- Liste des étudiants avec leurs niveaux et dates d'inscription
SELECT i.id_inscription,
       e.nom || ' ' || e.prenom AS etudiant,
       n.niveau,
       i.date_inscription
FROM Inscription i
JOIN Etudiant e ON i.id_etudiant = e.id_etudiant
JOIN Niveau n ON i.id_niveau = n.id_niveau
ORDER BY n.niveau, etudiant;


-- =================================
-- SECTION ÉVALUATIONS
-- =================================
-- Sélection de toutes les évaluations
SELECT * FROM Evaluation;

-- Affichage des évaluations avec noms d'étudiants et matières
SELECT ev.id_evaluation,
       e.nom || ' ' || e.prenom AS etudiant,
       m.nom_matiere,
       ev.note,
       ev.date_evaluation
FROM Evaluation ev
JOIN Etudiant e ON ev.id_etudiant = e.id_etudiant
JOIN Matiere m ON ev.id_matiere = m.id_matiere
ORDER BY e.nom, m.nom_matiere;

-- Vérification du nombre de notes par étudiant
SELECT id_etudiant, COUNT(*) AS nb_notes
FROM Evaluation
GROUP BY id_etudiant
ORDER BY nb_notes DESC;

-- Vérification : étudiants avec un nombre de notes différent de 5
SELECT id_etudiant, COUNT(*) AS nb_notes
FROM Evaluation
GROUP BY id_etudiant
HAVING COUNT(*) <> 5
ORDER BY nb_notes DESC;


-- =================================
-- SECTION SUIVI
-- =================================
-- Sélection de tous les suivis
-- Affichage du suivi des étudiants dans les matières avec les dates de début et fin ou en cours
SELECT * FROM Suivi;

-- Suivi des inscriptions et évaluations par étudiant
SELECT e.id_etudiant, e.nom, e.prenom,
       n.niveau,
       i.date_inscription,
       COUNT(ev.id_evaluation) AS nb_evaluations,
       AVG(ev.note) AS moyenne
FROM Etudiant e
JOIN Inscription i ON e.id_etudiant = i.id_etudiant
JOIN Niveau n ON i.id_niveau = n.id_niveau
LEFT JOIN Evaluation ev ON e.id_etudiant = ev.id_etudiant
GROUP BY e.id_etudiant, e.nom, e.prenom, n.niveau, i.date_inscription
ORDER BY n.niveau, moyenne DESC;


-- =================================
-- SECTION APPARTENANCE
-- =================================
-- Appartenance des étudiants à une filière et niveau
SELECT e.id_etudiant, e.nom, e.prenom,
       f.nom_filiere,
       n.niveau
FROM Etudiant e
JOIN Inscription i ON e.id_etudiant = i.id_etudiant
JOIN Niveau n ON i.id_niveau = n.id_niveau
JOIN Filiere f ON n.filiere_id = f.id_filiere
ORDER BY f.nom_filiere, n.niveau, e.nom;

