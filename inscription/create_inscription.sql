-- Table Inscription (relation Étudiant ↔ Classe)
CREATE TABLE Inscription (
    id_inscription SERIAL PRIMARY KEY,
    id_etudiant INT REFERENCES Etudiant(id_etudiant),
    id_classe INT REFERENCES Classe(id_classe),
    date_inscription DATE
);