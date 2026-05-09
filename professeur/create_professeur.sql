-- Création de la table Professeur
CREATE TABLE Professeur (
    id_prof SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    departement VARCHAR(100),
    genre VARCHAR(10),
    email VARCHAR(100)
);