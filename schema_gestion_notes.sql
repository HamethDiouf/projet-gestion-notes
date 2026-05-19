DROP TABLE IF EXISTS Filiere CASCADE;
DROP TABLE IF EXISTS Niveau CASCADE;
DROP TABLE IF EXISTS Professeur CASCADE;
DROP TABLE IF EXISTS Matiere CASCADE;
DROP TABLE IF EXISTS Enseignement CASCADE;
DROP TABLE IF EXISTS Etudiant CASCADE;
DROP TABLE IF EXISTS Inscription CASCADE;
DROP TABLE IF EXISTS Evaluation CASCADE;
DROP TABLE IF EXISTS Appartenance CASCADE;
DROP TABLE IF EXISTS Suivi CASCADE;

-- Création de la table Filiere
CREATE TABLE Filiere (
    id_filiere SERIAL PRIMARY KEY,
    nom_filiere VARCHAR(100) NOT NULL
);

-- Création de la table Niveau
CREATE TABLE Niveau (
    id_niveau SERIAL PRIMARY KEY,
    niveau VARCHAR(50) NOT NULL
);

-- Création de la table Professeur
CREATE TABLE Professeur (
    id_prof SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    departement VARCHAR(100),
    genre VARCHAR(10) CHECK (genre IN ('M','F')), -- contrainte pour limiter les valeurs
    email VARCHAR(100) UNIQUE -- contrainte pour éviter les doublons
);

-- Création de la table Matiere
CREATE TABLE Matiere (
    id_matiere SERIAL PRIMARY KEY,
    nom_matiere VARCHAR(50) NOT NULL,
    coefficient INT
);

-- Création de la table Enseignement (relation Professeur ↔ Matière ↔ Niveau)
CREATE TABLE Enseignement (
    id_enseignement SERIAL PRIMARY KEY,
    prof_id INT REFERENCES Professeur(id_prof),
    matiere_id INT REFERENCES Matiere(id_matiere),
    niveau_id INT REFERENCES Niveau(id_niveau),
    date_debut DATE,
    date_fin DATE
);

-- Création de la table Etudiant
CREATE TABLE Etudiant (
    id_etudiant SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    date_naissance DATE,
    email VARCHAR(100) UNIQUE,
    adresse VARCHAR(150),
    niveau_id INT REFERENCES Niveau(id_niveau),
    filiere_id INT REFERENCES Filiere(id_filiere)
);

-- Création de la table Inscription (relation Étudiant ↔ Niveau)
CREATE TABLE Inscription (
    id_inscription SERIAL PRIMARY KEY,
    id_etudiant INT NOT NULL,
    id_niveau INT NOT NULL,
    date_inscription DATE NOT NULL,
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant),
    FOREIGN KEY (id_niveau) REFERENCES Niveau(id_niveau),
    UNIQUE (id_etudiant, id_niveau, date_inscription) -- contrainte pour éviter les doublons d'inscription
);

-- Création de la table Evaluation (relation Étudiant ↔ Matière)
CREATE TABLE Evaluation (
    id_evaluation SERIAL PRIMARY KEY,
    id_etudiant INT REFERENCES Etudiant(id_etudiant),
    id_matiere INT REFERENCES Matiere(id_matiere),
    note DECIMAL(5,2) CHECK (note >= 0 AND note <= 20),
    date_evaluation DATE NOT NULL
);

-- Création de la table Appartenance (relation Niveau ↔ Filière)
CREATE TABLE Appartenance (
    niveau_id INT REFERENCES Niveau(id_niveau),
    filiere_id INT REFERENCES Filiere(id_filiere),
    PRIMARY KEY (niveau_id, filiere_id)
);

-- Création de la table Suivi (relation Étudiant ↔ Matière)
CREATE TABLE Suivi (
    id_etudiant INT NOT NULL,
    id_matiere INT NOT NULL,
    date_debut DATE NOT NULL,
    date_fin DATE,
    PRIMARY KEY (id_etudiant, id_matiere, date_debut), -- clé primaire composée pour éviter les doublons
    FOREIGN KEY (id_etudiant) REFERENCES Etudiant(id_etudiant), -- contrainte de clé étrangère vers la table Etudiant
    FOREIGN KEY (id_matiere) REFERENCES Matiere(id_matiere) -- contrainte de clé étrangère vers la table Matiere
);




