-- Étudiant inscrit en retard (date différente)
INSERT INTO Inscription (id_etudiant, id_niveau, date_inscription)
VALUES (15, 3, '2024-11-15');

-- Étudiant transféré dans un autre niveau (toujours avant évaluations 2025)
INSERT INTO Inscription (id_etudiant, id_niveau, date_inscription)
VALUES (28, 4, '2024-11-20');

-- Étudiant réinscrit après abandon (début janvier 2025, avant les évaluations)
INSERT INTO Inscription (id_etudiant, id_niveau, date_inscription)
VALUES (33, 2, '2025-01-05');

-- Étudiant inscrit dans deux niveaux (erreur administrative simulée)
INSERT INTO Inscription (id_etudiant, id_niveau, date_inscription)
VALUES (40, 1, '2024-10-01'),
       (40, 5, '2024-11-30');

-- Étudiant non inscrit volontairement
-- Exemple : id_etudiant = 50 reste sans inscription
