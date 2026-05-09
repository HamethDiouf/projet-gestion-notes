-- Étudiant absent à un examen (note supprimée)
DELETE FROM Evaluation 
WHERE id_etudiant = 22 AND id_matiere = 3;

-- Étudiant avec note exceptionnelle (major de promo)
UPDATE Evaluation 
SET note = 20.0
WHERE id_etudiant = 35 AND id_matiere = 2;

-- Étudiant sans aucune note (absence totale)
DELETE FROM Evaluation 
WHERE id_etudiant = 50;

-- Étudiant avec rattrapage (ajout d’une note supplémentaire)
INSERT INTO Evaluation (id_etudiant, id_matiere, note, date_evaluation)
VALUES (60, 4, 12.0, '2025-03-15'); -- Rattrapage en Chimie

-- Étudiant fraudeur (note annulée)
UPDATE Evaluation 
SET note = NULL
WHERE id_etudiant = 70 AND id_matiere = 1;
