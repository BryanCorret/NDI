
DROP TABLE IF EXISTS AVOIRPOURHISTOIREBATEAU;
DROP TABLE IF EXISTS AVOIRPOURHISTOIREPERSONNE;
DROP TABLE IF EXISTS AVOIRPOURHISTOIRESAUVETAGE;
DROP TABLE IF EXISTS AVOIRPOURHISTOIRESTATION;
DROP TABLE IF EXISTS AVOIRPOURHISTOIRETECHNIQUE;
DROP TABLE IF EXISTS SAUVETAGE;
DROP TABLE IF EXISTS MATERIEL;
DROP TABLE IF EXISTS TECHNIQUE;
DROP TABLE IF EXISTS BATEAUUSE;
DROP TABLE IF EXISTS BATEAU;
DROP TABLE IF EXISTS TEXTE;
DROP TABLE IF EXISTS ETREDECORE;
DROP TABLE IF EXISTS AVOIRPOURIMAGE;
DROP TABLE IF EXISTS IMAGES;
DROP TABLE IF EXISTS NATIONALITE;
DROP TABLE IF EXISTS POSTE;
DROP TABLE IF EXISTS FONCTION;
DROP TABLE IF EXISTS GRADE;
DROP TABLE IF EXISTS ETREENRELATION;
DROP TABLE IF EXISTS RELATION;
DROP TABLE IF EXISTS STATION;
DROP TABLE IF EXISTS ETREDECEDEA;
DROP TABLE IF EXISTS ETRENEA;
DROP TABLE IF EXISTS PAYS;
DROP TABLE IF EXISTS DEPARTEMENT;
DROP TABLE IF EXISTS VILLE;
DROP TABLE IF EXISTS PERSONNE;


CREATE TABLE PERSONNE (
  idP int AUTO_INCREMENT,
  nomP varchar(30),
  prenomP varchar(30),
  dateRetraiteP date,
  PRIMARY KEY (idP)
);

CREATE TABLE VILLE (
  idVille int AUTO_INCREMENT,
  nomVille varchar(30),
  codePostalVille int,
  PRIMARY KEY (idVille)
);

CREATE TABLE DEPARTEMENT (
  idDepartement int AUTO_INCREMENT,
  nomDepartement varchar(30),
  PRIMARY KEY (idDepartement)
);

CREATE TABLE PAYS (
  idPays int AUTO_INCREMENT,
  nomPays varchar(30),
  PRIMARY KEY (idPays)
);

CREATE TABLE ETRENEA (
  idP int,
  idVille int,
  idDepartement int,
  idPays int,
  dateNaissP date,
  PRIMARY KEY (idP),
  FOREIGN KEY (idP) REFERENCES PERSONNE(idP),
  FOREIGN KEY (idVille) REFERENCES VILLE(idVille),
  FOREIGN KEY (idDepartement) REFERENCES DEPARTEMENT(idDepartement),
  FOREIGN KEY (idPays) REFERENCES PAYS(idPays)
);

CREATE TABLE ETREDECEDEA (
  idP int,
  idVille int,
  idDepartement int,
  idPays int,
  dateDecesP date,
  PRIMARY KEY (idP),
  FOREIGN KEY (idP) REFERENCES PERSONNE(idP),
  FOREIGN KEY (idVille) REFERENCES VILLE(idVille),
  FOREIGN KEY (idDepartement) REFERENCES DEPARTEMENT(idDepartement),
  FOREIGN KEY (idPays) REFERENCES PAYS(idPays)

);

CREATE TABLE STATION (
  idStation int AUTO_INCREMENT,
  idVille int,
  PRIMARY KEY (idStation),
  FOREIGN KEY (idVille) REFERENCES VILLE(idVille)
);

CREATE TABLE RELATION (
  idRelation int AUTO_INCREMENT,
  nomRelation varchar(30),
  PRIMARY KEY (idRelation)
);

CREATE TABLE ETREENRELATION (
  idRelation int,
  idP1 int,
  idP2 int,
  dateRelation date,
  PRIMARY KEY (idRelation, idP1, idP2),
  FOREIGN KEY (idP1) REFERENCES PERSONNE(idP),
  FOREIGN KEY (idP2) REFERENCES PERSONNE(idP),
  FOREIGN KEY (idRelation) REFERENCES RELATION(idRelation)

);

CREATE TABLE GRADE (
  idGrade int AUTO_INCREMENT,
  nomGrade varchar(30),
  PRIMARY KEY (idGrade)
);

CREATE TABLE FONCTION (
  idFonction int AUTO_INCREMENT,
  nomFonction varchar(30),
  PRIMARY KEY (idFonction)
);

