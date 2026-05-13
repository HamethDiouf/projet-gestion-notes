-- Création de la table Matiere
CREATE TABLE Matiere (
    id_matiere SERIAL PRIMARY KEY,
    nom_matiere VARCHAR(50) NOT NULL,
    coefficient INT
);
