-- Sélection de toutes les filières
SELECT * FROM filiere;

-- Sélection de toutes les classes
SELECT * FROM classe;

-- Sélection de tous les professeurs
SELECT * FROM professeur;

-- Sélection de toutes les matières
SELECT * FROM matiere;

-- Sélection de tous les enseignements
SELECT * FROM enseignement;

-- Sélection de tous les étudiants
SELECT * FROM etudiant;


-- Sélection de toutes les inscriptions
SELECT * FROM inscription;

-- Sélection de toutes les évaluations
SELECT * FROM evaluation;


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


-- Nombre d'étudiants par classe (A à J)
SELECT c.nom_classe, COUNT(i.id_etudiant) AS nombre_etudiants
FROM Classe c
LEFT JOIN Inscription i ON c.id_classe = i.id_classe
WHERE nom_classe BETWEEN 'A' AND 'J'
GROUP BY c.id_classe, c.nom_classe
ORDER BY c.nom_classe;

-- Vérifier la connexion et la table Étudiant
SELECT * 
FROM Etudiant
LIMIT 10;

-- Top 3 étudiants par moyenne
SELECT e.id_etudiant, e.nom, e.prenom, AVG(ev.note) AS moyenne
FROM Etudiant e
JOIN Evaluation ev ON e.id_etudiant = ev.id_etudiant
GROUP BY e.id_etudiant, e.nom, e.prenom
ORDER BY moyenne DESC
LIMIT 3;

-- Liste des matières enseignées par chaque professeur
SELECT p.nom, p.prenom, m.nom_matiere
FROM Professeur p 
LEFT JOIN Matiere m ON p.id_prof = m.prof_id
ORDER BY p.nom, p.prenom;


-- Liste des étudiants inscrits dans chaque classe (A à O)
SELECT c.nom_classe, e.nom, e.prenom
FROM Classe c
LEFT JOIN Inscription i ON c.id_classe = i.id_classe
LEFT JOIN Etudiant e ON i.id_etudiant = e.id_etudiant
ORDER BY c.nom_classe, e.nom, e.prenom;


-- Vérification ciblée : étudiants id=14,100,127
SELECT e.id_etudiant, e.nom, e.prenom, AVG(ev.note) AS moyenne
FROM Etudiant e
LEFT JOIN Evaluation ev ON e.id_etudiant = ev.id_etudiant
WHERE e.id_etudiant IN (14,100,127)
GROUP BY e.id_etudiant, e.nom, e.prenom;


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


-- Moyenne des notes par matière
SELECT m.nom_matiere AS matiere, AVG(ev.note) AS moyenne
FROM Matiere m
JOIN Evaluation ev ON m.id_matiere = ev.id_matiere
GROUP BY m.nom_matiere
ORDER BY moyenne DESC;


-- Nombre de matières par classe (contrôle Enseignement)
SELECT classe_id, COUNT(*) AS nb_matieres
FROM Enseignement
GROUP BY classe_id;



-- Suppression des doublons dans la table Classe (si jamais il y en avait)
WITH doublons AS (
    SELECT id_classe, nom_classe,
           ROW_NUMBER() OVER (PARTITION BY nom_classe ORDER BY id_classe) AS rang
    FROM Classe
)
DELETE FROM Classe
WHERE id_classe IN (
    SELECT id_classe
    FROM doublons
    WHERE rang > 1
);

