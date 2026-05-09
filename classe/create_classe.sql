-- Création de la table Classe
CREATE TABLE Classe (
    id_classe SERIAL PRIMARY KEY,
    nom_classe VARCHAR(50) NOT NULL,
    nom_niveau VARCHAR(50),
    filiere_id INT REFERENCES Filiere(id_filiere)
);