CREATE TABLE POSTE (
  idPoste int AUTO_INCREMENT,
  idP int,
  idGrade int,
  idFonction int,
  dateDebut date,
  dateFin date,
  complement varchar(30),
  PRIMARY KEY (idPoste),
  FOREIGN KEY (idP) REFERENCES PERSONNE(idP),
  FOREIGN KEY (idGrade) REFERENCES GRADE(idGrade),
  FOREIGN KEY (idFonction) REFERENCES FONCTION(idFonction)

);

CREATE TABLE NATIONALITE (
  idNatio int AUTO_INCREMENT,
  nomNatio varchar(30),
  PRIMARY KEY (idNatio)
);

CREATE TABLE IMAGES (
  idImage int AUTO_INCREMENT,
  nomImage varchar(30),
  PRIMARY KEY (idImage)
);

CREATE TABLE AVOIRPOURIMAGE (
  idImage int,
  idP int,
  PRIMARY KEY (idImage, idP),
  FOREIGN KEY (idP) REFERENCES PERSONNE(idP),
  FOREIGN KEY (idImage) REFERENCES IMAGES(idImage)
);

CREATE TABLE ETREDECORE (
  idImage int,
  idP int,
  nomDecoration varchar(100),
  dateDecoration date,
  PRIMARY KEY (nomDecoration, idP),
  FOREIGN KEY (idP) REFERENCES PERSONNE(idP)

);

CREATE TABLE TEXTE (
  idTexte int AUTO_INCREMENT,
  titreTexte varchar(30),
  contenuTexte varchar(1000),
  sourceTexte varchar(100),
  PRIMARY KEY (idTexte)
);


CREATE TABLE BATEAU (
  idBat int AUTO_INCREMENT,
  nomBat varchar(30),
  PRIMARY KEY (idBat)
);

CREATE TABLE BATEAUUSE (
  idBat int AUTO_INCREMENT,
  typeBat varchar(30),
  tailleBat varchar(30),
  dateEssaiBat date,
  dateMiseEnPlaceBat date,
  PRIMARY KEY (idBat),
  FOREIGN KEY (idBat) REFERENCES BATEAU(idBat)
); 

CREATE TABLE TECHNIQUE (
  idTechnique int AUTO_INCREMENT,
  nomTechnique varchar(30),
  PRIMARY KEY (idTechnique)
); 

CREATE TABLE MATERIEL (
  idMateriel int AUTO_INCREMENT,
  nomMateriel varchar(30),
  PRIMARY KEY (idMateriel)
); 

CREATE TABLE SAUVETAGE (
  idSauvetage int AUTO_INCREMENT,
  idBatUSE int,
  idBat int,
  idMateriel int,
  idTechnique int,
  dateSauvetage int,
  nbPersSauvees int,
  nbPersDecedees int,
  PRIMARY KEY (idSauvetage),
  FOREIGN KEY (idBatUSE) REFERENCES BATEAUUSE(idBat),
  FOREIGN KEY (idBat) REFERENCES BATEAU(idBat),
  FOREIGN KEY (idMateriel) REFERENCES MATERIEL(idMateriel),
  FOREIGN KEY (idTechnique) REFERENCES TECHNIQUE(idTechnique)
);

CREATE TABLE AVOIRPOURHISTOIRESTATION (
  idTexte int,
  idStation int,
  dateHistoire date,
  PRIMARY KEY (idTexte, idStation),
  FOREIGN KEY (idTexte) REFERENCES TEXTE(idTexte),
  FOREIGN KEY (idStation) REFERENCES STATION(idStation)
);

CREATE TABLE AVOIRPOURHISTOIREPERSONNE (
  idP int,
  idTexte int,
  dateHistoire date,
  PRIMARY KEY (idP, idTexte),
  FOREIGN KEY (idTexte) REFERENCES TEXTE(idTexte),
  FOREIGN KEY (idP) REFERENCES PERSONNE(idP)

);

CREATE TABLE AVOIRPOURHISTOIRESAUVETAGE (
  idSauvetage int,
  idTexte int,
  dateHistoire date,
  PRIMARY KEY (idSauvetage, idTexte),
  FOREIGN KEY (idTexte) REFERENCES TEXTE(idTexte),
  FOREIGN KEY (idSauvetage) REFERENCES SAUVETAGE(idSauvetage)
);

CREATE TABLE AVOIRPOURHISTOIREBATEAU (
  idbat int,
  idTexte int,
  dateHistoire date,
  PRIMARY KEY (idBat, idTexte),
  FOREIGN KEY (idTexte) REFERENCES TEXTE(idTexte),
  FOREIGN KEY (idBat) REFERENCES BATEAU(idBat)
);

CREATE TABLE AVOIRPOURHISTOIRETECHNIQUE (
  idTechnique int,
  idTexte int,
  dateHistoire date,
  PRIMARY KEY (idTechnique, idTexte),
  FOREIGN KEY (idTexte) REFERENCES TEXTE(idTexte),
  FOREIGN KEY (idTechnique) REFERENCES TECHNIQUE(idTechnique)
);
