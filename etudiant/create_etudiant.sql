-- Création de la table Etudiant 
CREATE TABLE Etudiant (
    id_etudiant SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE,
    email VARCHAR(100),
    adresse VARCHAR(150),
    classe_id INT REFERENCES Classe(id_classe)
);