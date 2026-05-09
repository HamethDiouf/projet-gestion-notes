-- Étudiant inscrit en retard (date différente)
INSERT INTO Inscription (id_etudiant, id_classe, date_inscription)
VALUES (15, 3, '2024-11-15'); -- Étudiant 15 inscrit plus tard dans Classe C

-- Étudiant transféré dans une autre classe
INSERT INTO Inscription (id_etudiant, id_classe, date_inscription)
VALUES (28, 4, '2024-10-20'); -- Étudiant 28 transféré vers Classe D

-- Étudiant réinscrit après abandon
INSERT INTO Inscription (id_etudiant, id_classe, date_inscription)
VALUES (33, 2, '2025-01-05'); -- Étudiant 33 réinscrit en Classe B

-- Étudiant inscrit dans deux classes (erreur administrative simulée)
INSERT INTO Inscription (id_etudiant, id_classe, date_inscription)
VALUES (40, 1, '2024-10-01'),
       (40, 5, '2024-10-01'); -- Étudiant 40 inscrit à la fois en Classe A et E

-- Étudiant non inscrit volontairement (aucune entrée dans Inscription)
-- Exemple : id_etudiant = 50 reste sans inscription
