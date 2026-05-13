-- Création de la table Niveau
CREATE TABLE Niveau (
    id_niveau SERIAL PRIMARY KEY,
    niveau VARCHAR(50) NOT NULL,
    filiere_id INT REFERENCES Filiere(id_filiere)
);


