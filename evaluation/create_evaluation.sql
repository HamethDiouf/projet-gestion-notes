-- Table Evaluation (relation Étudiant ↔ Matiere)
CREATE TABLE Evaluation (
    id_evaluation SERIAL PRIMARY KEY,
    id_etudiant INT REFERENCES Etudiant(id_etudiant),
    id_matiere INT REFERENCES Matiere(id_matiere),
    note DECIMAL(5,2) CHECK (note >= 0 AND note <= 20),
    date_evaluation DATE NOT NULL
);
