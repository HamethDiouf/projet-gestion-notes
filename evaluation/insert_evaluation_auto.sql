-- Générer automatiquement des évaluations pour tous les étudiants
-- Chaque étudiant reçoit une note pour chaque matière
INSERT INTO Evaluation (id_etudiant, id_matiere, note, date_evaluation)
SELECT e.id_etudiant, m.id_matiere,
       (8 + random() * 12)::numeric(4,2), -- notes entre 8 et 20
       DATE '2025-01-10' + (m.id_matiere * 3 || ' days')::interval -- date de l'évaluation
FROM Etudiant e
JOIN Matiere m ON m.id_matiere <= 5 -- Limiter à 5 matières pour éviter trop de données
WHERE NOT EXISTS (
  SELECT 1 FROM Evaluation ev
  WHERE ev.id_etudiant = e.id_etudiant
    AND ev.id_matiere = m.id_matiere
);
