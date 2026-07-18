# Approche 1 : Via Script

## Objectif
Charger les données dans la base NoSQL en utilisant des scripts et commandes CLI.

## Étapes réalisées
1. Préparation du fichier JSON avec mongoexport dans Atlas

   ```powershell
     mongoexport --uri="mongodb+srv://<password>:Mouha12@clustergestionnotes.symoieh.mongodb.net/gestion_notes" `
     --collection=etudiants `
     --out="etudiants.json" `
     --jsonArray


2. Importation JSON dans Compass

 ```powershell
     mongoimport --uri="mongodb://localhost:27017/gestion_notes" `
     --collection=etudiants `
     --file="C:\Users\hp\OneDrive\Documents\DATA\Data_Engineering\Projets\gestion_notes\export_data\etudiants.json" `
     --jsonArray


3. Préparation du fichier CSV avec mongoexport

 ```powershell
    mongoexport --uri="mongodb+srv://hameth78:Mouha12@clustergestionnotes.symoieh.mongodb.net/gestion_notes" `
    --collection=etudiants `
    --type=csv `
    --fields=id_etudiant,nom,prenom,date_naissance,email,adresse,niveau_id,filiere_id `
    --out="etudiants.csv"


4. Préparation du fichier `etudiants.csv` avec les données exportées.

  ```powershell
    mongoimport --uri="mongodb://localhost:27017/gestion_notes" `
    --collection=etudiants `
    --type=csv `
    --headerline `
    --file="C:\Users\hp\OneDrive\Documents\DATA\Data_Engineering\Projets\gestion_notes\export_data\etudiants.csv"
