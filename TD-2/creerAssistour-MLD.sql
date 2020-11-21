-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                           PostgreSQL
--                        (21/11/2020 20:31:07)
-- -----------------------------------------------------------------------------
--      Nom de la base : assistour
--      Projet : 
--      Auteur : LLA
--      Date de dernière modification : 21/11/2020 20:29:46
-- -----------------------------------------------------------------------------

drop database assistour;
-- -----------------------------------------------------------------------------
--       CREATION DE LA BASE 
-- -----------------------------------------------------------------------------

CREATE DATABASE assistour;

-- -----------------------------------------------------------------------------
--       TABLE : RAPATRIEMENT
-- -----------------------------------------------------------------------------

CREATE TABLE RAPATRIEMENT
   (
    NUMR int4 NOT NULL  ,
    NUM_S int4 NOT NULL  ,
    NUM_ORDRE_R int4 NULL  ,
    COUT_R money NULL  ,
    VILLE_DEPART_R varchar NULL  ,
    VILLE_ARRIVEE_R varchar NULL  
,   CONSTRAINT PK_RAPATRIEMENT PRIMARY KEY (NUMR)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RAPATRIEMENT
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RAPATRIEMENT_SINISTRE
     ON RAPATRIEMENT (NUM_S)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : TYPEOPERATION
-- -----------------------------------------------------------------------------

CREATE TABLE TYPEOPERATION
   (
    CODETO char(32) NOT NULL  ,
    LIBELLETO varchar NULL  
,   CONSTRAINT PK_TYPEOPERATION PRIMARY KEY (CODETO)
   );

-- -----------------------------------------------------------------------------
--       TABLE : MARQUE
-- -----------------------------------------------------------------------------

CREATE TABLE MARQUE
   (
    NUM_INSEE int4 NOT NULL  ,
    RAISON_SOCIAL  varchar NULL  
,   CONSTRAINT PK_MARQUE PRIMARY KEY (NUM_INSEE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : COULEUR
-- -----------------------------------------------------------------------------

CREATE TABLE COULEUR
   (
    CODECOULEUR char(32) NOT NULL  ,
    LIBELLE varchar NULL  
,   CONSTRAINT PK_COULEUR PRIMARY KEY (CODECOULEUR)
   );

-- -----------------------------------------------------------------------------
--       TABLE : GARAGE
-- -----------------------------------------------------------------------------

CREATE TABLE GARAGE
   (
    NUM_G int4 NOT NULL  ,
    NUM_INSEE int4 NULL  ,
    NOM_G varchar NULL  ,
    ADRESSE_G varchar NULL  ,
    TELEPHONE_G varchar NULL  ,
    FORFAIT_G money NULL  ,
    AVANCE_FOND_G bool NULL  
,   CONSTRAINT PK_GARAGE PRIMARY KEY (NUM_G)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE GARAGE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_GARAGE_MARQUE
     ON GARAGE (NUM_INSEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : VEHICULE
-- -----------------------------------------------------------------------------

CREATE TABLE VEHICULE
   (
    IMMATRICULATION char(32) NOT NULL  ,
    NUMADHERENT int4 NOT NULL  ,
    IDTYPACONTRAT int4 NOT NULL  ,
    NUM_INSEE int4 NOT NULL  ,
    TYPE  varchar NULL  ,
    MODEL  varchar NULL  ,
    DATE_MISE_EN_CIRCULATION date NULL  
,   CONSTRAINT PK_VEHICULE PRIMARY KEY (IMMATRICULATION)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE VEHICULE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_VEHICULE_ADHERENT
     ON VEHICULE (NUMADHERENT)
    ;

CREATE  INDEX I_FK_VEHICULE_TYPECONTRAT
     ON VEHICULE (IDTYPACONTRAT)
    ;

CREATE  INDEX I_FK_VEHICULE_MARQUE
     ON VEHICULE (NUM_INSEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : COMPAGNIETRANSPORT
-- -----------------------------------------------------------------------------

CREATE TABLE COMPAGNIETRANSPORT
   (
    NUMINSEE int4 NOT NULL  ,
    RAISONSOCIAL varchar NULL  ,
    TYPETRANSPORT varchar NULL  ,
    HORAIRE time NULL  
,   CONSTRAINT PK_COMPAGNIETRANSPORT PRIMARY KEY (NUMINSEE)
   );

-- -----------------------------------------------------------------------------
--       TABLE : TECHNICIENASSISTANCE
-- -----------------------------------------------------------------------------

CREATE TABLE TECHNICIENASSISTANCE
   (
    IDTA int4 NOT NULL  ,
    NOM_TA varchar NULL  ,
    PRENOM_TA varchar NULL  
,   CONSTRAINT PK_TECHNICIENASSISTANCE PRIMARY KEY (IDTA)
   );

-- -----------------------------------------------------------------------------
--       TABLE : HOTEL
-- -----------------------------------------------------------------------------

CREATE TABLE HOTEL
   (
    NUMH int4 NOT NULL  ,
    NOM_H varchar NULL  ,
    ADRESS_H  varchar NULL  ,
    TELEPHONE_H  varchar NULL  ,
    PRIX_NUIT_H money NULL  
,   CONSTRAINT PK_HOTEL PRIMARY KEY (NUMH)
   );

-- -----------------------------------------------------------------------------
--       TABLE : ADHERENT
-- -----------------------------------------------------------------------------

CREATE TABLE ADHERENT
   (
    NUMADHERENT int4 NOT NULL  ,
    NOMADHERENT  varchar NULL  ,
    PRENOMADHERENT  varchar NULL  ,
    ADRESSEADHERENT  varchar NULL  ,
    CODEPOSTALEADHERENT char(32) NULL  ,
    VILLEADHERENT  varchar NULL  ,
    TELEPHONEADHERENT  varchar NULL  
,   CONSTRAINT PK_ADHERENT PRIMARY KEY (NUMADHERENT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : REALISATION
-- -----------------------------------------------------------------------------

CREATE TABLE REALISATION
   (
    IMMATRICULATION char(32) NOT NULL  ,
    CODETO char(32) NOT NULL  ,
    NUM_S int4 NOT NULL  
,   CONSTRAINT PK_REALISATION PRIMARY KEY (IMMATRICULATION, CODETO)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE REALISATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_REALISATION_TYPEOPERATION
     ON REALISATION (CODETO)
    ;

CREATE  INDEX I_FK_REALISATION_SINISTRE
     ON REALISATION (NUM_S)
    ;

CREATE  INDEX I_FK_REALISATION_VEHICULE
     ON REALISATION (IMMATRICULATION)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : EVALUATION
-- -----------------------------------------------------------------------------

CREATE TABLE EVALUATION
   (
    NUM_S int4 NOT NULL  ,
    NUMH int4 NOT NULL  ,
    CODECOULEUR char(32) NOT NULL  
,   CONSTRAINT PK_EVALUATION PRIMARY KEY (NUM_S, NUMH)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE EVALUATION
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_EVALUATION_HOTEL
     ON EVALUATION (NUMH)
    ;

CREATE  INDEX I_FK_EVALUATION_SINISTRE
     ON EVALUATION (NUM_S)
    ;

CREATE  INDEX I_FK_EVALUATION_COULEUR
     ON EVALUATION (CODECOULEUR)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : TYPECONTRAT
-- -----------------------------------------------------------------------------

CREATE TABLE TYPECONTRAT
   (
    IDTYPACONTRAT int4 NOT NULL  ,
    NOMTYPECONTRAT  varchar NULL  ,
    PRIX money NULL  
,   CONSTRAINT PK_TYPECONTRAT PRIMARY KEY (IDTYPACONTRAT)
   );

-- -----------------------------------------------------------------------------
--       TABLE : SINISTRE
-- -----------------------------------------------------------------------------

CREATE TABLE SINISTRE
   (
    NUM_S int4 NOT NULL  ,
    IDTA int4 NOT NULL  ,
    NUM_G int4 NOT NULL  ,
    IMMATRICULATION char(32) NOT NULL  ,
    DATE_S date NULL  ,
    HEURE_S time NULL  ,
    CAUSE_S varchar NULL  ,
    DIAGNOSTIC_S varchar NULL  ,
    LIEU_S varchar NULL  ,
    NBPER_S int4 NULL  
,   CONSTRAINT PK_SINISTRE PRIMARY KEY (NUM_S)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE SINISTRE
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_SINISTRE_TECHNICIENASSIST
     ON SINISTRE (IDTA)
    ;

CREATE  INDEX I_FK_SINISTRE_GARAGE
     ON SINISTRE (NUM_G)
    ;

CREATE  INDEX I_FK_SINISTRE_VEHICULE
     ON SINISTRE (IMMATRICULATION)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : RAPATRIER
-- -----------------------------------------------------------------------------

CREATE TABLE RAPATRIER
   (
    NUMR int4 NOT NULL  ,
    NUMINSEE int4 NOT NULL  
,   CONSTRAINT PK_RAPATRIER PRIMARY KEY (NUMR, NUMINSEE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE RAPATRIER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_RAPATRIER_RAPATRIEMENT
     ON RAPATRIER (NUMR)
    ;

CREATE  INDEX I_FK_RAPATRIER_COMPAGNIETRANSP
     ON RAPATRIER (NUMINSEE)
    ;

-- -----------------------------------------------------------------------------
--       TABLE : HEBERGER
-- -----------------------------------------------------------------------------

CREATE TABLE HEBERGER
   (
    NUMH int4 NOT NULL  ,
    NUM_S int4 NOT NULL  ,
    DATE date NOT NULL  ,
    NBNUIT int4 NULL  
,   CONSTRAINT PK_HEBERGER PRIMARY KEY (NUMH, NUM_S, DATE)
   );

-- -----------------------------------------------------------------------------
--       INDEX DE LA TABLE HEBERGER
-- -----------------------------------------------------------------------------

CREATE  INDEX I_FK_HEBERGER_HOTEL
     ON HEBERGER (NUMH)
    ;

CREATE  INDEX I_FK_HEBERGER_SINISTRE
     ON HEBERGER (NUM_S)
    ;


-- -----------------------------------------------------------------------------
--       CREATION DES REFERENCES DE TABLE
-- -----------------------------------------------------------------------------


ALTER TABLE RAPATRIEMENT ADD 
     CONSTRAINT FK_RAPATRIEMENT_SINISTRE
          FOREIGN KEY (NUM_S)
               REFERENCES SINISTRE (NUM_S);

ALTER TABLE GARAGE ADD 
     CONSTRAINT FK_GARAGE_MARQUE
          FOREIGN KEY (NUM_INSEE)
               REFERENCES MARQUE (NUM_INSEE);

ALTER TABLE VEHICULE ADD 
     CONSTRAINT FK_VEHICULE_ADHERENT
          FOREIGN KEY (NUMADHERENT)
               REFERENCES ADHERENT (NUMADHERENT);

ALTER TABLE VEHICULE ADD 
     CONSTRAINT FK_VEHICULE_TYPECONTRAT
          FOREIGN KEY (IDTYPACONTRAT)
               REFERENCES TYPECONTRAT (IDTYPACONTRAT);

ALTER TABLE VEHICULE ADD 
     CONSTRAINT FK_VEHICULE_MARQUE
          FOREIGN KEY (NUM_INSEE)
               REFERENCES MARQUE (NUM_INSEE);

ALTER TABLE REALISATION ADD 
     CONSTRAINT FK_REALISATION_TYPEOPERATION
          FOREIGN KEY (CODETO)
               REFERENCES TYPEOPERATION (CODETO);

ALTER TABLE REALISATION ADD 
     CONSTRAINT FK_REALISATION_SINISTRE
          FOREIGN KEY (NUM_S)
               REFERENCES SINISTRE (NUM_S);

ALTER TABLE REALISATION ADD 
     CONSTRAINT FK_REALISATION_VEHICULE
          FOREIGN KEY (IMMATRICULATION)
               REFERENCES VEHICULE (IMMATRICULATION);

ALTER TABLE EVALUATION ADD 
     CONSTRAINT FK_EVALUATION_HOTEL
          FOREIGN KEY (NUMH)
               REFERENCES HOTEL (NUMH);

ALTER TABLE EVALUATION ADD 
     CONSTRAINT FK_EVALUATION_SINISTRE
          FOREIGN KEY (NUM_S)
               REFERENCES SINISTRE (NUM_S);

ALTER TABLE EVALUATION ADD 
     CONSTRAINT FK_EVALUATION_COULEUR
          FOREIGN KEY (CODECOULEUR)
               REFERENCES COULEUR (CODECOULEUR);

ALTER TABLE SINISTRE ADD 
     CONSTRAINT FK_SINISTRE_TECHNICIENASSISTANCE
          FOREIGN KEY (IDTA)
               REFERENCES TECHNICIENASSISTANCE (IDTA);

ALTER TABLE SINISTRE ADD 
     CONSTRAINT FK_SINISTRE_GARAGE
          FOREIGN KEY (NUM_G)
               REFERENCES GARAGE (NUM_G);

ALTER TABLE SINISTRE ADD 
     CONSTRAINT FK_SINISTRE_VEHICULE
          FOREIGN KEY (IMMATRICULATION)
               REFERENCES VEHICULE (IMMATRICULATION);

ALTER TABLE RAPATRIER ADD 
     CONSTRAINT FK_RAPATRIER_RAPATRIEMENT
          FOREIGN KEY (NUMR)
               REFERENCES RAPATRIEMENT (NUMR);

ALTER TABLE RAPATRIER ADD 
     CONSTRAINT FK_RAPATRIER_COMPAGNIETRANSPORT
          FOREIGN KEY (NUMINSEE)
               REFERENCES COMPAGNIETRANSPORT (NUMINSEE);

ALTER TABLE HEBERGER ADD 
     CONSTRAINT FK_HEBERGER_HOTEL
          FOREIGN KEY (NUMH)
               REFERENCES HOTEL (NUMH);

ALTER TABLE HEBERGER ADD 
     CONSTRAINT FK_HEBERGER_SINISTRE
          FOREIGN KEY (NUM_S)
               REFERENCES SINISTRE (NUM_S);


-- -----------------------------------------------------------------------------
--                FIN DE GENERATION
-- -----------------------------------------------------------------------------
