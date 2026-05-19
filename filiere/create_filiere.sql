-- Création de la table Filiere
DROP TABLE IF EXISTS Filiere CASCADE;

CREATE TABLE Filiere (
    id_filiere SERIAL PRIMARY KEY,
    nom_filiere VARCHAR(100) NOT NULL
);

