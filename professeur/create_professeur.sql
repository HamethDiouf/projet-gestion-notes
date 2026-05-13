-- Création de la table Professeur
CREATE TABLE Professeur (
    id_prof SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    departement VARCHAR(100),
    genre VARCHAR(10) CHECK (genre IN ('M','F')), -- contrainte pour limiter les valeurs
    email VARCHAR(100) UNIQUE -- contrainte pour éviter les doublons
);
