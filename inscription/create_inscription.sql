-- Table Inscription (relation Étudiant ↔ Niveau)
CREATE TABLE Inscription (
    id_inscription SERIAL PRIMARY KEY,
    id_etudiant INT NOT NULL,
    id_niveau INT NOT NULL,
    date_inscription DATE NOT NULL,
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant),
    FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau),
    UNIQUE (id_etudiant, id_niveau, date_inscription) -- contrainte pour éviter les doublons d'inscription
);
