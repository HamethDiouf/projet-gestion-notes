-- Insertion de données dans la table Inscription
INSERT INTO Inscription (id_etudiant, id_niveau, date_inscription)
SELECT id_etudiant, niveau_id,
       CASE 
         WHEN niveau_id <= 3 THEN DATE '2024-10-01'
         ELSE DATE '2024-11-30'
       END
FROM Etudiant;

