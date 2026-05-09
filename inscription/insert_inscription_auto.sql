-- Insertion de données dans la table Inscription
INSERT INTO Inscription (id_etudiant, id_classe, date_inscription)
SELECT id_etudiant, classe_id, '2024-10-01'
FROM Etudiant;