-- ============================== SECTION FILIERES ==============================
-- Sélection de toutes les filières
SELECT * FROM filiere;


-- ============================== SECTION CLASSES ==============================
-- Sélection de toutes les classes
SELECT * FROM classe;

-- Nombre d'étudiants par classe (A à O)
SELECT c.nom_classe, COUNT(i.id_etudiant) AS nombre_etudiants
FROM Classe c
LEFT JOIN Inscription i ON c.id_classe = i.id_classe
WHERE nom_classe BETWEEN 'A' AND 'J'
GROUP BY c.id_classe, c.nom_classe
ORDER BY c.nom_classe;



-- ============================== SECTION PROFESSEURS ==============================
-- Sélection de tous les professeurs
SELECT * FROM professeur;


-- ============================== SECTION MATIERES ==============================

-- Sélection de toutes les matières
SELECT * FROM matiere;

-- Moyenne des notes par matière (toutes les matières, même sans notes)
SELECT m.nom_matiere, COALESCE(AVG(ev.note), 0) AS moyenne
FROM Matiere m
LEFT JOIN Evaluation ev ON m.id_matiere = ev.id_matiere
GROUP BY m.id_matiere, m.nom_matiere
ORDER BY m.nom_matiere;


-- Moyenne des notes par matière (uniquement les matières avec des notes)
SELECT m.nom_matiere AS matiere, AVG(ev.note) AS moyenne
FROM Matiere m
JOIN Evaluation ev ON m.id_matiere = ev.id_matiere
GROUP BY m.nom_matiere
ORDER BY moyenne DESC;


-- meilleurs et pires moyennes par matière
SELECT m.nom_matiere, AVG(ev.note) AS moyenne
FROM Matiere m
JOIN Evaluation ev ON m.id_matiere = ev.id_matiere
GROUP BY m.id_matiere, m.nom_matiere
ORDER BY moyenne DESC;



-- ============================== SECTION ENSEIGNEMENTS ==============================

-- Sélection de tous les enseignements
SELECT * FROM enseignement;

-- Liste des matières enseignées par chaque professeur
SELECT p.nom, p.prenom, m.nom_matiere
FROM Professeur p 
LEFT JOIN Matiere m ON p.id_prof = m.prof_id
ORDER BY p.nom, p.prenom;

-- Listes des matières enseignées par chaque professeur avec les filières associées
SELECT p.nom || ' ' || p.prenom AS professeur,
       f.nom_filiere,
       m.nom_matiere
FROM Matiere m
JOIN Professeur p ON m.prof_id = p.id_prof
JOIN Filiere f ON m.filiere_id = f.id_filiere
ORDER BY f.nom_filiere, m.nom_matiere;



-- ============================== SECTION ETUDIANTS ==============================

-- Sélection de tous les étudiants
SELECT * FROM etudiant;

-- Nombre d'étudiants par classe avec nom de la filière
SELECT c.nom_classe,
       c.nom_niveau,
       f.nom_filiere,
       COUNT(i.id_etudiant) AS nombre_etudiants
FROM Classe c
JOIN Filiere f ON c.filiere_id = f.id_filiere
LEFT JOIN Inscription i ON c.id_classe = i.id_classe
GROUP BY c.id_classe, c.nom_classe, c.nom_niveau, f.nom_filiere
ORDER BY c.nom_classe;


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


-- Vérification ciblée : étudiants id=14,100,127
SELECT e.id_etudiant, e.nom, e.prenom, AVG(ev.note) AS moyenne
FROM Etudiant e
LEFT JOIN Evaluation ev ON e.id_etudiant = ev.id_etudiant
WHERE e.id_etudiant IN (14,100,127)
GROUP BY e.id_etudiant, e.nom, e.prenom;


-- ============================== SECTION INSCRIPTIONS ==============================

-- Sélection de toutes les inscriptions
SELECT * FROM inscription;

-- Liste des étudiants avec leurs classes et dates d'inscription
SELECT i.id_inscription,
       e.nom || ' ' || e.prenom AS etudiant,
       c.nom_classe,
       i.date_inscription
FROM Inscription i
JOIN Etudiant e ON i.id_etudiant = e.id_etudiant
JOIN Classe c ON i.id_classe = c.id_classe
ORDER BY c.nom_classe, etudiant;


-- Liste des étudiants inscrits dans chaque classe (A à O)
SELECT c.nom_classe, e.nom, e.prenom
FROM Classe c
LEFT JOIN Inscription i ON c.id_classe = i.id_classe
LEFT JOIN Etudiant e ON i.id_etudiant = e.id_etudiant
ORDER BY c.nom_classe, e.nom, e.prenom;


-- ============================== SECTION EVALUATIONS ==============================

-- Sélection de toutes les évaluations
SELECT * FROM evaluation;

-- Affichage des évaluations avec noms d'étudiants et de matières
SELECT ev.id_evaluation,
       e.nom || ' ' || e.prenom AS etudiant,
       m.nom_matiere AS matiere,
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






















