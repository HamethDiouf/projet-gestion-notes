-- Table Enseignement (relation Professeur ↔ Matiere ↔ Classe)
CREATE TABLE Enseignement (
    id_enseignement SERIAL PRIMARY KEY,
    prof_id INT REFERENCES Professeur(id_prof), 
    matiere_id INT REFERENCES Matiere(id_matiere),
    classe_id INT REFERENCES Classe(id_classe)
);