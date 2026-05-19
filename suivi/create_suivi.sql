-- Création de la table Suivi (relation Étudiant ↔ Matière)

DROP TABLE IF EXISTS Suivi CASCADE;

CREATE TABLE Suivi (
    id_etudiant INT NOT NULL,
    id_matiere INT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE,
    PRIMARY KEY (id_etudiant, id_matiere, date_debut), -- clé primaire composée pour éviter les doublons
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant), -- contrainte de clé étrangère vers la table Etudiant
    FOREIGN KEY (id_matiere) REFERENCES Matiere(id_matiere) -- contrainte de clé étrangère vers la table Matiere
);
