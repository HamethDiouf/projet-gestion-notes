-- Générer automatiquement des évaluations pour tous les étudiants
INSERT INTO Evaluation (id_etudiant, id_matiere, note, date_evaluation)
SELECT e.id_etudiant, m.id_matiere,
       (8 + random() * 12)::numeric(4,2), -- notes entre 8 et 20
       DATE '2025-01-10' + (m.id_matiere * 3 || ' days')::interval
FROM Etudiant e
JOIN Matiere m ON m.id_matiere <= 5; -- Limiter à 5 matières pour éviter trop de données


INSERT INTO Evaluation (id_etudiant, id_matiere, note, date_evaluation)
SELECT e.id_etudiant, ens.matiere_id,
       (8 + random() * 12)::numeric(4,2), -- notes entre 8 et 20
       DATE '2025-01-10' + (ens.matiere_id * 3 || ' days')::interval
FROM Etudiant e
JOIN Enseignement ens ON e.classe_id = ens.classe_id;


SELECT classe_id, COUNT(*) AS nb_matieres
FROM Enseignement
GROUP BY classe_id;

SELECT id_etudiant, COUNT(*) AS nb_notes
FROM Evaluation
GROUP BY id_etudiant
HAVING COUNT(*) <> 5
ORDER BY nb_notes DESC;

SELECT classe_id, COUNT(*) AS nb_matieres
FROM Enseignement
GROUP BY classe_id;

