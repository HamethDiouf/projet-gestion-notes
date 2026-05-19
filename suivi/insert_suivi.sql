-- Insertion de données dans la table Suivi
INSERT INTO Suivi (id_etudiant, id_matiere, date_debut, date_fin)
SELECT e.id_etudiant, m.id_matiere, '2024-10-01', '2025-01-08'
FROM Etudiant e, Matiere m
WHERE e.id_etudiant = 1 AND m.id_matiere = 2;
