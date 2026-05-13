-- ======================================
-- 📌 Exceptions pour la table Professeur
-- ======================================

-- Professeur en congé (email désactivé)
UPDATE Professeur
SET email = NULL
WHERE id_prof = 3; -- Jean Ba (Physique)

-- Professeur invité (ajout temporaire)
INSERT INTO Professeur (nom, prenom, departement, genre, email)
VALUES ('Martin','Claire','Visiting Scholar','F','claire.martin@univ.sn');

-- Professeur transféré vers un autre département
UPDATE Professeur
SET departement = 'Philosophie'
WHERE id_prof = 2; -- Khady Fall (Informatique)

-- Professeur retraité (supprimé de la base active)
DELETE FROM Professeur
WHERE id_prof = 10; -- Marie Ndoye (Biologie)

-- Professeur avec double affiliation (ajustement du champ département)
UPDATE Professeur
SET departement = 'Mathématiques, Informatique'
WHERE id_prof = 7; -- Abdou Kane (Mathématiques)
