-- Table Enseignement (relation Professeur ↔ Matiere ↔ Niveau)
CREATE TABLE Enseignement (
    id_enseignement SERIAL PRIMARY KEY,
    prof_id INT REFERENCES Professeur(id_prof),
    matiere_id INT REFERENCES Matiere(id_matiere),
    niveau_id INT REFERENCES Niveau(id_niveau),
    date_debut DATE,
    date_fin DATE
);
