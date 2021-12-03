
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
  idP int,
  nomP varchar(30),
  prenomP varchar(30),
  dateRetraiteP date,
  PRIMARY KEY (idP)
);

CREATE TABLE VILLE (
  idVille int,
  nomVille varchar(30),
  codePostalVille int,
  PRIMARY KEY (idVille)
);

CREATE TABLE DEPARTEMENT (
  idDepartement int,
  nomDepartement varchar(30),
  PRIMARY KEY (idDepartement)
);

CREATE TABLE PAYS (
  idPays int,
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
  idStation int,
  PRIMARY KEY (idStation)
);

CREATE TABLE RELATION (
  idRelation int,
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
  idGrade int,
  nomGrade varchar(30),
  PRIMARY KEY (idGrade)
);

CREATE TABLE FONCTION (
  idFonction int,
  nomFonction varchar(30),
  PRIMARY KEY (idFonction)
);

CREATE TABLE POSTE (
  idPoste int,
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
  idNatio int,
  nomNatio varchar(30),
  PRIMARY KEY (idNatio)
);

CREATE TABLE IMAGES (
  idImage int,
  nomImage varchar(30),
  PRIMARY KEY (idImage)
);

CREATE TABLE AVOIRPOURIMAGE (
  idImage int,
  idP int,
  PRIMARY KEY (idImage, idP),
  FOREIGN KEY (idP) REFERENCES PERSONNE(idP),
  FOREIGN KEY (idImage) REFERENCES IMAGE(idImage)
);

CREATE TABLE ETREDECORE (
  idImage int,
  idP int,
  nomDecoration varchar(30),
  dateDecoration date,
  PRIMARY KEY (nomDecoration, idP),
  FOREIGN KEY (idP) REFERENCES PERSONNE(idP)

);

CREATE TABLE TEXTE (
  idTexte int,
  titreTexte varchar(30),
  contenuTexte varchar(1000),
  sourceTexte varchar(100),
  PRIMARY KEY (idTexte)
);


CREATE TABLE BATEAU (
  idBat int,
  nomBat varchar(30),
  PRIMARY KEY (idBat)
);

CREATE TABLE BATEAUUSE (
  idBat int,
  nomBat varchar(30),
  typeBat varchar(30),
  tailleBat varchar(30),
  dateEssaiBat date,
  dateMiseEnPlaceBat date,
  PRIMARY KEY (idBat),
  FOREIGN KEY (idBat) REFERENCES BATEAU(idBat)
); 

CREATE TABLE TECHNIQUE (
  idTechnique int,
  nomTechnique varchar(30),
  PRIMARY KEY (idTechnique)
); 

CREATE TABLE MATERIEL (
  idMateriel int,
  nomMateriel varchar(30),
  PRIMARY KEY (idMateriel)
); 

CREATE TABLE SAUVETAGE (
  idSauvetage int,
  idBateauUSE int,
  idBateau int,
  idMateriel int,
  idTechnique int,
  dateSauvetage int,
  nbPersSauvees int,
  nbPersDecedees int,
  PRIMARY KEY (idSauvetage),
  FOREIGN KEY (idBateauUSE) REFERENCES BATEAUUSE(idBateau),
  FOREIGN KEY (idBateau) REFERENCES BATEAU(idBateau),
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
