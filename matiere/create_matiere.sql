-- Création de la table Matiere
DROP TABLE IF EXISTS Matiere CASCADE;

CREATE TABLE Matiere (
    id_matiere SERIAL PRIMARY KEY,
    nom_matiere VARCHAR(50) NOT NULL,
    coefficient INT
);
