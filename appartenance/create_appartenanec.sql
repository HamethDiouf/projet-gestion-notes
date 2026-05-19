-- Table Appartenance (relation Niveau ↔ Filiere)
DROP TABLE IF EXISTS Appartenance CASCADE;

CREATE TABLE Appartenance (
    niveau_id INT REFERENCES Niveau(id_niveau),
    filiere_id INT REFERENCES Filiere(id_filiere),
    PRIMARY KEY (niveau_id, filiere_id)
);
