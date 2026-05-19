-- Création de la table Niveau
DROP TABLE IF EXISTS Niveau CASCADE;

CREATE TABLE Niveau (
    id_niveau SERIAL PRIMARY KEY,
    niveau VARCHAR(50) NOT NULL
);


